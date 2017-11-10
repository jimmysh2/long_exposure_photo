library ieee;
use ieee.std_logic_1164.all;

package pkg is
  type output_type is array (0 to 9,0 to 7) of std_logic_vector(6 downto 0);
end package;

package body pkg is
end package body;

---------------TEXT STORAGE ENTITY
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.pkg.all;

entity text_storage is
    port(reset,load,display:in std_logic;input:std_logic_vector(5 downto 0);
         output: out output_type;number_of_inputs:out std_logic_vector(7 downto 0);
         l1,l0:out std_logic_vector(3 downto 0));
end entity;
-------------- DISPLAY_BLOCK
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.pkg.all;

entity display_block is
    port (work_clock,display_clock:in std_logic; pattern: in output_type; display:in std_logic;
          a1,a0,b1,b0:in std_logic_vector(3 downto 0);
          LED_output: out std_logic_vector(6 downto 0);anode: out std_logic_vector(3 downto 0);
          cathode:out std_logic_vector(6 downto 0));
end entity;
-----------------
----CLOCK SETTER
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity clock_set is
    port(b,clock_in : in std_logic; work_clock,display_clock : out std_logic;
         freq:in std_logic_vector(5 downto 0));
end entity;
------------ MAIN ENTITY
library ieee;
use ieee.std_logic_1164.all;
use work.pkg.all;

entity main is
port(reset,load,display,clk:in std_logic;freq,input: in std_logic_vector(5 downto 0);
    LED_output: out std_logic_vector(6 downto 0);anode: out std_logic_vector(3 downto 0);
    cathode:out std_logic_vector(6 downto 0));
end entity;
------
---------------- END OF ENTITIES-----------
----------
------ MAIN architecture
architecture behav of main is
signal temp : output_type;
signal work_clock,display_clock : std_logic;
signal a1,a0,b1,b0 : std_logic_vector(3 downto 0);
signal number_of_inputs: std_logic_vector(7 downto 0);
begin
x1: entity work.text_storage(behav)
    port map(reset,load,display,input,temp,number_of_inputs,b1,b0);
    ----------
    a1<=number_of_inputs(7 downto 4);
    a0<=number_of_inputs(3 downto 0);
x2: entity work.display_block(behav)
        port map(work_clock,display_clock,temp,display,a1,a0,b1,b0,LED_output,anode,cathode);    
    ----------
x3: entity work.clock_set(behav)
        port map('0',clk,work_clock,display_clock,freq);
end architecture;

