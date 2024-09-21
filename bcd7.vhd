----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:08:20 09/21/2024 
-- Design Name: 
-- Module Name:    bcd7 - Behavioral 
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

entity bcd7 is
    Port ( hex_in : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end bcd7;

architecture Behavioral of bcd7 is

begin
	process (hex_in)
	begin
    case hex_in is
      when "0000" => -- 0
               seg_out <= "0111111"; 
            when "0001" => -- 1
               seg_out <= "0000110"; 
            when "0010" => -- 2
               seg_out <= "1011011"; 
            when "0011" => -- 3
               seg_out <= "1001111"; 
            when "0100" => -- 4
               seg_out <= "1100110"; 
            when "0101" => -- 5
               seg_out <= "1101101"; 
            when "0110" => -- 6
               seg_out <= "1111101"; 
            when "0111" => -- 7
               seg_out <= "0000111"; 
            when "1000" => -- 8
               seg_out <= "1111111"; 
            when "1001" => -- 9
               seg_out <= "1101111"; 
				when "1010" => seg_out <= "1110111"; -- A
				when "1011" => seg_out <= "1111100"; -- B
				when "1100" => seg_out <= "0111001"; -- C
				when "1101" => seg_out <= "1011110"; -- D
				when "1110" => seg_out <= "1111001"; -- E
				when "1111" => seg_out <= "1110001"; -- F
						
            when others =>
                seg_out <= "0000000";
    end case;
  end process;


end Behavioral;

