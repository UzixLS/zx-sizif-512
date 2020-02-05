--------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Joerg Wolfram
--
-- Create Date:    	04.03.2007
-- Design Name:    
-- Module Name:    	chroma generator
-- Project Name:  	fbas-encoder		
-- Target Device:  	
-- Tool versions:  
-- Description:		generates the chroma component of the signal
--
-- Revision:		0.31
-- License:		GPL
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity chroma_gen is
    
port (
-------------------------------------------------------------------------------
--- io
-------------------------------------------------------------------------------
	cg_clock:	in std_logic;				--- input clock
	cg_enable:	in std_logic;				--- colour enable
	cg_hsync:	in std_logic;				--- hor. sync
	cg_pnsel:	in std_logic;				--- system (pal/ntsc)
	cg_rgb:		in std_logic_vector(2 downto 0);	--- rgb input
	cg_out:		out std_logic_vector(2 downto 0));	--- chroma out
end entity chroma_gen;


---############################################################################
--- 32MHz
---############################################################################
architecture clock32 of chroma_gen is

signal 	carrier: 	std_logic_vector(15 downto 0);
signal 	bcounter:	std_logic_vector(3 downto 0);
signal 	phase:		std_logic_vector(3 downto 0);
signal 	scarrier:	std_logic_vector(3 downto 0);
signal	oddeven:	std_logic;
signal 	burst,bstop:	std_logic;
signal	cenable:	std_logic;

begin
-------------------------------------------------------------------------------
--- DDS for PAL-carrier	
-------------------------------------------------------------------------------
    process (cg_clock) is
    begin
	if (rising_edge(cg_clock)) then
	    if (cg_pnsel='0') then
		carrier <= carrier + 9079;
	    else
		carrier <= carrier + 7331;
	    end if;
	end if;
    end process;

-------------------------------------------------------------------------------
--- burst generator	
-------------------------------------------------------------------------------
    process (bcounter) is
    begin
	if (bcounter="0000") then 
	    bstop <= '1';
	else
	    bstop <= '0';
	end if;
    end process;	        
    
    process (cg_hsync,bstop,carrier(15)) is
    begin
	if (cg_hsync='0') then
	    bcounter <= "0100";
	elsif ((rising_edge(carrier(15))) and (bstop='0'))  then
	    bcounter <= bcounter + 1;
	end if;
    end process;
    
    burst <= bcounter(3);

-------------------------------------------------------------------------------
--- odd/even line	
-------------------------------------------------------------------------------
    process (cg_hsync,cg_pnsel) is
    begin
	if (rising_edge(cg_hsync)) then
	    if (cg_pnsel='0') then
		oddeven <= not(oddeven);
	    else
		oddeven <= '0';
	    end if;	    
	end if;
    end process;
    	        
-------------------------------------------------------------------------------
--- carrier phase
-------------------------------------------------------------------------------
    process (cg_rgb,burst,oddeven) is
    begin
	if (burst='1') then
	    if ((oddeven = '0') and (cg_pnsel='0')) then
		phase <= "0110";			--- burst phase 135 deg 
	    else
		phase <= "1010";			--- burst phase -135 deg
	    end if;
	else    	    	
	    if (oddeven = '0') then
		case (cg_rgb) is
		    when "001" => phase <= "0000";	--- blue phase
		    when "010" => phase <= "0101";	--- red phase
		    when "011" => phase <= "0011";	--- magenta phase
		    when "100" => phase <= "1011";	--- green phase
		    when "101" => phase <= "1101";	--- cyan phase
		    when "110" => phase <= "0111";	--- yellow phase
		    when others => phase <= "0000";	--- dummy function
		end case;
	    else
		case (cg_rgb) is
		    when "001" => phase <= "0000";	--- blue phase
		    when "010" => phase <= "1011";	--- red phase
		    when "011" => phase <= "1101";	--- magenta phase
		    when "100" => phase <= "0101";	--- green phase
		    when "101" => phase <= "0011";	--- cyan phase
		    when "110" => phase <= "1001";	--- yellow phase
		    when others => phase <= "0000";	--- dummy function
		end case;
	    end if;    	 
	end if; 
    end process;

-------------------------------------------------------------------------------
--- modulated carrier
-------------------------------------------------------------------------------
    scarrier <= carrier(15 downto 12) + phase;

-------------------------------------------------------------------------------
--- colour enable
-------------------------------------------------------------------------------
    process (cg_rgb,cg_enable) is
    begin
	if ((cg_rgb/="000") and (cg_rgb/="111") and (cg_enable='1')) then
	    cenable <= '1';
	else
	    cenable <= '0';
	end if;
    end process;	        

-------------------------------------------------------------------------------
--- chroma signal
-------------------------------------------------------------------------------
    process (cg_clock) is
    begin
	if (rising_edge(cg_clock)) then
	    cg_out(2) <= cenable;
	    cg_out(1) <= burst;
	    cg_out(0) <= scarrier(3);
	end if;
    end process;	
	    
end architecture clock32;
