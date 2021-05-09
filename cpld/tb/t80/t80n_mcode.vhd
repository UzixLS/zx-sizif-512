--
-- Z80 compatible microprocessor core
--
-- Version : 0242
--
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
--
-- Modifications for the ZX Spectrum Next Project
-- Copyright 2020 Fabio Belavenuto, Victor Trucco, Charlie Ingley, Garry Lancaster, ACX
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
-- http://www.opencores.org/cvsweb.shtml/t80/
--
-- Limitations :
--
-- File history :
--
-- 0208 : First complete release
--
-- 0211 : Fixed IM 1
--
-- 0214 : Fixed mostly flags, only the block instructions now fail the zex regression test
--
-- 0235 : Added IM 2 fix by Mike Johnson
--
-- 0238 : Added NoRead signal
--
-- 0238b: Fixed instruction timing for POP and DJNZ
--
-- 0240 : Added (IX/IY+d) states, removed op-codes from mode 2 and added all remaining mode 3 op-codes
--
-- 0242 : Fixed I/O instruction timing, cleanup
--

-- This file is part of the ZX Spectrum Next Project
-- <https://gitlab.com/SpectrumNext/ZX_Spectrum_Next_FPGA/tree/master/cores>
--
-- Modifications for the ZX Spectrum Next were made by:
--
-- Fabio Belavenuto : partial fix of wait bug
-- Victor Trucco, Fabio Belavenuto, Garry Lancaster : additional instructions
-- Charlie Ingley : complete fix of wait logic
-- ACX : implement undocumented flags for SLI r,(IY+s)

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.T80N_Pack.all;
use work.Z80N_pack.all;

entity T80N_MCode is
   generic(
      Mode : integer := 0;
      Flag_C : integer := 0;
      Flag_N : integer := 1;
      Flag_P : integer := 2;
      Flag_X : integer := 3;
      Flag_H : integer := 4;
      Flag_Y : integer := 5;
      Flag_Z : integer := 6;
      Flag_S : integer := 7
   );
   port(
      IR          : in std_logic_vector(7 downto 0);
      ISet        : in std_logic_vector(1 downto 0);
      MCycle         : in std_logic_vector(2 downto 0);
      F           : in std_logic_vector(7 downto 0);
      NMICycle    : in std_logic;
      IntCycle    : in std_logic;
      XY_State    : in std_logic_vector(1 downto 0);
      MCycles        : out std_logic_vector(2 downto 0);
      TStates        : out std_logic_vector(2 downto 0);
      Prefix         : out std_logic_vector(1 downto 0); -- None,BC,ED,DD/FD
      Inc_PC         : out std_logic;
      Inc_WZ         : out std_logic;
      IncDec_16      : out std_logic_vector(3 downto 0); -- BC,DE,HL,SP   0 is inc
      Read_To_Reg    : out std_logic;
      Read_To_Acc    : out std_logic;
      Set_BusA_To : out std_logic_vector(3 downto 0); -- B,C,D,E,H,L,DI/DB,A,SP(L),SP(M),0,F
      Set_BusB_To : out std_logic_vector(3 downto 0); -- B,C,D,E,H,L,DI,A,SP(L),SP(M),1,F,PC(L),PC(M),0
      ALU_Op         : out std_logic_vector(3 downto 0);
         -- ADD, ADC, SUB, SBC, AND, XOR, OR, CP, ROT, BIT, SET, RES, DAA, RLD, RRD, None
      Save_ALU    : out std_logic;
      PreserveC      : out std_logic;
      Arith16        : out std_logic;
      Set_Addr_To    : out std_logic_vector(2 downto 0); -- aNone,aXY,aIOA,aSP,aBC,aDE,aZI
      IORQ        : out std_logic;
      Jump        : out std_logic;
      JumpE       : out std_logic;
      JumpXY         : out std_logic;
      Call        : out std_logic;
      RstP        : out std_logic;
      LDZ            : out std_logic;
      LDW            : out std_logic;
      LDSPHL         : out std_logic;
      Special_LD     : out std_logic_vector(2 downto 0); -- A,I;A,R;I,A;R,A;None
      ExchangeDH     : out std_logic;
      ExchangeRp     : out std_logic;
      ExchangeAF     : out std_logic;
      ExchangeRS     : out std_logic;
      I_DJNZ         : out std_logic;
      I_CPL       : out std_logic;
      I_CCF       : out std_logic;
      I_SCF       : out std_logic;
      I_RETN         : out std_logic;
      I_BT        : out std_logic;
      I_BC        : out std_logic;
      I_BTR       : out std_logic;
      I_RLD       : out std_logic;
      I_RRD       : out std_logic;
      I_INRC         : out std_logic;
      SetDI       : out std_logic;
      SetEI       : out std_logic;
      IMode       : out std_logic_vector(1 downto 0);
      Halt        : out std_logic;
      NoRead         : out std_logic;
      Write       : out std_logic;
      XYbit_undoc    : out std_logic;
      
      -- extended functions
      ext_ACC_i         : in std_logic_vector(7 downto 0);
      ext_Data_i        : in std_logic_vector(7 downto 0);
      
      Z80N_dout_o       : out std_logic := '0';
      Z80N_data_o       : out std_logic_vector(15 downto 0);
      Z80N_command_o    : out Z80N_seq
      
   );
end T80N_MCode;

architecture rtl of T80N_MCode is

   constant aNone : std_logic_vector(2 downto 0) := "111";
   constant aBC   : std_logic_vector(2 downto 0) := "000";
   constant aDE   : std_logic_vector(2 downto 0) := "001";
   constant aXY   : std_logic_vector(2 downto 0) := "010";
   constant aIOA  : std_logic_vector(2 downto 0) := "100";
   constant aSP   : std_logic_vector(2 downto 0) := "101";
   constant aZI   : std_logic_vector(2 downto 0) := "110";
-- constant aNone : std_logic_vector(2 downto 0) := "000";
-- constant aXY   : std_logic_vector(2 downto 0) := "001";
-- constant aIOA  : std_logic_vector(2 downto 0) := "010";
-- constant aSP   : std_logic_vector(2 downto 0) := "011";
-- constant aBC   : std_logic_vector(2 downto 0) := "100";
-- constant aDE   : std_logic_vector(2 downto 0) := "101";
-- constant aZI   : std_logic_vector(2 downto 0) := "110";

-- signal Z80N_data_s   : std_logic_vector(15 downto 0) := (others=>'1');
   
   function is_cc_true(
      F : std_logic_vector(7 downto 0);
      cc : bit_vector(2 downto 0)
      ) return boolean is
   begin
      if Mode = 3 then
         case cc is
         when "000" => return F(7) = '0'; -- NZ
         when "001" => return F(7) = '1'; -- Z
         when "010" => return F(4) = '0'; -- NC
         when "011" => return F(4) = '1'; -- C
         when "100" => return false;
         when "101" => return false;
         when "110" => return false;
         when "111" => return false;
         end case;
      else
         case cc is
         when "000" => return F(6) = '0'; -- NZ
         when "001" => return F(6) = '1'; -- Z
         when "010" => return F(0) = '0'; -- NC
         when "011" => return F(0) = '1'; -- C
         when "100" => return F(2) = '0'; -- PO
         when "101" => return F(2) = '1'; -- PE
         when "110" => return F(7) = '0'; -- P
         when "111" => return F(7) = '1'; -- M
         end case;
      end if;
   end;

begin

   --Z80N_data_o <= Z80N_data_s;

   process (IR, ISet, MCycle, F, NMICycle, IntCycle, ext_Data_i, ext_ACC_i)
      variable DDD : std_logic_vector(2 downto 0);
      variable SSS : std_logic_vector(2 downto 0);
      variable DPair : std_logic_vector(1 downto 0);
      variable IRB : bit_vector(7 downto 0);
   begin
      DDD := IR(5 downto 3);
      SSS := IR(2 downto 0);
      DPair := IR(5 downto 4);
      IRB := to_bitvector(IR);

      MCycles <= "001";
      if MCycle = "001" then
         TStates <= "100";
      else
         TStates <= "011";
      end if;
      Z80N_command_o <= NONE; 
      --Z80N_data_o <= (others=>'0'); -- need to be a latch. dont work if we set the byte to 0
      Z80N_dout_o <= '0';
      Prefix <= "00";
      Inc_PC <= '0';
      Inc_WZ <= '0';
      IncDec_16 <= "0000";
      Read_To_Acc <= '0';
      Read_To_Reg <= '0';
      Set_BusB_To <= "0000";
      Set_BusA_To <= "0000";
      ALU_Op <= "0" & IR(5 downto 3);
      Save_ALU <= '0';
      PreserveC <= '0';
      Arith16 <= '0';
      IORQ <= '0';
      Set_Addr_To <= aNone;
      Jump <= '0';
      JumpE <= '0';
      JumpXY <= '0';
      Call <= '0';
      RstP <= '0';
      LDZ <= '0';
      LDW <= '0';
      LDSPHL <= '0';
      Special_LD <= "000";
      ExchangeDH <= '0';
      ExchangeRp <= '0';
      ExchangeAF <= '0';
      ExchangeRS <= '0';
      I_DJNZ <= '0';
      I_CPL <= '0';
      I_CCF <= '0';
      I_SCF <= '0';
      I_RETN <= '0';
      I_BT <= '0';
      I_BC <= '0';
      I_BTR <= '0';
      I_RLD <= '0';
      I_RRD <= '0';
      I_INRC <= '0';
      SetDI <= '0';
      SetEI <= '0';
      IMode <= "11";
      Halt <= '0';
      NoRead <= '0';
      Write <= '0';
      XYbit_undoc <= '0';

      case ISet is
      when "00" =>

