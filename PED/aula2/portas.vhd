ENTITY portas IS
  PORT (a, b, c : IN  BIT;  
        x, y    : OUT BIT); 
END portas;

ARCHITECTURE teste OF portas IS
BEGIN
  x <= a AND b;
  y <= c OR  b;
END teste;



