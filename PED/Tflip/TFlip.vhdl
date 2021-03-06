entity TFlip is 
	port(
	        cl         :           in   bit;
			t 		    : 			in   bit;
			rs			:			in   bit;
			q			:			buffer bit;	
			qn 	:			out bit
			);
end entity;			


architecture ArcT of TFlip is 
begin
qn <= not q;
	process(cl,rs)
	begin
		if				(rs='1')             then q <= '0';
		elsif    		(cl'event and  cl='1' and t ='1') then q<=not q;
		end if;
	end process;
end architecture;	