------------------------------------------------------------------------------
--
-- Unprefixed instructions
--
------------------------------------------------------------------------------

      case IRB is
-- 8 BIT LOAD GROUP
      when "01000000"|"01000001"|"01000010"|"01000011"|"01000100"|"01000101"|"01000111"
         |"01001000"|"01001001"|"01001010"|"01001011"|"01001100"|"01001101"|"01001111"
         |"01010000"|"01010001"|"01010010"|"01010011"|"01010100"|"01010101"|"01010111"
         |"01011000"|"01011001"|"01011010"|"01011011"|"01011100"|"01011101"|"01011111"
         |"01100000"|"01100001"|"01100010"|"01100011"|"01100100"|"01100101"|"01100111"
         |"01101000"|"01101001"|"01101010"|"01101011"|"01101100"|"01101101"|"01101111"
         |"01111000"|"01111001"|"01111010"|"01111011"|"01111100"|"01111101"|"01111111" =>
         -- LD r,r'
         Set_BusB_To(2 downto 0) <= SSS;
         ExchangeRp <= '1';
         Set_BusA_To(2 downto 0) <= DDD;
         Read_To_Reg <= '1';
      when "00000110"|"00001110"|"00010110"|"00011110"|"00100110"|"00101110"|"00111110" =>
         -- LD r,n
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            Inc_PC <= '1';
            Set_BusA_To(2 downto 0) <= DDD;
            Read_To_Reg <= '1';
         when others => null;
         end case;
      when "01000110"|"01001110"|"01010110"|"01011110"|"01100110"|"01101110"|"01111110" =>
         -- LD r,(HL)
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
         when 2 =>
            Set_BusA_To(2 downto 0) <= DDD;
            Read_To_Reg <= '1';
         when others => null;
         end case;
      when "01110000"|"01110001"|"01110010"|"01110011"|"01110100"|"01110101"|"01110111" =>
         -- LD (HL),r
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
            Set_BusB_To(2 downto 0) <= SSS;
            Set_BusB_To(3) <= '0';
         when 2 =>
            Write <= '1';
         when others => null;
         end case;
      when "00110110" =>
         -- LD (HL),n
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            Inc_PC <= '1';
            Set_Addr_To <= aXY;
            Set_BusB_To(2 downto 0) <= SSS;
            Set_BusB_To(3) <= '0';
         when 3 =>
            Write <= '1';
         when others => null;
         end case;
      when "00001010" =>
         -- LD A,(BC)
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aBC;
         when 2 =>
            Read_To_Acc <= '1';
         when others => null;
         end case;
      when "00011010" =>
         -- LD A,(DE)
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aDE;
         when 2 =>
            Read_To_Acc <= '1';
         when others => null;
         end case;
      when "00111010" =>
         if Mode = 3 then
            -- LDD A,(HL)
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
            when 2 =>
               Read_To_Acc <= '1';
               IncDec_16 <= "1110";
            when others => null;
            end case;
         else
            -- LD A,(nn)
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
            when 4 =>
               Read_To_Acc <= '1';
            when others => null;
            end case;
         end if;
      when "00000010" =>
         -- LD (BC),A
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aBC;
            Set_BusB_To <= "0111";
         when 2 =>
            Write <= '1';
         when others => null;
         end case;
      when "00010010" =>
         -- LD (DE),A
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aDE;
            Set_BusB_To <= "0111";
         when 2 =>
            Write <= '1';
         when others => null;
         end case;
      when "00110010" =>
         if Mode = 3 then
            -- LDD (HL),A
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
               Set_BusB_To <= "0111";
            when 2 =>
               Write <= '1';
               IncDec_16 <= "1110";
            when others => null;
            end case;
         else
            -- LD (nn),A
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               Set_BusB_To <= "0111";
            when 4 =>
               Write <= '1';
            when others => null;
            end case;
         end if;

-- 16 BIT LOAD GROUP
      when "00000001"|"00010001"|"00100001"|"00110001" =>
         -- LD dd,nn
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            Inc_PC <= '1';
            Read_To_Reg <= '1';
            if DPAIR = "11" then
               Set_BusA_To(3 downto 0) <= "1000";
            else
               Set_BusA_To(2 downto 1) <= DPAIR;
               Set_BusA_To(0) <= '1';
            end if;
         when 3 =>
            Inc_PC <= '1';
            Read_To_Reg <= '1';
            if DPAIR = "11" then
               Set_BusA_To(3 downto 0) <= "1001";
            else
               Set_BusA_To(2 downto 1) <= DPAIR;
               Set_BusA_To(0) <= '0';
            end if;
         when others => null;
         end case;
      when "00101010" => --2A
         if Mode = 3 then
            -- LDI A,(HL)
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
            when 2 =>
               Read_To_Acc <= '1';
               IncDec_16 <= "0110";
            when others => null;
            end case;
         else
            -- LD HL,(nn)
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               LDW <= '1';
            when 4 =>
               Set_BusA_To(2 downto 0) <= "101"; -- L
               Read_To_Reg <= '1';
               Inc_WZ <= '1';
               Set_Addr_To <= aZI;
            when 5 =>
               Set_BusA_To(2 downto 0) <= "100"; -- H
               Read_To_Reg <= '1';
            when others => null;
            end case;
         end if;
      when "00100010" =>
         if Mode = 3 then
            -- LDI (HL),A
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
               Set_BusB_To <= "0111";
            when 2 =>
               Write <= '1';
               IncDec_16 <= "0110";
            when others => null;
            end case;
         else
            -- LD (nn),HL
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               LDW <= '1';
               Set_BusB_To <= "0101"; -- L
            when 4 =>
               Inc_WZ <= '1';
               Set_Addr_To <= aZI;
               Write <= '1';
               Set_BusB_To <= "0100"; -- H
            when 5 =>
               Write <= '1';
            when others => null;
            end case;
         end if;
      when "11111001" =>
         -- LD SP,HL
         TStates <= "110";
         LDSPHL <= '1';
      when "11000101"|"11010101"|"11100101"|"11110101" =>
         -- PUSH qq
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            TStates <= "101";
            IncDec_16 <= "1111";
            Set_Addr_TO <= aSP;
            if DPAIR = "11" then
               Set_BusB_To <= "0111";
            else
               Set_BusB_To(2 downto 1) <= DPAIR;
               Set_BusB_To(0) <= '0';
               Set_BusB_To(3) <= '0';
            end if;
         when 2 =>
            IncDec_16 <= "1111";
            Set_Addr_To <= aSP;
            if DPAIR = "11" then
               Set_BusB_To <= "1011";
            else
               Set_BusB_To(2 downto 1) <= DPAIR;
               Set_BusB_To(0) <= '1';
               Set_BusB_To(3) <= '0';
            end if;
            Write <= '1';
         when 3 =>
            Write <= '1';
         when others => null;
         end case;
      when "11000001"|"11010001"|"11100001"|"11110001" =>
         -- POP qq
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aSP;
         when 2 =>
            IncDec_16 <= "0111";
            Set_Addr_To <= aSP;
            Read_To_Reg <= '1';
            if DPAIR = "11" then
               Set_BusA_To(3 downto 0) <= "1011";
            else
               Set_BusA_To(2 downto 1) <= DPAIR;
               Set_BusA_To(0) <= '1';
            end if;
         when 3 =>
            IncDec_16 <= "0111";
            Read_To_Reg <= '1';
            if DPAIR = "11" then
               Set_BusA_To(3 downto 0) <= "0111";
            else
               Set_BusA_To(2 downto 1) <= DPAIR;
               Set_BusA_To(0) <= '0';
            end if;
         when others => null;
         end case;