------------- ARCHITECTURE OF text_storage(REQUEST_HANDLER)
architecture behav of text_storage is
signal count: integer:=0;
signal n1,n0: std_logic_vector(3 downto 0);
begin
---- output total number of inputs
number_of_inputs<= n1&n0;
-----
process(load,reset)
    begin
    if reset='1' then
        for i in 0 to 9 loop
            for j in 0 to 7 loop --- here j= 5 to 7 is for gap
                output(i,j)<="0000000";
            end loop;
        end loop;
        count<=0;
        n0<="0000";n1<="0000";
        l0<="0000";l1<="0000";
        
    elsif load = '1' and load'event and display ='0' then
        ---------- A ------------
        if input = "000001" then
            l1<="0000";l0<="0001";
            output(count, 0) <= "0111111";
            output(count, 1) <= "1000100";
            output(count, 2) <= "1000100";
            output(count, 3) <= "1000100";
            output(count, 4) <= "0111111";
        --------- B --------------
        elsif input = "000010" then
            l1<="0000";l0<="0010";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1001001";
            output(count, 2) <= "1001001";
            output(count, 3) <= "1001001";
            output(count, 4) <= "0110110";
        --------- C --------------
        elsif input = "000011" then
            l1<="0000";l0<="0011";
            output(count, 0) <= "0111110";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1000001";
            output(count, 3) <= "1000001";
            output(count, 4) <= "0100010";
        --------- D --------------
        elsif input = "000100" then
            l1<="0000";l0<="0100";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1000001";
            output(count, 3) <= "1000001";
            output(count, 4) <= "0111110";
        --------- E --------------
        elsif input = "000101" then
            l1<="0000";l0<="0101";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1001001";
            output(count, 2) <= "1001001";
            output(count, 3) <= "1001001";
            output(count, 4) <= "1000001";
        --------- F --------------
        elsif input = "000110" then
            l1<="0000";l0<="0110";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1001000";
            output(count, 2) <= "1001000";
            output(count, 3) <= "1001000";
            output(count, 4) <= "1000000";
        --------- G --------------
        elsif input = "000111" then
            l1<="0000";l0<="0111";
            output(count, 0) <= "0111110";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1000101";
            output(count, 3) <= "1000101";
            output(count, 4) <= "0100110";
        --------- H --------------
        elsif input = "001000" then
            l1<="0000";l0<="1000";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0001000";
            output(count, 2) <= "0001000";
            output(count, 3) <= "0001000";
            output(count, 4) <= "1111111";
        --------- I --------------
        elsif input = "001001" then
            l1<="0000";l0<="1001";
            output(count, 0) <= "1000001";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1111111";
            output(count, 3) <= "1000001";
            output(count, 4) <= "1000001";
        --------- J --------------
        elsif input = "001010" then
            l1<="0001";l0<="0000";
            output(count, 0) <= "0000110";
            output(count, 1) <= "0000001";
            output(count, 2) <= "0000001";
            output(count, 3) <= "0000001";
            output(count, 4) <= "1111110";
        --------- K --------------
        elsif input = "001011" then
            l1<="0001";l0<="0001";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0001000";
            output(count, 2) <= "0010100";
            output(count, 3) <= "0100010";
            output(count, 4) <= "1000001";
        --------- L --------------
        elsif input = "001100" then
            l1<="0001";l0<="0010";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0000001";
            output(count, 2) <= "0000001";
            output(count, 3) <= "0000001";
            output(count, 4) <= "0000001";
        --------- M --------------
        elsif input = "001101" then
            l1<="0001";l0<="0011";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0100000";
            output(count, 2) <= "0010000";
            output(count, 3) <= "0100000";
            output(count, 4) <= "1111111";
        --------- N --------------
        elsif input = "001110" then
            l1<="0001";l0<="0100";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0010000";
            output(count, 2) <= "0001000";
            output(count, 3) <= "0000100";
            output(count, 4) <= "1111111";
        --------- O --------------
        elsif input = "001111" then
            l1<="0001";l0<="0101";
            output(count, 0) <= "0111110";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1000001";
            output(count, 3) <= "1000001";
            output(count, 4) <= "0111110";
        --------- P --------------
        elsif input = "010000" then
            l1<="0001";l0<="0110";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1000100";
            output(count, 2) <= "1000100";
            output(count, 3) <= "1000100";
            output(count, 4) <= "0111000";
        --------- Q --------------
        elsif input = "010001" then
            l1<="0001";l0<="0111";
            output(count, 0) <= "0111110";
            output(count, 1) <= "1000001";
            output(count, 2) <= "1000101";
            output(count, 3) <= "1000011";
            output(count, 4) <= "0111111";
        --------- R --------------
        elsif input = "010010" then
            l1<="0001";l0<="1000";
            output(count, 0) <= "1111111";
            output(count, 1) <= "1000100";
            output(count, 2) <= "1000100";
            output(count, 3) <= "1000100";
            output(count, 4) <= "0111011";
        --------- S --------------
        elsif input = "010011" then
            l1<="0001";l0<="1001";
            output(count, 0) <= "0110010";
            output(count, 1) <= "1001001";
            output(count, 2) <= "1001001";
            output(count, 3) <= "1001001";
            output(count, 4) <= "0100110";
        --------- T --------------
        elsif input = "010100" then
            l1<="0010";l0<="0000";
            output(count, 0) <= "1000000";
            output(count, 1) <= "1000000";
            output(count, 2) <= "1111111";
            output(count, 3) <= "1000000";
            output(count, 4) <= "1000000";
        --------- U --------------
        elsif input = "010101" then
            l1<="0010";l0<="0001";
            output(count, 0) <= "1111110";
            output(count, 1) <= "0000001";
            output(count, 2) <= "0000001";
            output(count, 3) <= "0000001";
            output(count, 4) <= "1111110";
        --------- V --------------
        elsif input = "010110" then
            l1<="0010";l0<="0010";
            output(count, 0) <= "1111100";
            output(count, 1) <= "0000010";
            output(count, 2) <= "0000001";
            output(count, 3) <= "0000010";
            output(count, 4) <= "1111100";
        --------- W --------------
        elsif input = "010111" then
            l1<="0010";l0<="0011";
            output(count, 0) <= "1111111";
            output(count, 1) <= "0000010";
            output(count, 2) <= "0000100";
            output(count, 3) <= "0000010";
            output(count, 4) <= "1111111";
        --------- X --------------
        elsif input = "011000" then
            l1<="0010";l0<="0100";
            output(count, 0) <= "1100011";
            output(count, 1) <= "0010100";
            output(count, 2) <= "0001000";
            output(count, 3) <= "0010100";
            output(count, 4) <= "1100011";
        --------- Y --------------
        elsif input = "011001" then
            l1<="0010";l0<="0101";
            output(count, 0) <= "1110000";
            output(count, 1) <= "0001000";
            output(count, 2) <= "0000111";
            output(count, 3) <= "0001000";
            output(count, 4) <= "1110000";
        --------- Z --------------
        elsif input = "011010" then
            l1<="0010";l0<="0110";
            output(count, 0) <= "1000011";
            output(count, 1) <= "1000101";
            output(count, 2) <= "1001001";
            output(count, 3) <= "1010001";
            output(count, 4) <= "1100001";
        else
            l1<="0000";l0<="0000";
            output(count, 0) <= "0000000";
            output(count, 1) <= "0000000";
            output(count, 2) <= "0000000";
            output(count, 3) <= "0000000";
            output(count, 4) <= "0000000";
        end if;
        count<=count+1;
        if(n0>="1001") then
            n0<="0000";
            n1<=n1+1;
        else
            n0<=n0+1;
        end if;
        
    end if;
