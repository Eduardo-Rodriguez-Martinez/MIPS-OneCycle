library ieee;
use ieee.std_logic_1164.all;

entity ALUControl is
    port ( ALUOp : in std_logic_vector(1 downto 0);
           FuncCode : in std_logic_vector(5 downto 0);
           ALUCtl : out std_logic_vector(3 downto 0) );
end ALUControl;

architecture comportamiento of ALUControl is
begin
    ALUCtl <= "0010" when ALUOp = "00" else
              "0110" when ALUOp = "01" else
              "0010" when (ALUOp = "10") and (FuncCode = "100000") else
              "0110" when (ALUOp = "10") and (FuncCode = "100010") else
              "0000" when (ALUOp = "10") and (FuncCode = "100100") else
              "0001" when (ALUOp = "10") and (FuncCode = "100101") else
              "0111" when (ALUOp = "10") and (FuncCode = "101010") else
	          "1000" when (ALUOp = "10") and (FuncCode = "000000") else
              "1111";


end comportamiento;
