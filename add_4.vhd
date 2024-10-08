----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:44:07 09/21/2024 
-- Design Name: 
-- Module Name:    add_4 - Behavioral 
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

entity add_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c_o : out  STD_LOGIC);
end add_4;

architecture Behavioral of add_4 is
	signal sig0, sig1, sig2 : STD_LOGIC;
	signal sum : STD_LOGIC_VECTOR (3 downto 0);
	signal carry : STD_LOGIC_VECTOR (4 downto 0);

	component FA
		Port ( a : in  STD_LOGIC;
			   b : in  STD_LOGIC;
			   c_in : in  STD_LOGIC;
			   s : out  STD_LOGIC;
			   c_o : out  STD_LOGIC);
	end component;

	component HA
		Port ( a : in  STD_LOGIC;
			   b : in  STD_LOGIC;
			   s : out  STD_LOGIC;
			   c_o : out  STD_LOGIC);
	end component;

begin
	-- Initialize carry-in to 0
	carry(0) <= '0';

	-- Instantiate Half Adder for the least significant bit
	U_0: HA port map(
		a => x(0),
		b => y(0),
		s => sum(0),
		c_o => carry(1)
	);

	-- Instantiate Full Adders for the remaining bits
	U_1: FA port map(
		a => x(1),
		b => y(1),
		c_in => carry(1),
		s => sum(1),
		c_o => carry(2)
	);

	U_2: FA port map(
		a => x(2),
		b => y(2),
		c_in => carry(2),
		s => sum(2),
		c_o => carry(3)
	);

	U_3: FA port map(
		a => x(3),
		b => y(3),
		c_in => carry(3),
		s => sum(3),
		c_o => carry(4)
	);

	-- Output the sum
	s <= sum;

	-- Determine carry-out
	c_o <= '1' when (unsigned(sum) >= 10) else '0';

end Behavioral;


