ENTITY mux_00 IS
  PORT (i0, i1, i2, i3    :  IN  BIT;  -- entradas 
        s0, s1            :  IN  BIT;  -- selecao
        ot                :  OUT BIT); -- saida
END mux_00;

ARCHITECTURE teste OF mux_00 IS
  SIGNAL int0, int1, int2, int3 : BIT; -- sinais internos
BEGIN
  ot <= int0 OR int1 OR int2 OR int3;
  int0 <= i0 AND NOT s1 AND NOT s0;
  int1 <= i1 AND NOT s1 AND     s0;
  int2 <= i2 AND     s1 AND NOT s0;
  int3 <= i3 AND     s1 AND     s0;
END teste;




