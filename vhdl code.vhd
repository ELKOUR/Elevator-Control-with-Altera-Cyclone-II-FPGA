
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cas4Etage is 
Port (
	e: in std_logic_vector(3 downto 0) ;
	det1,det2,det3,det4 : in std_logic ;
	reset ,por: in std_logic ;
	motorP,motorM,led1,led2,led3,led4 : out std_logic );
end cas4Etage ;

architecture archi of cas4Etage is
type etat is (e1,e2d,e2u,e3d,e3u,e4) ;
signal etata, etatf ,etatm: etat ;
signal b :  std_logic_vector(3 downto 0) :="1111" ;
begin 

process(e,reset)
begin 
if reset='1' then b <= "1111" ;
else  
	if e(0)='0' then b <="1110" ;
	elsif e(1)='0' then b <="1101" ;
	elsif e(2)='0' then b <="1011" ;
	elsif e(3)='0' then b <="0111" ;
	end if ;
end if ;
end  process ;
  
process(reset,b,por,etata,det1,det2,det3,det4)

begin

if reset ='1' then etata <=e1 ;etatf <=e1;motorP<='0' ;motorM<='0';
else
    
case etata is
  when e1 => if b = "0111" or b="1011" or b="1101" then 
					if por='1' then
						etatf <= e2u ;
						motorP <='1';
						motorM <='0';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det2 ='0' then 
						etata <=e2u;
					end if;
	          else etatf <= e1 ;
		         motorP <='0';
      		   motorM <='0';
	          end if;
  when e2u => if b = "0111" or b="1011"  then 
		         
		         if por='1' then
					   etatf <= e3u ;
						motorP <='1';
						motorM <='0';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det3 ='0' then 
						etata <=e3u;
					end if;
	           elsif b="1110" then
				   etatf <=e2d;
	         	motorP <='0';
		         motorM <='0';
					if det2 ='0' then 
						etata <=e2d;
					end if;
				  else 
				   etatf <=e2u ;
				   motorP <='0';
		         motorM <='0';
	           end if;
  when e2d => if b="1110" then 
		         
		         if por='1' then
					   etatf <= e1;
						motorP <='0';
						motorM <='1';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det1 ='0' then 
						etata <=e1;
					end if;
				  elsif b="0111" or b="1011" then 
		         etatf <= e2u ;
		         motorP <='0';
		         motorM <='0';
					if det2 ='0' then 
						etata <=e2u;
					end if;
	           else
				   etatf <= e2d ;
		         motorP <='0';
		         motorM <='0';
	           end if;
  when e3u => if b="1101" or b="1110" then 
		         etatf <= e3d;
		         motorP <='0';
		         motorM <='0';
					if det3 ='0' then 
						etata <=e3d;
					end if;
				  elsif  b="0111" then 
		         
		         if por='1' then
					   etatf <= e4;
						motorP <='1';
						motorM <='0';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det4 ='0' then 
						etata <=e4;
					end if;
	           else 
				   etatf <= e3u ;
		         motorP <='0';
		         motorM <='0';
	           end if;
  when e4 => if b = "1110" or b="1011" or b="1101" then 
		         
		         if por='1' then
					   etatf <= e3d ;
						motorP <='0';
						motorM <='1';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det3 ='0' then 
						etata <=e3d;
					end if;
	          else etatf <= e4 ;
		         motorP <='0';
      		   motorM <='0';
				 end if;
  when e3d => if b="0111" then 
		         etatf <= e3u;
		         motorP <='0';
		         motorM <='0';
					if det3 ='0' then 
						etata <=e3u;
					end if;
				  elsif b="1110" or b="1101" then 
		         
		         if por='1' then
					   etatf <= e2d ;
						motorP <='0';
						motorM <='1';
					else 
						motorP <='0';
						motorM <='0';
					end if;
					if det2 ='0' then 
						etata <=e2d;
					end if;
	           else
				   etatf <= e3d ;
		         motorP <='0';
		         motorM <='0';
	           end if;

  when others => null;
end case;
end if ;

end process;
process (b,etata,etatf)
begin 
case etata is 
 when e1 => if b="1101" then led2<='1' ;
				elsif b="1011" then led3<='1' ;
				elsif b="0111" then led4<='1' ;
				else led1 <='0';led2<='0';led3 <='0';led4 <='0' ;
				end if;
 when e2u|e2d => if b="1110" then led1<='1' ;
					  elsif b="1011" then led3<='1' ;
				     elsif b="0111" then led4<='1' ;
				     else led1 <='0';led2<='0';led3 <='0';led4 <='0' ;
				     end if;
 when e3u|e3d => if  b="1110" then led1<='1' ;
					  elsif  b="1101" then led2<='1' ;
				     elsif  b="0111" then led4<='1' ;
				     else led1 <='0';led2<='0';led3 <='0';led4 <='0' ;
				     end if;
 when e4 => if  b="1101" then led2<='1' ;
				elsif  b="1011" then led3<='1' ;
				elsif  b="1110" then led1<='1' ;
				else led1 <='0';led2<='0';led3 <='0';led4 <='0' ;
				end if;	
end case ;
end process;				


end archi;