-- EXCHANGE, BLOCK TRANSFER AND SEARCH GROUP
      when "11101011" =>
         if Mode /= 3 then
            -- EX DE,HL
            ExchangeDH <= '1';
         end if;
      when "00001000" =>
         if Mode = 3 then
            -- LD (nn),SP
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               LDW <= '1';
               Set_BusB_To <= "1000";
            when 4 =>
               Inc_WZ <= '1';
               Set_Addr_To <= aZI;
               Write <= '1';
               Set_BusB_To <= "1001";
            when 5 =>
               Write <= '1';
            when others => null;
            end case;
         elsif Mode < 2 then
            -- EX AF,AF'
            ExchangeAF <= '1';
         end if;
      when "11011001" =>
         if Mode = 3 then
            -- RETI
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_TO <= aSP;
            when 2 =>
               IncDec_16 <= "0111";
               Set_Addr_To <= aSP;
               LDZ <= '1';
            when 3 =>
               Jump <= '1';
               IncDec_16 <= "0111";
               I_RETN <= '1';
               SetEI <= '1';
            when others => null;
            end case;
         elsif Mode < 2 then
            -- EXX
            ExchangeRS <= '1';
         end if;
      when "11100011" =>
         if Mode /= 3 then
            -- EX (SP),HL
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aSP;
            when 2 =>
               Read_To_Reg <= '1';
               Set_BusA_To <= "0101";
               Set_BusB_To <= "0101";
               Set_Addr_To <= aSP;
            when 3 =>
               IncDec_16 <= "0111";
               Set_Addr_To <= aSP;
               TStates <= "100";
               Write <= '1';
            when 4 =>
               Read_To_Reg <= '1';
               Set_BusA_To <= "0100";
               Set_BusB_To <= "0100";
               Set_Addr_To <= aSP;
            when 5 =>
               IncDec_16 <= "1111";
               TStates <= "101";
               Write <= '1';
            when others => null;
            end case;
         end if;

-- 8 BIT ARITHMETIC AND LOGICAL GROUP
      when "10000000"|"10000001"|"10000010"|"10000011"|"10000100"|"10000101"|"10000111"
         |"10001000"|"10001001"|"10001010"|"10001011"|"10001100"|"10001101"|"10001111"
         |"10010000"|"10010001"|"10010010"|"10010011"|"10010100"|"10010101"|"10010111"
         |"10011000"|"10011001"|"10011010"|"10011011"|"10011100"|"10011101"|"10011111"
         |"10100000"|"10100001"|"10100010"|"10100011"|"10100100"|"10100101"|"10100111"
         |"10101000"|"10101001"|"10101010"|"10101011"|"10101100"|"10101101"|"10101111"
         |"10110000"|"10110001"|"10110010"|"10110011"|"10110100"|"10110101"|"10110111"
         |"10111000"|"10111001"|"10111010"|"10111011"|"10111100"|"10111101"|"10111111" =>
         -- ADD A,r
         -- ADC A,r
         -- SUB A,r
         -- SBC A,r
         -- AND A,r
         -- OR A,r
         -- XOR A,r
         -- CP A,r
         Set_BusB_To(2 downto 0) <= SSS;
         Set_BusA_To(2 downto 0) <= "111";
         Read_To_Reg <= '1';
         Save_ALU <= '1';
      when "10000110"|"10001110"|"10010110"|"10011110"|"10100110"|"10101110"|"10110110"|"10111110" =>
         -- ADD A,(HL)
         -- ADC A,(HL)
         -- SUB A,(HL)
         -- SBC A,(HL)
         -- AND A,(HL)
         -- OR A,(HL)
         -- XOR A,(HL)
         -- CP A,(HL)
         MCycles <= "010";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
         when 2 =>
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            Set_BusB_To(2 downto 0) <= SSS;
            Set_BusA_To(2 downto 0) <= "111";
         when others => null;
         end case;
      when "11000110"|"11001110"|"11010110"|"11011110"|X"E6"|"11101110"|"11110110"|"11111110" =>
         -- ADD A,n
         -- ADC A,n
         -- SUB A,n
         -- SBC A,n
         -- AND A,n (0xE6)
         -- OR A,n
         -- XOR A,n
         -- CP A,n
         MCycles <= "010";
         if MCycle = "010" then
            Inc_PC <= '1';
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            Set_BusB_To(2 downto 0) <= SSS;
            Set_BusA_To(2 downto 0) <= "111";
         end if;
         
      when "00000100"|"00001100"|"00010100"|"00011100"|"00100100"|"00101100"|"00111100" =>
         
         -- INC r
         Set_BusB_To <= "1010";
         Set_BusA_To(2 downto 0) <= DDD;     -- DDD is IR(5 downto 3);
         Read_To_Reg <= '1';
         Save_ALU <= '1';
         PreserveC <= '1';
         ALU_Op <= "0000";
      when "00110100" =>
         -- INC (HL)
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
         when 2 =>
            TStates <= "100";
            Set_Addr_To <= aXY;
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            PreserveC <= '1';
            ALU_Op <= "0000";
            Set_BusB_To <= "1010";
            Set_BusA_To(2 downto 0) <= DDD;
         when 3 =>
            Write <= '1';
         when others => null;
         end case;
      when "00000101"|"00001101"|"00010101"|"00011101"|"00100101"|"00101101"|"00111101" =>
         -- DEC r
         Set_BusB_To <= "1010";
         Set_BusA_To(2 downto 0) <= DDD;
         Read_To_Reg <= '1';
         Save_ALU <= '1';
         PreserveC <= '1';
         ALU_Op <= "0010";
      when "00110101" =>
         -- DEC (HL)
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
         when 2 =>
            TStates <= "100";
            Set_Addr_To <= aXY;
            ALU_Op <= "0010";
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            PreserveC <= '1';
            Set_BusB_To <= "1010";
            Set_BusA_To(2 downto 0) <= DDD;
         when 3 =>
            Write <= '1';
         when others => null;
         end case;

-- GENERAL PURPOSE ARITHMETIC AND CPU CONTROL GROUPS
      when "00100111" =>
         -- DAA
         Set_BusA_To(2 downto 0) <= "111";
         Read_To_Reg <= '1';
         ALU_Op <= "1100";
         Save_ALU <= '1';
      when "00101111" =>
         -- CPL
         I_CPL <= '1';
      when "00111111" =>
         -- CCF
         I_CCF <= '1';
      when "00110111" =>
         -- SCF
         I_SCF <= '1';
      when "00000000" =>
         if NMICycle = '1' then
            -- NMI
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               TStates <= "101";
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "1101";
            when 2 =>
               TStates <= "100";
               Write <= '1';
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "1100";
            when 3 =>
               TStates <= "100";
               Write <= '1';
            when others => null;
            end case;
         elsif IntCycle = '1' then
            -- INT (IM 2)
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               LDZ <= '1';
               TStates <= "101";
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "1101";
            when 2 =>
               --TStates <= "100";
               Write <= '1';
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "1100";
            when 3 =>
               --TStates <= "100";
               Write <= '1';
            when 4 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 5 =>
               Jump <= '1';
            when others => null;
            end case;
         else
            -- NOP
         end if;
      when "01110110" =>
         -- HALT
         Halt <= '1';
      when "11110011" =>
         -- DI
         SetDI <= '1';
      when "11111011" =>
         -- EI
         SetEI <= '1';

-- 16 BIT ARITHMETIC GROUP
      when "00001001"|"00011001"|"00101001"|"00111001" =>
         -- ADD HL,ss
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            NoRead <= '1';
            ALU_Op <= "0000";
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            Set_BusA_To(2 downto 0) <= "101";
            case to_integer(unsigned(IR(5 downto 4))) is
            when 0|1|2 =>
               Set_BusB_To(2 downto 1) <= IR(5 downto 4);
               Set_BusB_To(0) <= '1';
            when others =>
               Set_BusB_To <= "1000";
            end case;
            TStates <= "100";
            Arith16 <= '1';
         when 3 =>
            NoRead <= '1';
            Read_To_Reg <= '1';
            Save_ALU <= '1';
            ALU_Op <= "0001";
            Set_BusA_To(2 downto 0) <= "100";
            case to_integer(unsigned(IR(5 downto 4))) is
            when 0|1|2 =>
               Set_BusB_To(2 downto 1) <= IR(5 downto 4);
            when others =>
               Set_BusB_To <= "1001";
            end case;
            Arith16 <= '1';
         when others =>
         end case;
      when "00000011"|"00010011"|"00100011"|"00110011" =>
         -- INC ss
         TStates <= "110";
         IncDec_16(3 downto 2) <= "01";
         IncDec_16(1 downto 0) <= DPair;
      when "00001011"|"00011011"|"00101011"|"00111011" =>
         -- DEC ss
         TStates <= "110";
         IncDec_16(3 downto 2) <= "11";
         IncDec_16(1 downto 0) <= DPair;

