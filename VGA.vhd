library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
    port (  clock_100 : in std_logic;
            testvector : in std_logic_vector(3 downto 0);
            Hsync, Vsync : out std_logic;
            vgaRed, vgaBlue, vgaGreen : out std_logic_vector(3 downto 0));
end vga;

architecture behavioral of vga is

    signal vga_clk, reset : std_logic:='0';
    
    component sync is
    port(   clk : in std_logic;
            testvect : in std_logic_vector(3 downto 0);
            Hsync, Vsync : out std_logic;
            vgaRed, vgaGreen, vgaBlue : out std_logic_vector(3 downto 0));
    end component;
    
    component clk_wiz_0
    port(   clk_in1 : in std_logic;
            reset : in std_logic;
            clk_out1 : out std_logic);
    end component;
           

begin
    g1 : sync port map (vga_clk, testvector, Hsync, Vsync, vgaRed, vgaGreen, vgaBlue);
    g2 : clk_wiz_0 port map (clock_100, reset, vga_clk);
    
end behavioral;
