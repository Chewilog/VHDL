entity seg is 
	port(a,b,c,d 		                        :IN 	 bit;
			da,db,dc,dd,de,df,dg			    :OUT     bit);
			
end entity;

architecture dec7 of seg is 
begin
	da <= (not a and not b and not c and d) or (not a and b and not c and not d)or(a and b and not c and d)or(a and not b and c and d);	
    db <= (not a and b and not c and d)or(a and b and not d)or(a and c and d);
    dc <= (not a and not b and c and not d)or(a and b and not d)or(a and b and c);
    dd <= (not a and not b and not c and d)or(not a and b and not c and not d)or(b and c and d)or(a and not b and c and not d);
    de <= (not a and d)or(not b and not c and d)or(not a and b and not c);
    df <= (not a and not b and d)or(not a and c and d)or(not a and not b and c)or(a and b and not c and d);
    dg <= (not a and not b and not c)or(not a and b and c and d)or(a and b and not c and not d);
end architecture;	