-- ROTATE AND SHIFT GROUP
      when "00000111"
         -- RLCA
         |"00010111"
         -- RLA
         |"00001111"
         -- RRCA
         |"00011111" =>
         -- RRA
         Set_BusA_To(2 downto 0) <= "111";
         ALU_Op <= "1000";
         Read_To_Reg <= '1';
         Save_ALU <= '1';

-- JUMP GROUP
      when "11000011" =>
         -- JP nn
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            Inc_PC <= '1';
            LDZ <= '1';
         when 3 =>
            Inc_PC <= '1';
            Jump <= '1';
         when others => null;
         end case;
      when "11000010"|"11001010"|"11010010"|"11011010"|"11100010"|"11101010"|"11110010"|"11111010" =>
         if IR(5) = '1' and Mode = 3 then
            case IRB(4 downto 3) is
            when "00" =>
               -- LD ($FF00+C),A
               MCycles <= "010";
               case to_integer(unsigned(MCycle)) is
               when 1 =>
                  Set_Addr_To <= aBC;
                  Set_BusB_To <= "0111";
               when 2 =>
                  Write <= '1';
                  IORQ <= '1';
               when others =>
               end case;
            when "01" =>
               -- LD (nn),A
               MCycles <= "100";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  Inc_PC <= '1';
                  LDZ <= '1';
               when 3 =>
                  Set_Addr_To <= aZI;
                  Inc_PC <= '1';
                  Set_BusB_To <= "0111";
               when 4 =>
                  Write <= '1';
               when others => null;
               end case;
            when "10" =>
               -- LD A,($FF00+C)
               MCycles <= "010";
               case to_integer(unsigned(MCycle)) is
               when 1 =>
                  Set_Addr_To <= aBC;
               when 2 =>
                  Read_To_Acc <= '1';
                  IORQ <= '1';
               when others =>
               end case;
            when "11" =>
               -- LD A,(nn)
               MCycles <= "100";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  Inc_PC <= '1';
                  LDZ <= '1';
               when 3 =>
                  Set_Addr_To <= aZI;
                  Inc_PC <= '1';
               when 4 =>
                  Read_To_Acc <= '1';
               when others => null;
               end case;
            end case;
         else
            -- JP cc,nn
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Inc_PC <= '1';
               if is_cc_true(F, to_bitvector(IR(5 downto 3))) then
                  Jump <= '1';
               end if;
            when others => null;
            end case;
         end if;
      when "00011000" =>
         if Mode /= 2 then
            -- JR e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;
      when "00111000" =>
         if Mode /= 2 then
            -- JR C,e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               if F(Flag_C) = '0' then
                  MCycles <= "010";
               end if;
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;
      when "00110000" =>
         if Mode /= 2 then
            -- JR NC,e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               if F(Flag_C) = '1' then
                  MCycles <= "010";
               end if;
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;
      when "00101000" =>
         if Mode /= 2 then
            -- JR Z,e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               if F(Flag_Z) = '0' then
                  MCycles <= "010";
               end if;
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;
      when "00100000" =>
         if Mode /= 2 then
            -- JR NZ,e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               if F(Flag_Z) = '1' then
                  MCycles <= "010";
               end if;
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;
      when "11101001" =>
         -- JP (HL)
         JumpXY <= '1';
      when "00010000" =>
         if Mode = 3 then
            I_DJNZ <= '1';
         elsif Mode < 2 then
            -- DJNZ,e
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               TStates <= "101";
               I_DJNZ <= '1';
               Set_BusB_To <= "1010";
               Set_BusA_To(2 downto 0) <= "000";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               ALU_Op <= "0010";
            when 2 =>
               I_DJNZ <= '1';
               Inc_PC <= '1';
            when 3 =>
               NoRead <= '1';
               JumpE <= '1';
               TStates <= "101";
            when others => null;
            end case;
         end if;

-- CALL AND RETURN GROUP
      when "11001101" =>
         -- CALL nn
         MCycles <= "101";
         case to_integer(unsigned(MCycle)) is
         when 2 =>
            Inc_PC <= '1';
            LDZ <= '1';
         when 3 =>
            IncDec_16 <= "1111";
            Inc_PC <= '1';
            TStates <= "100";
            Set_Addr_To <= aSP;
            LDW <= '1';
            Set_BusB_To <= "1101";
         when 4 =>
            Write <= '1';
            IncDec_16 <= "1111";
            Set_Addr_To <= aSP;
            Set_BusB_To <= "1100";
         when 5 =>
            Write <= '1';
            Call <= '1';
         when others => null;
         end case;
      when "11000100"|"11001100"|"11010100"|"11011100"|"11100100"|"11101100"|"11110100"|"11111100" =>
         if IR(5) = '0' or Mode /= 3 then
            -- CALL cc,nn
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Inc_PC <= '1';
               LDW <= '1';
               if is_cc_true(F, to_bitvector(IR(5 downto 3))) then
                  IncDec_16 <= "1111";
                  Set_Addr_TO <= aSP;
                  TStates <= "100";
                  Set_BusB_To <= "1101";
               else
                  MCycles <= "011";
               end if;
            when 4 =>
               Write <= '1';
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "1100";
            when 5 =>
               Write <= '1';
               Call <= '1';
            when others => null;
            end case;
         end if;
      when "11001001" =>
         -- RET
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            --TStates <= "101";
            Set_Addr_TO <= aSP;
         when 2 =>
            IncDec_16 <= "0111";
            Set_Addr_To <= aSP;
            LDZ <= '1';
         when 3 =>
            Jump <= '1';
            IncDec_16 <= "0111";
         when others => null;
         end case;
      when "11000000"|"11001000"|"11010000"|"11011000"|"11100000"|"11101000"|"11110000"|"11111000" =>
         if IR(5) = '1' and Mode = 3 then
            case IRB(4 downto 3) is
            when "00" =>
               -- LD ($FF00+nn),A
               MCycles <= "011";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  Inc_PC <= '1';
                  Set_Addr_To <= aIOA;
                  Set_BusB_To <= "0111";
               when 3 =>
                  Write <= '1';
               when others => null;
               end case;
            when "01" =>
               -- ADD SP,n
               MCycles <= "011";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  ALU_Op <= "0000";
                  Inc_PC <= '1';
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  Set_BusA_To <= "1000";
                  Set_BusB_To <= "0110";
               when 3 =>
                  NoRead <= '1';
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  ALU_Op <= "0001";
                  Set_BusA_To <= "1001";
                  Set_BusB_To <= "1110";  -- Incorrect unsigned !!!!!!!!!!!!!!!!!!!!!
               when others =>
               end case;
            when "10" =>
               -- LD A,($FF00+nn)
               MCycles <= "011";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  Inc_PC <= '1';
                  Set_Addr_To <= aIOA;
               when 3 =>
                  Read_To_Acc <= '1';
               when others => null;
               end case;
            when "11" =>
               -- LD HL,SP+n  -- Not correct !!!!!!!!!!!!!!!!!!!
               MCycles <= "101";
               case to_integer(unsigned(MCycle)) is
               when 2 =>
                  Inc_PC <= '1';
                  LDZ <= '1';
               when 3 =>
                  Set_Addr_To <= aZI;
                  Inc_PC <= '1';
                  LDW <= '1';
               when 4 =>
                  Set_BusA_To(2 downto 0) <= "101"; -- L
                  Read_To_Reg <= '1';
                  Inc_WZ <= '1';
                  Set_Addr_To <= aZI;
               when 5 =>
                  Set_BusA_To(2 downto 0) <= "100"; -- H
                  Read_To_Reg <= '1';
               when others => null;
               end case;
            end case;
         else
            -- RET cc
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               if is_cc_true(F, to_bitvector(IR(5 downto 3))) then
                  Set_Addr_TO <= aSP;
               else
                  MCycles <= "001";
               end if;
               TStates <= "101";
            when 2 =>
               IncDec_16 <= "0111";
               Set_Addr_To <= aSP;
               LDZ <= '1';
            when 3 =>
               Jump <= '1';
               IncDec_16 <= "0111";
            when others => null;
            end case;
         end if;
      when "11000111"|"11001111"|"11010111"|"11011111"|"11100111"|"11101111"|"11110111"|"11111111" =>
         -- RST p
         MCycles <= "011";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            TStates <= "101";
            IncDec_16 <= "1111";
            Set_Addr_To <= aSP;
            Set_BusB_To <= "1101";
         when 2 =>
            Write <= '1';
            IncDec_16 <= "1111";
            Set_Addr_To <= aSP;
            Set_BusB_To <= "1100";
         when 3 =>
            Write <= '1';
            RstP <= '1';
         when others => null;
         end case;

