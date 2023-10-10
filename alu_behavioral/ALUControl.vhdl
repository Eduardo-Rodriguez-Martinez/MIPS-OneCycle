library ieee;
use ieee.std_logic_1164.all;

entity ALUControl is
    port ( ALUOp : in std_logic_vector(1 downto 0);
           FuncCode : in std_logic_vector(5 downto 0);
           op : in std_logic_vector(5 downto 0);
           ALUCtl : out std_logic_vector(3 downto 0) );
end ALUControl;

architecture comportamiento of ALUControl is
begin
    ALUCtl <= "0010" when ALUOp = "00" else -- lw y sw
              "0110" when ALUOp = "01" else -- beq y bne
              "0010" when (ALUOp = "10") and (FuncCode = "100000") else -- add
              "0110" when (ALUOp = "10") and (FuncCode = "100010") else -- sub
              "0000" when (ALUOp = "10") and (FuncCode = "100100") else -- and
              "0001" when (ALUOp = "10") and (FuncCode = "100101") else -- or
              "0111" when (ALUOp = "10") and (FuncCode = "101010") else -- slt
              "0011" when (ALUOp = "10") and (FuncCode = "000000") else -- sll
              "0010" when (ALUOp = "11") and (op = "001000") else -- addi
              "0111" when (ALUOp = "11") and (op = "001010") else -- slti
              "1111";

--    with ALUOp&FuncCode select
--        ALUCtl <= "0010" when "00------",
--                 "0110" when "-1------",
--                  "0010" when "1---0000",
--                  "0110" when "1---0010",
--                  "0000" when "1---0100",
--                  "0001" when "1---0101",
--                  "0111" when "1---1010",
--                  "1111" when others;

end comportamiento;
