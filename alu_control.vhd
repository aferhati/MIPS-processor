------------------------------------------------------
-- ALU Control component
-- 
-- Used for deciding which operation the alu shoud perform.
--
-- add: 0010
-- subtract: 0110
-- and: 0000
-- or: 0001
-- set-on-less-than: 0111
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_control is
	port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(1 downto 0);
		alu_control_fuct: out std_logic_vector(3 downto 0)
	);
end alu_control;

architecture beh of alu_control is
	signal add: std_logic_vector(3 downto 0):= "0010";
	signal subtract: std_logic_vector(3 downto 0):= "0110";
	signal and_op: std_logic_vector(3 downto 0):= "0000";
	signal or_op: std_logic_vector(3 downto 0):= "0001";
	signal set_on_less_than: std_logic_vector(3 downto 0):= "0111";

	begin

	alu_control_fuct <= add when(alu_op="00" or (alu_op="10" and funct="100000")) else
						subtract when(alu_op="01" or (alu_op="10" and funct="100010"))else
						and_op when(alu_op="10" and funct="100100") else
						or_op when(alu_op="10" and funct="100101") else
						set_on_less_than when(alu_op="10" and funct="101010");
						

end beh;