-- INPUT AND OUTPUT GROUP
      when "11011011" =>
         if Mode /= 3 then
            -- IN A,(n)
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               Set_Addr_To <= aIOA;
            when 3 =>
               Read_To_Acc <= '1';
               IORQ <= '1';
            when others => null;
            end case;
         end if;
      when "11010011" =>
         if Mode /= 3 then
            -- OUT (n),A
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               Set_Addr_To <= aIOA;
               Set_BusB_To <= "0111";
            when 3 =>
               Write <= '1';
               IORQ <= '1';
            when others => null;
            end case;
         end if;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- MULTIBYTE INSTRUCTIONS
------------------------------------------------------------------------------
------------------------------------------------------------------------------

      when "11001011" =>
         if Mode /= 2 then
            Prefix <= "01";
         end if;

      when "11101101" =>
         if Mode < 2 then
            Prefix <= "10";
         end if;

      when "11011101"|"11111101" =>
         if Mode < 2 then
            Prefix <= "11";
         end if;

      end case;

      when "01" =>

------------------------------------------------------------------------------
--
-- CB prefixed instructions
--
------------------------------------------------------------------------------

         Set_BusA_To(2 downto 0) <= IR(2 downto 0);
         Set_BusB_To(2 downto 0) <= IR(2 downto 0);

         case IRB is
         when "00000000"|"00000001"|"00000010"|"00000011"|"00000100"|"00000101"|"00000111"
            |"00010000"|"00010001"|"00010010"|"00010011"|"00010100"|"00010101"|"00010111"
            |"00001000"|"00001001"|"00001010"|"00001011"|"00001100"|"00001101"|"00001111"
            |"00011000"|"00011001"|"00011010"|"00011011"|"00011100"|"00011101"|"00011111"
            |"00100000"|"00100001"|"00100010"|"00100011"|"00100100"|"00100101"|"00100111"
            |"00101000"|"00101001"|"00101010"|"00101011"|"00101100"|"00101101"|"00101111"
            |"00110000"|"00110001"|"00110010"|"00110011"|"00110100"|"00110101"|"00110111"
            |"00111000"|"00111001"|"00111010"|"00111011"|"00111100"|"00111101"|"00111111" =>
            -- RLC r
            -- RL r
            -- RRC r
            -- RR r
            -- SLA r
            -- SRA r
            -- SRL r
            -- SLL r (Undocumented) / SWAP r
            if XY_State="00" then
               if MCycle = "001" or MCycle = "111" then
                 ALU_Op <= "1000";
                 Read_To_Reg <= '1';
                 Save_ALU <= '1';
               end if;
            else
            -- R/S (IX+d),Reg, undocumented
               MCycles <= "011";
               XYbit_undoc <= '1';
               case to_integer(unsigned(MCycle)) is
               when 1 | 7=>
                  Set_Addr_To <= aXY;
               when 2 =>
                  ALU_Op <= "1000";
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  Set_Addr_To <= aXY;
                  TStates <= "100";
               when 3 =>
                  Write <= '1';
               when others => null;
               end case;
            end if;
         when "00000110"|"00010110"|"00001110"|"00011110"|"00101110"|"00111110"|"00100110"|"00110110" =>
            -- RLC (HL)
            -- RL (HL)
            -- RRC (HL)
            -- RR (HL)
            -- SRA (HL)
            -- SRL (HL)
            -- SLA (HL)
            -- SLL (HL) (Undocumented) / SWAP (HL)
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 | 7 =>
               Set_Addr_To <= aXY;
            when 2 =>
               ALU_Op <= "1000";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_Addr_To <= aXY;
               TStates <= "100";
            when 3 =>
               Write <= '1';
            when others =>
            end case;
         when "01000000"|"01000001"|"01000010"|"01000011"|"01000100"|"01000101"|"01000111"
            |"01001000"|"01001001"|"01001010"|"01001011"|"01001100"|"01001101"|"01001111"
            |"01010000"|"01010001"|"01010010"|"01010011"|"01010100"|"01010101"|"01010111"
            |"01011000"|"01011001"|"01011010"|"01011011"|"01011100"|"01011101"|"01011111"
            |"01100000"|"01100001"|"01100010"|"01100011"|"01100100"|"01100101"|"01100111"
            |"01101000"|"01101001"|"01101010"|"01101011"|"01101100"|"01101101"|"01101111"
            |"01110000"|"01110001"|"01110010"|"01110011"|"01110100"|"01110101"|"01110111"
            |"01111000"|"01111001"|"01111010"|"01111011"|"01111100"|"01111101"|"01111111" =>
            -- BIT b,r
            if XY_State="00" then
               if MCycle = "001" or MCycle = "111" then
                 Set_BusB_To(2 downto 0) <= IR(2 downto 0);
                 ALU_Op <= "1001";
               end if;
            else
            -- BIT b,(IX+d), undocumented
               MCycles <= "010";
               XYbit_undoc <= '1';
               case to_integer(unsigned(MCycle)) is
               when 1 | 7=>
                  Set_Addr_To <= aXY;
               when 2 =>
                  ALU_Op <= "1001";
                  TStates <= "100";
               when others => null;
               end case;
            end if;
         when "01000110"|"01001110"|"01010110"|"01011110"|"01100110"|"01101110"|"01110110"|"01111110" =>
            -- BIT b,(HL)
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 | 7 =>
               Set_Addr_To <= aXY;
            when 2 =>
               ALU_Op <= "1001";
               TStates <= "100";
            when others =>
            end case;
         when "11000000"|"11000001"|"11000010"|"11000011"|"11000100"|"11000101"|"11000111"
            |"11001000"|"11001001"|"11001010"|"11001011"|"11001100"|"11001101"|"11001111"
            |"11010000"|"11010001"|"11010010"|"11010011"|"11010100"|"11010101"|"11010111"
            |"11011000"|"11011001"|"11011010"|"11011011"|"11011100"|"11011101"|"11011111"
            |"11100000"|"11100001"|"11100010"|"11100011"|"11100100"|"11100101"|"11100111"
            |"11101000"|"11101001"|"11101010"|"11101011"|"11101100"|"11101101"|"11101111"
            |"11110000"|"11110001"|"11110010"|"11110011"|"11110100"|"11110101"|"11110111"
            |"11111000"|"11111001"|"11111010"|"11111011"|"11111100"|"11111101"|"11111111" =>
            -- SET b,r
            if XY_State="00" then
               if MCycle = "001" then
                  ALU_Op <= "1010";
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
               else
                  MCycles <= "100";
                  case to_integer(unsigned(MCycle)) is
                  when 7 =>
                     Set_Addr_To <= aXY;
                  when 2 =>
                     Set_BusB_To(2 downto 0) <= "110";
                     ALU_Op <= "1010";
                     Read_To_Reg <= '1';
                     Save_ALU <= '1';
                     Set_Addr_To <= aXY;
                     TStates <= "100";
                  when 3 =>
                     Set_Addr_To <= aXY;
                  when 4 =>
                     Write <= '1';
                  when others => null;
                  end case;
               end if;
            else
            -- SET b,(IX+d),Reg, undocumented
               MCycles <= "011";
               XYbit_undoc <= '1';
               case to_integer(unsigned(MCycle)) is
               when 1 | 7=>
                  Set_Addr_To <= aXY;
               when 2 =>
                  ALU_Op <= "1010";
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  Set_Addr_To <= aXY;
                  TStates <= "100";
               when 3 =>
                  Write <= '1';
               when others => null;
               end case;
            end if;
         when "11000110"|"11001110"|"11010110"|"11011110"|"11100110"|"11101110"|"11110110"|"11111110" =>
            -- SET b,(HL)
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 | 7 =>
               Set_Addr_To <= aXY;
            when 2 =>
               ALU_Op <= "1010";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_Addr_To <= aXY;
               TStates <= "100";
            when 3 =>
               Write <= '1';
            when others =>
            end case;
         when "10000000"|"10000001"|"10000010"|"10000011"|"10000100"|"10000101"|"10000111"
            |"10001000"|"10001001"|"10001010"|"10001011"|"10001100"|"10001101"|"10001111"
            |"10010000"|"10010001"|"10010010"|"10010011"|"10010100"|"10010101"|"10010111"
            |"10011000"|"10011001"|"10011010"|"10011011"|"10011100"|"10011101"|"10011111"
            |"10100000"|"10100001"|"10100010"|"10100011"|"10100100"|"10100101"|"10100111"
            |"10101000"|"10101001"|"10101010"|"10101011"|"10101100"|"10101101"|"10101111"
            |"10110000"|"10110001"|"10110010"|"10110011"|"10110100"|"10110101"|"10110111"
            |"10111000"|"10111001"|"10111010"|"10111011"|"10111100"|"10111101"|"10111111" =>
            -- RES b,r
            if XY_State="00" then
               if MCycle = "001" then
                  ALU_Op <= "1011";
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
               else
                  MCycles <= "100";
                  case to_integer(unsigned(MCycle)) is
                  when 7 =>
                     Set_Addr_To <= aXY;
                  when 2 =>
                     Set_BusB_To(2 downto 0) <= "110";
                     ALU_Op <= "1011";
                     Read_To_Reg <= '1';
                     Save_ALU <= '1';
                     Set_Addr_To <= aXY;
                     TStates <= "100";
                  when 3 =>
                     Set_Addr_To <= aXY;
                  when 4 =>
                     Write <= '1';
                  when others => null;
                  end case;
               end if;
            else
            -- RES b,(IX+d),Reg, undocumented
               MCycles <= "011";
               XYbit_undoc <= '1';
               case to_integer(unsigned(MCycle)) is
               when 1 | 7=>
                  Set_Addr_To <= aXY;
               when 2 =>
                  ALU_Op <= "1011";
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  Set_Addr_To <= aXY;
                  TStates <= "100";
               when 3 =>
                  Write <= '1';
               when others => null;
               end case;
            end if;
         when "10000110"|"10001110"|"10010110"|"10011110"|"10100110"|"10101110"|"10110110"|"10111110" =>
            -- RES b,(HL)
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 | 7 =>
               Set_Addr_To <= aXY;
            when 2 =>
               ALU_Op <= "1011";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_Addr_To <= aXY;
               TStates <= "100";
            when 3 =>
               Write <= '1';
            when others =>
            end case;
         end case;

      when others =>

