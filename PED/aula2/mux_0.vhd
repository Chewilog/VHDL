ENTITY mux_0 IS
  PORT (i0, i1, i2, i3    :  IN  BIT;  -- entradas 
        s0, s1            :  IN  BIT;  -- selecao
        ot                :  OUT BIT); -- saida
END mux_0;

ARCHITECTURE teste OF mux_0 IS
BEGIN
  ot <= (i0 AND NOT s1 AND NOT s0) OR
        (i1 AND NOT s1 AND     s0) OR
        (i2 AND     s1 AND NOT s0) OR
        (i3 AND     s1 AND     s0);
END teste;




