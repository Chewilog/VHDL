ENTITY e_xor IS
  PORT (a, b : IN  BIT;  -- entradas, valores 0 ou 1
        c    : OUT BIT); -- saida, valores 0 ou 1
END e_xor;

ARCHITECTURE teste OF e_xor IS
BEGIN
  c <= (a AND (NOT b)) OR ((NOT a) AND b);
END teste;