------------------------------------------------------------------------------
--
-- ED prefixed instructions
--
------------------------------------------------------------------------------

         case IRB is
   
-- 8 BIT LOAD GROUP
         when "01010111" =>
            -- LD A,I
            Special_LD <= "100";
            TStates <= "101";
         when "01011111" =>
            -- LD A,R
            Special_LD <= "101";
            TStates <= "101";
         when "01000111" =>
            -- LD I,A
            Special_LD <= "110";
            TStates <= "101";
         when "01001111" =>
            -- LD R,A
            Special_LD <= "111";
            TStates <= "101";
            
         when X"91" =>
            -- NEXTREGW rr,(nn)
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Inc_PC <= '1';
            when 2 =>
               Inc_PC <= '1';
               Z80N_data_o(15 downto 8) <= ext_Data_i;
            when 3 =>
               Z80N_data_o(7 downto 0) <= ext_Data_i;
            when 4 =>
               Z80N_command_o <= NEXTREGW; 
               Z80N_dout_o <= '1';
            when 5 =>
               Inc_PC <= '1';
               Z80N_dout_o <= '0';
            when others => null;
            end case;
            
         when X"92" =>
            -- NEXTREGWA rr
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Inc_PC <= '1';    
               Z80N_data_o(7 downto 0) <= ext_ACC_i;
            when 2 =>
               Z80N_data_o(15 downto 8) <= ext_Data_i; 
            when 3 =>
               Z80N_command_o <= NEXTREGW; 
               Z80N_dout_o <= '1';
            when 4 =>
               Z80N_dout_o <= '0';
               Inc_PC <= '1';    
               
            when others => null;
            end case;
            

         when X"30" =>
            
            -- MUL_DE
            TStates <= "100";
            Z80N_command_o <= MUL_DE; 

         when X"31" =>
            
            -- ADD_HL_A 
            TStates <= "100"; 
            Z80N_command_o <= ADD_HL_A; 

         when X"32" =>
            
            -- ADD_DE_A 
            TStates <= "100";
            Z80N_command_o <= ADD_DE_A; 
            
         when X"33" =>
            
            -- ADD_BC_A 
            TStates <= "100";
            Z80N_command_o <= ADD_BC_A; 
            
--       when X"20" =>
            
            -- LD_ACC32_HLDE 
--          TStates <= "100";
--          Z80N_command_o <= LD_ACC32_DEHL; 

--       when X"21" =>
            
            -- LD_HLDE_ACC32 
--          TStates <= "100";
--          Z80N_command_o <= LD_DEHL_ACC32; 
            
--       when X"22" =>
            
            -- EXXACC32 
--          TStates <= "100";
--          Z80N_command_o <= EXXACC32; 
            
         when X"23" =>
            
            -- SWAPNIB_A 
            TStates <= "100";
            Z80N_command_o <= SWAPNIB_A; 
            
         when X"24" =>
            
            -- MIRROR_A 
            TStates <= "100";
            Z80N_command_o <= MIRROR_A; 

--       when X"25" =>
            
            -- LD_HL_SP 
--          TStates <= "100";
--          Z80N_command_o <= LD_HL_SP; 
         
--       when X"26" =>
            
            -- MIRROR_DE
--          TStates <= "100";
--          Z80N_command_o <= MIRROR_DE; 
   
         when x"27" =>
         -- TEST_nn
         MCycles <= "010";
         if MCycle = "010" then
            Inc_PC <= '1';
            --Read_To_Reg <= '1';
            Save_ALU <= '1';
            Set_BusB_To(2 downto 0) <= "110"; -- SSS
            Set_BusA_To(2 downto 0) <= "111";
         end if;
            
         when X"28" =>
            
            -- BSLA DE,B
            TStates <= "100";
            Z80N_command_o <= BSLA_DE_B;
            
         when X"29" =>
            
            -- BSRA DE,B
            TStates <= "100";
            Z80N_command_o <= BSRA_DE_B;
            
         when X"2A" =>
            
            -- BSRL DE,B
            TStates <= "100";
            Z80N_command_o <= BSRL_DE_B;
            
         when X"2B" =>
            
            -- BSRF DE,B
            TStates <= "100";
            Z80N_command_o <= BSRF_DE_B;
            
         when X"2C" =>
            
            -- BRLC DE,B
            TStates <= "100";
            Z80N_command_o <= BRLC_DE_B;
   
         when X"93" =>
            
            -- PIXELDN 
            TStates <= "100";
            Z80N_command_o <= PIXELDN;                         
   
         when X"94" =>
            
            -- PIXELAD 
            TStates <= "100";
            Z80N_command_o <= PIXELAD;                         

         when X"95" =>
            
            -- SET_A_E 
            TStates <= "100";
            Z80N_command_o <= SET_A_E;    
            
         when X"98" =>
            -- JP (C)
            MCycles <= "010";
            TStates <= "100";
            Z80N_command_o <= JP_C;    
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aBC;
            when 2 =>
               IORQ <= '1';
            when others =>
            end case;
            
         when X"34" | X"35" | X"36" => --X"3B" =>
            -- ADD_HL_nn, ADD_DE_nn, ADD_BC_nn, ADD_HLDE_nn
            TStates <= "100";
            
            case IRB is
               when X"34" =>
                  Z80N_command_o <= ADD_HL_nn;  
               when X"35" =>
                  Z80N_command_o <= ADD_DE_nn;  
               when X"36" =>
                  Z80N_command_o <= ADD_BC_nn; 
--             when X"3B" =>
--                Z80N_command_o <= ADD_DEHL_nn; 
               when others => null;
            end case;   
            
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            
            when 1 =>
               Inc_PC <= '1';
               
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
               
            when 3 =>
               Inc_PC <= '1';
               LDW <= '1';
                  

            when others => null;
            end case;
            
--       when X"37" =>
            
            -- INC_HLDE 
--          TStates <= "100";
--          Z80N_command_o <= INC_DEHL;   
            
--       when X"38" =>
            
            -- DEC_HLDE 
--          TStates <= "100";
--          Z80N_command_o <= DEC_DEHL;   
            
--       when X"39" =>
            
            -- ADD_HLDE_A 
--          TStates <= "100";
--          Z80N_command_o <= ADD_DEHL_A;    
            
--       when X"3A" =>
            
            -- ADD_HLDE_BC 
--          TStates <= "100";
--          Z80N_command_o <= ADD_DEHL_BC;   

            
--       when X"3C" =>
            
            -- SUB_HLDE_A 
--          TStates <= "100";
--          Z80N_command_o <= SUB_DEHL_A;    

--       when X"3D" =>
            
            -- SUB_HLDE_BC 
