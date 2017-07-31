library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync is
    port ( clk : in std_logic;
           testvect : in std_logic_vector(3 downto 0);
           Hsync, Vsync : out std_logic;
           vgaRed, vgaGreen, vgaBlue : out std_logic_vector(3 downto 0));
end sync;

architecture behavioral of sync is
signal hpos: integer range 0 to 1056:= 0;
signal vpos: integer range 0 to 628:= 0;
begin
    process(clk,testvect)
    begin
        if(clk'event and clk = '1') then
            
            if(testvect = "0001") then
                if (hpos < 656) then
                    vgaRed <= (others => '0');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '0');
                elsif (hpos > 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '1');
                end if;
            elsif (testvect = "0010") then
                if (hpos < 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '0');
                elsif (hpos > 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '1');
                end if;
            elsif (testvect = "0100") then
                if (hpos < 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                elsif (hpos > 656) then
                    vgaRed <= (others => '0');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '1');
                end if;
            elsif (testvect = "1000") then
                if (hpos < 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                elsif (hpos > 656) then
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= (others => '1');              
                    vgaGreen <= (others => '1');
                    vgaBlue <= (others => '1');
                end if;
            else
                vgaRed <= (others => '0');              
                vgaGreen <= (others => '0');
                vgaBlue <= (others => '0');
            end if;
            
            if(hpos < 1056) then
                hpos <= hpos + 1;
            else
                hpos <= 0;
                if(vpos < 628) then
                    vpos <= vpos + 1;
                else
                    vpos <= 0;
                end if;
            end if;
            if(hpos>40 and hpos<168) then
                Hsync <= '0';
            else 
                Hsync <= '1';
            end if;
            if(vpos>1 and vpos<5) then
                Vsync <= '0';
            else
                Vsync <= '1';
            end if;
            if((hpos>0 and hpos <256) or (vpos>0 and vpos<28)) then
                vgaRed <= (others => '0');              
                vgaGreen <= (others => '0');
                vgaBlue <= (others => '0');
            end if;
        end if;
    end process;
    
    
end behavioral;