end process;
end architecture;
---------------

---------- ARCHITECTURE OF DISPLAY_BLOCK
architecture behav of display_block is

signal char,part : integer:=0;
begin

    process(work_clock)
        begin
        if work_clock = '1' and work_clock'event then
            ------- LED display
            if display = '1' then
                LED_output<=pattern(char,part);
                if part=7 then part <=0; if char =9 then char<=0; else char<=char+1; end if;
                else part<=part+1;
                end if;
            else
                LED_output<="0000000";
                char<=0;
                part<=0;
            end if;
            -------
            -----------------
        end if;
    end process;

    -------------- SSD display
    process(display_clock)
        variable count : integer:=0;
        variable digits : std_logic_vector(3 downto 0);
        begin
        if display_clock ='1' and display_clock'event then
            if display = '0' then
                if(count=4) then count:=1;
                else count:=count+1;
                end if;
        
                case count is
                    when 4 => anode<= "1110"; digits:=a0;
                    when 3 => anode<= "1101"; digits:=a1;
                    when 2 => anode<= "1011"; digits:=b0;
                    when 1 => anode<= "0111"; digits:=b1;
                    when others =>anode<="0000";
                end case;
        
                case digits is
                    when "0000" => cathode<="1000000";
                    when "0001" => cathode<="1111001";
                    when "0010" => cathode<="0100100";
                    when "0011" => cathode<="0110000";
                    when "0100" => cathode<="0011001";
                    when "0101" => cathode<="0010010";
                    when "0110" => cathode<="0000010";
                    when "0111" => cathode<="1111000";
                    when "1000" => cathode<="0000000";
                    when others => cathode<="0010000";
                end case;
            else
                anode<="1111";cathode<="1111111";
            end if;
        end if;
    end process;
end architecture;
--------
-------- ARCHITECTURE OF CLOCK_SETTER
architecture behav of clock_set is
        signal counter : std_logic_vector(25 downto 0):=(others=>'0');
        --signal c : integer:=0;
        begin
        
        process(clock_in)
        begin
            if(clock_in='1' and clock_in'event) then
                counter <= counter +1;
            end if;
        end process;
        
        display_clock <= counter(17) when b='0' else clock_in;
        --work_clock <= clock_in when b='1';
        with freq select work_clock <=
                                    counter(15) when "100000",
                                    counter(16) when "010000",
                                    counter(17) when "001000",
                                    counter(18) when "000100",
                                    counter(19) when "000010",
                                    counter(24) when "000001",
                                    clock_in    when others;
            
end architecture;
--------------------
---------------------------------------- END OF PROJECT -----------------------------------------