--          TStates <= "100";
--          Z80N_command_o <= SUB_DEHL_BC;   
   
         when X"8A" =>
            -- PUSH VAL nn
            
            MCycles <= "110";
            case to_integer(unsigned(MCycle)) is
            
            when 1 =>
               Inc_PC <= '1';
               LDZ <= '1';
               
            when 2 =>
               --TStates <= "101";
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "0110";
            when 3 =>
               Inc_PC <= '1';
               LDZ <= '1';
               Write <= '1';
            when 4 =>
            -- TStates <= "101";
               IncDec_16 <= "1111";
               Set_Addr_To <= aSP;
               Set_BusB_To <= "0110";
            when 5 =>
               Write <= '1';

            when others => null;
            end case;
            


      when X"B7" =>
            -- LDPIRX
            --get byte from ( reg_HL_s(15 downto 3) & reg_DE_s(2 downto 0) )
            --if byte != reg_A_s then
             -- store byte in (reg_DE_s)
            --reg_DE_temp_s <= reg_DE_s+1;
            --reg_BC_temp_s <= reg_BC_s-1;
            --loop if BC is not zero

            Z80N_command_o <= LDPIRX; 
            
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
            LDZ <= '1';
               Set_Addr_To <= aXY;
               IncDec_16 <= "1100"; -- decrement BC

            when 2 =>
               Set_BusB_To <= "0110";
               --Set_BusA_To(2 downto 0) <= "111";
            -- ALU_Op <= "0000";
            -- Set_Addr_To <= aDE;

            when 3 =>
               I_BT <= '1';
               TStates <= "101";

               if ext_ACC_i /= ext_Data_i then
                  Write <= '1';
               end if;
   
               IncDec_16 <= "0101"; -- increment DE

            when 4 =>
               NoRead <= '1';
               TStates <= "101";
            when others => null;
            end case;
            
            

--       when X"b5" =>
            -- FILLDE
            
      -- MCycles <= "100";
      -- case to_integer(unsigned(MCycle)) is
      -- 
      -- when 1 =>
      --    Set_Addr_To <= aXY;
      --    IncDec_16 <= "1100"; -- decrement BC
      -- 
      -- when 2 =>
      --    Set_Addr_To <= aDE;
      --    Set_BusB_To <= "0111"; -- ACC
      --    
      -- when 3 =>
      --    I_BT <= '1';
      --    TStates <= "101";
      --    Write <= '1';
--
      --    -- INC E
      --    Set_BusB_To <= "1010";
      --    Set_BusA_To(2 downto 0) <= "011"; -- Reg E
      --    Read_To_Reg <= '1';
      --    Save_ALU <= '1';
      --    PreserveC <= '1';
      --    ALU_Op <= "0000";
      --    
      -- when 4 =>
      --    NoRead <= '1';
      --    TStates <= "101";
      -- when others => null;
      -- end case;            

            
-- 16 BIT LOAD GROUP
         when "01001011"|"01011011"|"01101011"|"01111011" =>
            -- LD dd,(nn)
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               LDW <= '1';
            when 4 =>
               Read_To_Reg <= '1';
               if IR(5 downto 4) = "11" then
                  Set_BusA_To <= "1000";
               else
                  Set_BusA_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusA_To(0) <= '1';
               end if;
               Inc_WZ <= '1';
               Set_Addr_To <= aZI;
            when 5 =>
               Read_To_Reg <= '1';
               if IR(5 downto 4) = "11" then
                  Set_BusA_To <= "1001";
               else
                  Set_BusA_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusA_To(0) <= '0';
               end if;
            when others => null;
            end case;
         when "01000011"|"01010011"|"01100011"|"01110011" =>
            -- LD (nn),dd
            MCycles <= "101";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Inc_PC <= '1';
               LDZ <= '1';
            when 3 =>
               Set_Addr_To <= aZI;
               Inc_PC <= '1';
               LDW <= '1';
               if IR(5 downto 4) = "11" then
                  Set_BusB_To <= "1000";
               else
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusB_To(0) <= '1';
                  Set_BusB_To(3) <= '0';
               end if;
            when 4 =>
               Inc_WZ <= '1';
               Set_Addr_To <= aZI;
               Write <= '1';
               if IR(5 downto 4) = "11" then
                  Set_BusB_To <= "1001";
               else
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusB_To(0) <= '0';
                  Set_BusB_To(3) <= '0';
               end if;
            when 5 =>
               Write <= '1';
            when others => null;
            end case;
            
         when "10100000" | "10101000" | "10110000" | "10111000"   -- a0 a8 b0 b8
            -- LDI, LDD, LDIR, LDDR
            
             | X"A4" | X"B4" =>
            -- LDIX, LDIRX
            
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
               IncDec_16 <= "1100"; -- decrement BC
            when 2 =>
               Set_BusB_To <= "0110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "0000";
               Set_Addr_To <= aDE;
               if IR(3) = '0' then
                  IncDec_16 <= "0110"; -- increment HL
               else
                  IncDec_16 <= "1110"; -- decrement HL
               end if;
            when 3 =>
               I_BT <= '1';
               TStates <= "101";
               
               -- if is a "X" instruction, test for the excluding byte
               if (IRB = X"A4" or IRB = X"B4" ) then
                  if ext_ACC_i /= ext_Data_i then
                     Write <= '1';
                  end if;
               else
                     Write <= '1';
               end if;
               
               if IR(3) = '0' then
                  IncDec_16 <= "0101"; -- increment DE
               else
                  IncDec_16 <= "1101"; -- decrement DE
               end if;
            when 4 =>
               NoRead <= '1';
               TStates <= "101";
            when others => null;
            end case;
            
         when X"A5" => -- LDWS
            -- LD (DE),(DL)
            -- inc L
            -- inc D
            
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is

            when 1 =>

               Set_Addr_To <= aXY;
               
               -- INC L
               Set_BusB_To <= "1010";
               Set_BusA_To(2 downto 0) <= "101"; -- Reg L
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               ALU_Op <= "0000";

            when 2 =>

               Set_Addr_To <= aDE;

               --get the (HL) value
               Set_BusB_To <= "0110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "0000";
                  
            when 3 =>

               I_BT <= '1';
               TStates <= "011";
               Write <= '1';
                  
               -- INC D
               Set_BusB_To <= "1010";
               Set_BusA_To(2 downto 0) <= "010"; -- Reg D
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               ALU_Op <= "0000";

               --NoRead <= '1';
               
            when others => null;
            end case;
            
            
         when X"B6" =>
            -- LDIRSCALE
            
            --read byte from ( reg_HL_s (15 downto 0)) 
            --if byte != A put byte in ( reg_DE_s(15 downto 0))
            --add BC' ( from exx ) to HL_A' and store in HL_A'
            --DE <= DE + DE' 
            --loop BC
            
            Z80N_command_o <= LDIRSCALE; 
            
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            
            when 1 =>
               Set_Addr_To <= aXY;
               IncDec_16 <= "1100"; -- decrement BC
               
            when 2 =>
               Set_BusB_To <= "0110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "0000";
               Set_Addr_To <= aDE;
               IncDec_16 <= "0110"; -- increment HL

            when 3 =>
               I_BT <= '1';
               TStates <= "101";
               
               if ext_ACC_i /= ext_Data_i then
                  Write <= '1';
               end if;
               
               IncDec_16 <= "0101"; -- increment DE

            when 4 =>
               NoRead <= '1';
               TStates <= "101";
               
            when others => null;
            end case;
            
      when X"AC" | X"BC" =>
         -- LDDX, LDDRX
         MCycles <= "100";
         case to_integer(unsigned(MCycle)) is
         when 1 =>
            Set_Addr_To <= aXY;
            IncDec_16 <= "1100"; -- decrement BC
         when 2 =>
            Set_BusB_To <= "0110";
            Set_BusA_To(2 downto 0) <= "111";
            ALU_Op <= "0000";
            Set_Addr_To <= aDE;
            IncDec_16 <= "1110"; -- decrement HL
            
         when 3 =>
            I_BT <= '1';
            TStates <= "101";
            if ext_ACC_i /= ext_Data_i then
               Write <= '1';
            end if;
            IncDec_16 <= "0101"; -- increment DE
            
         when 4 =>
            NoRead <= '1';
            TStates <= "101";
         when others => null;
         end case;
            
         when "10100001" | "10101001" | "10110001" | "10111001" =>
            -- CPI, CPD, CPIR, CPDR
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aXY;
               IncDec_16 <= "1100"; -- BC
            when 2 =>
               Set_BusB_To <= "0110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "0111";
               Save_ALU <= '1';
               PreserveC <= '1';
               if IR(3) = '0' then
                  IncDec_16 <= "0110";
               else
                  IncDec_16 <= "1110";
               end if;
            when 3 =>
               NoRead <= '1';
               I_BC <= '1';
               TStates <= "101";
            when 4 =>
               NoRead <= '1';
               TStates <= "101";
            when others => null;
            end case;
         when "01000100"|"01001100"|"01010100"|"01011100"|"01100100"|"01101100"|"01110100"|"01111100" =>
            -- NEG
            Alu_OP <= "0010";
            Set_BusB_To <= "0111";
            Set_BusA_To <= "1010";
            Read_To_Acc <= '1';
            Save_ALU <= '1';
         when "01000110"|"01001110"|"01100110"|"01101110" =>
            -- IM 0
            IMode <= "00";
         when "01010110"|"01110110" =>
            -- IM 1
            IMode <= "01";
         when "01011110"|"01110111" =>
            -- IM 2
            IMode <= "10";
