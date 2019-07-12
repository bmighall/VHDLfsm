----------------------------------------------------------------------------------
-- University of Mississippi El E 386
-- Lab 3, Part A 
-- Engineer: Ben Mighall
--
-- This program implements a three-state Finite State Machine (FSM) with the following details: 
-- STATE A
-- goes to state A on reset
-- first bit 0 -> State B
-- first bit 1  -> State C
-- second bit doesn't matter
-- STATE B:
-- goes to state A on reset
-- on clock, goes to State C no matter what
-- STATE C:
-- goes to state A on reset
-- first bit doesn't matter
-- second bit 1 -> State A
-- second bit 0 -> State C
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM is
    Port ( SW : in STD_LOGIC_VECTOR (4 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           BTN : in STD_LOGIC_VECTOR (4 downto 0));
end FSM;

architecture Behavioral of FSM is

type state_type is (A, B, C); 
signal current_state, next_state: state_type;

begin

p1: process(current_state, next_state, BTN(4), BTN(2))
begin

if (BTN(4) = '1') then 
-- reset
    current_state <= A;  
elsif (BTN(2)'event and BTN(2) = '1') then 
    if (current_state = A) then
        if (SW(1) = '0') then
            next_state <= B;
        elsif (SW(1) = '1') then
            next_state <= C;
        end if;
    elsif (current_state = B) then
        next_state <= C;
    elsif (current_state = C) then
        if (SW(0) = '1') then
            next_state <= A;
        elsif (SW(0) = '0') then
            next_state <= C;
        end if;
    end if;
    current_state <= next_state;
end if;

if (current_state = A) then 
    LED(1) <= '0'; 
    LED(0) <= '0'; 
elsif (current_state = B) then
    LED(1) <= '0'; 
    LED(0) <= '1'; 
elsif (current_state = C) then
    LED(1) <= '1'; 
    LED(0) <= '0'; 
end if;

end process;
end Behavioral;
