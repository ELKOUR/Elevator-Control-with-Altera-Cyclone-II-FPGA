--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:07:26 06/08/2022
-- Design Name:   
-- Module Name:   D:/Projet Dev/ise/quatreetage/tb.vhd
-- Project Name:  quatreetage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cas4Etage
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cas4Etage
    PORT(
         e : IN  std_logic_vector(3 downto 0);
         det1 : IN  std_logic;
         det2 : IN  std_logic;
         det3 : IN  std_logic;
         det4 : IN  std_logic;
         reset : IN  std_logic;
         por : IN  std_logic;
         motorP : OUT  std_logic;
         motorM : OUT  std_logic;
         led1 : OUT  std_logic;
         led2 : OUT  std_logic;
         led3 : OUT  std_logic;
         led4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal e : std_logic_vector(3 downto 0) := (others => '0');
   signal det1 : std_logic := '0';
   signal det2 : std_logic := '0';
   signal det3 : std_logic := '0';
   signal det4 : std_logic := '0';
   signal reset : std_logic := '0';
   signal por : std_logic := '0';

 	--Outputs
   signal motorP : std_logic;
   signal motorM : std_logic;
   signal led1 : std_logic;
   signal led2 : std_logic;
   signal led3 : std_logic;
   signal led4 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cas4Etage PORT MAP (
          e => e,
          det1 => det1,
          det2 => det2,
          det3 => det3,
          det4 => det4,
          reset => reset,
          por => por,
          motorP => motorP,
          motorM => motorM,
          led1 => led1,
          led2 => led2,
          led3 => led3,
          led4 => led4
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;
   reset <='1' ,'0' after 50 ns;
	por <= '1' ;
	e <= "1111","1110" after 100 ns,"1101" after 200 ns ,"1110" after 300 ns ,"1011" after 400 ns, "1110" after 500 ns ,
		 "0111" after 600 ns,"1110" after 700 ns;
	det1 <='0','1' after 200 ns,'0' after 350 ns,'1' after 400 ns,'0' after 550 ns,'1' after 600 ns,'0' after 750 ns;
	det2 <='1','0' after 250 ns,'1' after 310 ns,'0' after 420 ns,'1' after 430 ns,'0' after 520 ns,'1' after 530 ns,
		   '0' after 615 ns,'1' after 625 ns,'0' after 735 ns,'1' after 745 ns;
	det3 <='1','0' after 450 ns,'1' after 510 ns,'0' after 635 ns,'1' after 645 ns,'0' after 715 ns,'1' after 725 ns;
	det4 <='1','0' after 655 ns ,'1' after 700 ns;
	
	
	
END;