-- 16 bit arithmetic
         when "01001010"|"01011010"|"01101010"|"01111010" =>
            -- ADC HL,ss
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               NoRead <= '1';
               ALU_Op <= "0001";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_BusA_To(2 downto 0) <= "101";
               case to_integer(unsigned(IR(5 downto 4))) is
               when 0|1|2 =>
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
               Set_BusB_To(0) <= '1';
                  when others =>
                  Set_BusB_To <= "1000";
               end case;
               TStates <= "100";
            when 3 =>
               NoRead <= '1';
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               ALU_Op <= "0001";
               Set_BusA_To(2 downto 0) <= "100";
               case to_integer(unsigned(IR(5 downto 4))) is
               when 0|1|2 =>
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusB_To(0) <= '0';
               when others =>
                  Set_BusB_To <= "1001";
               end case;
            when others =>
            end case;
         when "01000010"|"01010010"|"01100010"|"01110010" =>
            -- SBC HL,ss
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               NoRead <= '1';
               ALU_Op <= "0011";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_BusA_To(2 downto 0) <= "101";
               case to_integer(unsigned(IR(5 downto 4))) is
               when 0|1|2 =>
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
                  Set_BusB_To(0) <= '1';
               when others =>
                  Set_BusB_To <= "1000";
               end case;
               TStates <= "100";
            when 3 =>
               NoRead <= '1';
               ALU_Op <= "0011";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               Set_BusA_To(2 downto 0) <= "100";
               case to_integer(unsigned(IR(5 downto 4))) is
               when 0|1|2 =>
                  Set_BusB_To(2 downto 1) <= IR(5 downto 4);
               when others =>
                     Set_BusB_To <= "1001";
               end case;
            when others =>
            end case;
         when "01101111" =>
            -- RLD
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               NoRead <= '1';
               Set_Addr_To <= aXY;
            when 3 =>
               Read_To_Reg <= '1';
               Set_BusB_To(2 downto 0) <= "110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "1101";
               TStates <= "100";
               Set_Addr_To <= aXY;
               Save_ALU <= '1';
            when 4 =>
               I_RLD <= '1';
               Write <= '1';
            when others =>
            end case;
         when "01100111" =>
            -- RRD
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 2 =>
               Set_Addr_To <= aXY;
            when 3 =>
               Read_To_Reg <= '1';
               Set_BusB_To(2 downto 0) <= "110";
               Set_BusA_To(2 downto 0) <= "111";
               ALU_Op <= "1110";
               TStates <= "100";
               Set_Addr_To <= aXY;
               Save_ALU <= '1';
            when 4 =>
               I_RRD <= '1';
               Write <= '1';
            when others =>
            end case;
         when "01000101"|"01001101"|"01010101"|"01011101"|"01100101"|"01101101"|"01110101"|"01111101" =>
            -- RETI, RETN
            MCycles <= "011";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_TO <= aSP;
            when 2 =>
               IncDec_16 <= "0111";
               Set_Addr_To <= aSP;
               LDZ <= '1';
            when 3 =>
               Jump <= '1';
               IncDec_16 <= "0111";
               I_RETN <= '1';
            when others => null;
            end case;
         when "01000000"|"01001000"|"01010000"|"01011000"|"01100000"|"01101000"|"01110000"|"01111000" =>
            -- IN r,(C)
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aBC;
            when 2 =>
               IORQ <= '1';
               if IR(5 downto 3) /= "110" then
                  Read_To_Reg <= '1';
                  Set_BusA_To(2 downto 0) <= IR(5 downto 3);
               end if;
               I_INRC <= '1';
            when others =>
            end case;
         when "01000001"|"01001001"|"01010001"|"01011001"|"01100001"|"01101001"|"01110001"|"01111001" =>
            -- OUT (C),r
            -- OUT (C),0
            MCycles <= "010";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               Set_Addr_To <= aBC;
               Set_BusB_To(2 downto 0) <= IR(5 downto 3);
               if IR(5 downto 3) = "110" then
                  Set_BusB_To(3) <= '1';
               end if;
            when 2 =>
               Write <= '1';
               IORQ <= '1';
            when others =>
            end case;
         when "10100010" | "10101010" | "10110010" | "10111010" =>
            -- INI, IND, INIR, INDR
            MCycles <= "100";
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               TStates <= "101";
               Set_Addr_To <= aBC;
               Set_BusB_To <= "1010";
               Set_BusA_To <= "0000";
               Read_To_Reg <= '1';
               Save_ALU <= '1';
               ALU_Op <= "0010";
            when 2 =>
               IORQ <= '1';
               Set_BusB_To <= "0110";
               Set_Addr_To <= aXY;
            when 3 =>
               if IR(3) = '0' then
                  IncDec_16 <= "0110";
               else
                  IncDec_16 <= "1110";
               end if;
               TStates <= "011";  -- "100"
               Write <= '1';
               I_BTR <= '1';
            when 4 =>
               NoRead <= '1';
               TStates <= "101";
            when others => null;
            end case;
            
         when "10100011" | "10101011" | "10110011" | "10111011" 
            -- OUTI, OUTD, OTIR, OTDR
            
            | x"90" => -- OUTINB

            if IRB /= X"90" then --if not OUTINB
               MCycles <= "100";
            else
               MCycles <= "011";
            end if;
            
            case to_integer(unsigned(MCycle)) is
            when 1 =>
               TStates <= "101";
               Set_Addr_To <= aXY;
               Set_BusB_To <= "1010";
               Set_BusA_To <= "0000";
               
               if IRB /= X"90" then --if not OUTINB, decrement B 
                  Read_To_Reg <= '1';
                  Save_ALU <= '1';
                  ALU_Op <= "0010"; -- SUB d0,d1
               
               end if;
               
            when 2 =>
               Set_BusB_To <= "0110";
               Set_Addr_To <= aBC;
            when 3 =>
               if IR(3) = '0' then
                  IncDec_16 <= "0110"; -- increment HL
               else
                  IncDec_16 <= "1110"; -- decrement HL
               end if;
               --TStates <= "100"; -- MIKEJ should be 4 for IO cycle
               IORQ <= '1';
               Write <= '1';
               I_BTR <= '1';
            when 4 =>
               NoRead <= '1';
               TStates <= "101";
            when others => null;
            end case;
            
--       when x"90"  => -- OUTINB
--
--          MCycles <= "011";
--          case to_integer(unsigned(MCycle)) is
--          when 1 =>
--             TStates <= "101";
--             Set_Addr_To <= aXY;
--             Set_BusB_To <= "1010";
--             Set_BusA_To <= "0000"; -- get the (HL)
--             
--          when 2 =>
--             Set_BusB_To <= "0110"; -- show the (HL) read on the bus
--             --Set_Addr_To <= aBC;
--          when 3 =>
--             IncDec_16 <= "0110"; -- increment HL
--             TStates <= "100"; -- MIKEJ should be 4 for IO cycle
--             IORQ <= '1';
--             Write <= '1';
--             I_BTR <= '1';
--          when 4 =>
--             NoRead <= '1';
--             TStates <= "101";
--          when others => null;
--          end case;

         when others => null;
            
         end case;

      end case;

      if Mode = 1 then
         if MCycle = "001" then
--          TStates <= "100";
         else
            TStates <= "011";
         end if;
      end if;

      if Mode = 3 then
         if MCycle = "001" then
--          TStates <= "100";
         else
            TStates <= "100";
         end if;
      end if;

      if Mode < 2 then
         if MCycle = "110" then
            Inc_PC <= '1';
            if Mode = 1 then
               Set_Addr_To <= aXY;
               TStates <= "100";
               Set_BusB_To(2 downto 0) <= SSS;
               Set_BusB_To(3) <= '0';
            end if;
            if IRB = "00110110" or IRB = "11001011" then
               Set_Addr_To <= aNone;
            end if;
         end if;
         if MCycle = "111" then
            if Mode = 0 then
               TStates <= "101";
            end if;
            if ISet /= "01" then
               Set_Addr_To <= aXY;
            end if;
            Set_BusB_To(2 downto 0) <= SSS;
            Set_BusB_To(3) <= '0';
            if IRB = "00110110" or ISet = "01" then
               -- LD (HL),n
               Inc_PC <= '1';
            else
               NoRead <= '1';
            end if;
         end if;
      end if;

   end process;

end;
