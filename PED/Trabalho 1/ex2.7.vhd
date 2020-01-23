ENTITY  EX27 IS --Inicialização da entidade do exercício 2.7
	PORT( k, p, s : IN BIT; --inicialização das entradas do circuito 's = sensor do cinto(1 = engatado)', 'k = sensor da chave(1 = chave colocada)' e 'p = sensor de presença do assento(1 = pessoa sentada)'. 
		  w       : OUT BIT);-- inicialização da saída do circuito w = luz de alerta(1 = acesa). 
END EX27;

ARCHITECTURE AEX27 OF	EX27 IS --Inicialização da arquitetura
BEGIN 
	w <= k AND p AND (NOT s); --Descrição do circuito lógico.Quando a 'chave estiver colocada' E 'a pessoa estiver sentada' E 'o cinto NAO estiver engatado' a luz acenderá.
END AEX27;	