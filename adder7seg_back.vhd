----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:13:50 09/21/2024 
-- Design Name: 
-- Module Name:    adder7seg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder7seg is
    Port ( dip_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dip_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
           c_o : out  STD_LOGIC);
end adder7seg;

architecture Behavioral of adder7seg is
signal c0 : STD_LOGIC_VECTOR (3 downto 0);

	component add_4 
		Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c_o : out  STD_LOGIC);
	end component;
	
	component bcd7
		Port ( hex_in : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
		
begin

	U0: add_4 port map(
		x => dip_0,
		y => dip_1,
		s => c0,
		c_o => c_o
	);
	
	U1: bcd7 port map(
		hex_in => c0,
		seg_out => seg
	);

end Behavioral;

