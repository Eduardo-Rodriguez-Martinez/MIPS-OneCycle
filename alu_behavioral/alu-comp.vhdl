library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (  A, B   : in std_logic_vector(31 downto 0);
	    shamt  : in std_logic_vector(4 downto 0);
            ALUctl : in std_logic_vector(3 downto 0);
            ALUout : out std_logic_vector(31 downto 0);
            Zero   : out std_logic );
end alu;

architecture comportamiento of alu is
    signal result : std_logic_vector(31 downto 0);
    signal reShft: std_logic_vector(31 downto 0) := (others => '0');
    signal ResSLT : std_logic_vector(31 downto 0) := (others => '0');
    component shift is port(
	datain : in std_logic_vector(31 downto 0);
	dataout : out std_logic_vector(31 downto 0);
	shamt : in std_logic_vector(4 downto 0) );
     end component;
begin
    Zero <= '0' when unsigned(result) > 0 else '1';
    S0: shift port map (B, reShft ,shamt);
    with ALUctl select
        result <= A and B when "0000",
                  A or  B when "0001",
                  std_logic_vector(signed(A) + signed(B)) when "0010",
                  std_logic_vector(signed(A) - signed(B)) when "0110",
                  ResSLT  when "0111",
                  not( A or B ) when "1100",
                  reShft when "1000",
		  (others => '0') when others;
    ResSLT(0) <= '1' when signed(A) < signed(B) else '0';
    ALUout <= result;
end comportamiento;
