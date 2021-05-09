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

-- This file is part of the ZX Spectrum Next Project
-- <https://gitlab.com/SpectrumNext/ZX_Spectrum_Next_FPGA/tree/master/cores>
--
-- Modifications for the ZX Spectrum Next were made by:
--
-- Fabio Belavenuto : partial fix of wait bug
-- Victor Trucco, Fabio Belavenuto, Garry Lancaster : additional instructions
-- Charlie Ingley : complete fix of wait logic
-- ACX : implement undocumented flags for SLI r,(IY+s)

library ieee;
use ieee.std_logic_1164.std_logic_vector;

package Z80N_pack is 
   type Z80N_seq is ( NONE, MMU, NEXTREGW, MUL_DE, ADD_HL_A, ADD_DE_A, ADD_BC_A, SWAPNIB_A, PIXELDN, SET_A_E, PIXELAD, MIRROR_A, PUSH_nn, LDPIRX, ADD_HL_nn , ADD_DE_nn , ADD_BC_nn,
   LDIRSCALE,
   BSLA_DE_B, BSRA_DE_B, BSRL_DE_B, BSRF_DE_B, BRLC_DE_B,
   JP_C);
   signal Z80N_seq_s    : Z80N_seq;
end package;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_1164.all;
use work.Z80N_pack.all;

package T80N_Pack is

   

   component T80N
   generic(
      Mode : integer := 0; -- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
      IOWait : integer := 0;  -- 1 => Single cycle I/O, 1 => Std I/O cycle
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
      RESET_n     : in std_logic;
      CLK_n    : in std_logic;
      CEN         : in std_logic;
      WAIT_n      : in std_logic;
      INT_n    : in std_logic;
      NMI_n    : in std_logic;
      BUSRQ_n     : in std_logic;
      M1_n     : out std_logic;
      IORQ     : out std_logic;
      NoRead      : out std_logic;
      Write    : out std_logic;
      RFSH_n      : out std_logic;
      HALT_n      : out std_logic;
      BUSAK_n     : out std_logic;
      A        : out std_logic_vector(15 downto 0);
      DInst    : in std_logic_vector(7 downto 0);
      DI       : in std_logic_vector(7 downto 0);
      DO       : out std_logic_vector(7 downto 0);
      MC       : out std_logic_vector(2 downto 0);
      TS       : out std_logic_vector(2 downto 0);
      IntCycle_n  : out std_logic;
      IntE     : out std_logic;
      Stop     : out std_logic;
      -- extended functions
      Z80N_dout_o       : out std_logic := '0';
      Z80N_data_o       : out std_logic_vector(15 downto 0);
      Z80N_command_o    : out Z80N_seq
   );
   end component;

   component T80N_Reg
   port(
      Clk         : in std_logic;
      CEN         : in std_logic;
      WEH         : in std_logic;
      WEL         : in std_logic;
      AddrA    : in std_logic_vector(2 downto 0);
      AddrB    : in std_logic_vector(2 downto 0);
      AddrC    : in std_logic_vector(2 downto 0);
      DIH         : in std_logic_vector(7 downto 0);
      DIL         : in std_logic_vector(7 downto 0);
      DOAH     : out std_logic_vector(7 downto 0);
      DOAL     : out std_logic_vector(7 downto 0);
      DOBH     : out std_logic_vector(7 downto 0);
      DOBL     : out std_logic_vector(7 downto 0);
      DOCH     : out std_logic_vector(7 downto 0);
      DOCL     : out std_logic_vector(7 downto 0);
      
      --extended 
      reg_wr_i : in std_logic_vector(5 downto 0) := (others=>'0'); 
      reg_BC_i : in std_logic_vector(15 downto 0);
      reg_HL_i : in std_logic_vector(15 downto 0);
      reg_DE_i : in std_logic_vector(15 downto 0);
      reg_BC_o : out std_logic_vector(15 downto 0);
      reg_HL_o : out std_logic_vector(15 downto 0);
      reg_DE_o : out std_logic_vector(15 downto 0)

   );
   end component;

   component T80N_MCode
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
      
      -- entended functions
      ext_ACC_i         : in std_logic_vector(7 downto 0);
      ext_Data_i        : in std_logic_vector(7 downto 0);
      
      Z80N_dout_o       : out std_logic := '0';
      Z80N_data_o       : out std_logic_vector(15 downto 0);
      Z80N_command_o    : out Z80N_seq
   );
   end component;

   component T80N_ALU
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
      Arith16     : in std_logic;
      Z16         : in std_logic;
      ALU_Op      : in std_logic_vector(3 downto 0);
      IR       : in std_logic_vector(5 downto 0);
      ISet     : in std_logic_vector(1 downto 0);
      BusA     : in std_logic_vector(7 downto 0);
      BusB     : in std_logic_vector(7 downto 0);
      F_In     : in std_logic_vector(7 downto 0);
      Q        : out std_logic_vector(7 downto 0);
      F_Out    : out std_logic_vector(7 downto 0)
   );
   end component;
   
   

end;
