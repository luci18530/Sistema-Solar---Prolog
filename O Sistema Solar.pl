% PROJETO DE L�GICA APLICADA A COMPUTA��O
% GRUPO :
% *Luciano Pereira de Oliveira Filho
% *Lucas Issac Pissaia da Silva
% *Vidal Elias Neto


% Defini��o inicial, sol � uma estrela
estrela(sol).


% Rela��es de Orbitas.
orbita(mercurio,sol).
orbita(venus,sol).
orbita(terra,sol).
orbita(marte,sol).
orbita(jupiter,sol).
orbita(saturno,sol).
orbita(urano,sol).
orbita(netuno,sol).
orbita(plut�o,sol).
orbita(ceres,sol).
orbita(haumea, sol).
orbita(makemake, sol).
orbita(eris, sol).
orbita(sedna,sol).
orbita(gonggong,sol).
orbita(quaoar,sol).
orbita(lua,terra).
orbita(fobos,marte).
orbita(deimos,marte).
orbita(io,jupiter).
orbita(europa,jupiter).
orbita(ganymedes,jupiter).
orbita(calisto,jupiter).
orbita(tit�,saturno).
orbita(reia,saturno).
orbita(japeto,saturno).
orbita(dione,saturno).
orbita(tetis,saturno).
orbita(tit�nia,urano).
orbita(oberon,urano).
orbita(umbriel,urano).
orbita(ariel,urano).
orbita(trit�o,netuno).
orbita(proteu,netuno).
orbita(nereida,netuno).
orbita(larissa,neturno).
orbita(caronte,plut�o).
orbita(nix,plut�o).
orbita(hidra,plut�o).
orbita(estige,plut�o).
orbita(disnomia,eris).
orbita(hiaka,haumea).



% Rela��es de dados de cada corpo celeste.
% Dados | Corpo | Raio(KM) | Massa(KG) | Dist�ncia ao corpo orbitado

dados(sol,696342, 1.989*1E30, 0).
dados(mercurio,2439, 3.285*1E23, 57909050).
dados(venus,6051, 4.867*1E24, 108208000 ).
dados(terra,6371, 5.972*1E24,  149612000).
dados(marte,3389, 6.39*1E23, 227939200).
dados(jupiter,69911, 1.898*1E27, 778570000).
dados(saturno,58232, 5.683*1E26, 1433530000).
dados(urano,25362, 8.681*1E25, 2875040000).
dados(netuno,24622, 1.024*1E26, 4503400000).
dados(ganymedes,2634, 1.4819 * 1E23, 1070400 ).
dados(titan,2574, 1.3452 * 1E23, 1221870).
dados(calisto,2410, 1.075938 * 1E23, 1882700).
dados(io,1821,9.9319 * 1E22, 421700).
dados(lua,1737, 7.349 * 1E22, 384403).
dados(europa,1560, 4.80 * 1E22, 670900).
dados(trit�o,1353, 2.14 * 1E22, 354759).
dados(plut�o,1188, 1.305 * 1E22, 5906380000).
dados(eris,1163, 1.66 * 1E22, 10152000000).
dados(titania,788, 3.527 * 1E21, 435910).
dados(haumea,780, 4.2 * 1E21, 6459943988).
dados(reia,763, 1.66 * 1E21, 527108).
dados(oberon,761, 3.014 * 1E21, 583520 ).
dados(japeto,734, 1.805 * 1E21, 3560820).
dados(makemake,715, 3.1 * 1E21, 6796240456).
dados(caronte,606, 1.586 * 1E21, 19591).
dados(umbriel,584, 1.275 * 1E21, 266000 ).
dados(ariel,578, 1.251 * 1E21, 191020).
dados(dione,561, 1.095 * 1E21, 377396).
dados(gonggong,615, 1.75 * 1E21,1.009353158* 1E10).
dados(quaoar,560, 1.40 * 1E21, 6536538202).
dados(sedna,498, 2 * 1E21, 72470991290).
dados(ceres,469, 8.958 * 1E20, 414261000 ).
dados(disnomia,350, 4 * 1E20, 37350).
dados(proteu, 210, 4.4 * 1E19, 117647).
dados(nereida, 178, 3.1 * 1E19, 5513940).
dados(larissa, 97, 4.2 * 1E18, 73548).
dados(fobos,11, 1.08 * 1E16, 9376).
dados(deimos,6, 1.4 * 1E15, 23463).


% fonte: https://en.wikipedia.org/wiki/List_of_Solar_System_objects_by_size



% Mostra a massa em kilogramas
massa(CORPO,MASSA) :- dados(CORPO,_,MASSA,_).

% Mossa a massa em massas terrestres
massasterrestres(CORPO,MT) :- massa(CORPO, MASSA), MT is MASSA/(5.972*1E24).

% Mostra o raio em kil�metros
raio(CORPO,RAIO) :- dados(CORPO,RAIO,_,_).

% Mostra a distancia (semieixo maior) do corpo ao corpo que ele orbita
distancia(CORPO,DIST) :- dados(CORPO,_,_,DIST).



% DEFINI��ES DOS CORPOS


% Defini��o de um planeta
planeta(P) :- orbita(P,S), estrela(S), raio(P, RAIO), RAIO > 1500.

% Defini��o de um planeta an�o
planeta_anao(PA) :- orbita(PA,S), estrela(S), raio(PA, RAIO), RAIO < 1500.

% Defini��o de uma lua
lua(L) :- orbita(L,P), (planeta(P); planeta_anao(P)).

% Definindo os planetas gasosos
planetagasoso(PGAS) :- planeta(PGAS), raio(PGAS, RAIO), RAIO > 10000.

% Definindo um planeta terreste
planetaterreste(PTER) :- planeta(PTER), (not(planetagasoso(PTER))).



% COMPARA��ES


% Quais corpos s�o maiores que um valor em km
maioresque(CORPOS,NUM) :- raio(CORPOS,X), X > NUM.

% Quais Corpos s�o menores que um valor em km
menoresque(CORPOS,NUM) :- raio(CORPOS,X), X < NUM.

% Se um � maior que o outro | Quais corpos s�o maiores (X,corpo) ou
% menores (corpo,X) que tal corpo ?
maiorque(X,Y) :- raio(X,A), raio(Y,B), A>B.

% Se um � mais pesado que o outro | Quais corpos s�o maiores (X,corpo) ou
% menores (corpo,X) que tal corpo ?
pesadoque(X,Y) :- massa(X,A), massa(Y,B), A>B.

% Se um � mais denso que o outro | Quais corpos s�o mais densos
% (X,corpo) ou menos densos (corpo,X) que tal corpo ?
densoque(X,Y) :- densidade(X,A), densidade(Y,B), A>B.

% Se um � mais distante que o outro, em rela��o a um mesmo corpo
% orbitado | Quais corpos s�o mais distantes (X,corpo) ou
% menos distantes (corpo,X) em rela��o ao corpo orbitado ?
distanteque(X,Y) :- distancia(X,A), distancia(Y,B), orbita(X,Z),orbita(Y,Z), A>B.

% Diferen�a dos raios entre os corpos celestes
diferenca_raio(P1,P2,DIF) :- raio(P1,A), raio(P2,B),  DIF is abs(A-B).

% A propor��o dos raios entre os corpos celestes
proporcao_raio(P1,P2,PRO) :- raio(P1,A), raio(P2,B),  PRO is A/B.

% Propor��o das massas entre os corpos celestes
proporcao_massa(C1,C2,PRO) :- massa(C1,M1), massa(C2,M2), PRO is M1/M2.

% A propro��o da area entre os objetos
proporcao_area(C1,C2,PRO) :- area(C1,A1), area(C2,A2), PRO is A1/A2.

% A propor��o do volume entre os objetos
proporcao_volume(C1,C2,PRO) :- volume(C1,V1), volume(C2,V2), PRO is V1/V2.


% DADOS ADICIONAIS


% �rea da superficie de um corpo celeste em km�
area(CORPO,AREA) :- raio(CORPO,RAIO), AREA is RAIO^2*4*pi.

% Volume do corpo celeste em bilh�es de kilometros cubicos
volume(P,VOL) :- raio(P,RAIO), VOL is ((4*pi*RAIO^3)/3000000000).

% Densidade de um corpo celeste em g/cm�
densidade(CORPO,DEN) :-  volume(CORPO,VOL), massa(CORPO,MASSA), DEN is (MASSA*1000)/(VOL*1E24).

% Gravidade de superficie de um corpo celeste em m/s�
gravidade(CORPO,GRA) :- raio(CORPO,RAIO), massa(CORPO,MASSA), GRA is (6.674184*1E-11*MASSA)/((RAIO*1000)^2).

% Velocidade de escape de um corpo celeste em km/s
veloescape(CORPO,VEL) :- raio(CORPO,RAIO), gravidade(CORPO,GRA) ,VEL is sqrt(2*GRA*RAIO*1000)/1000.

% Periodo Orbital em anos (366 dias)
periorb(CORPO,PO) :- distancia(CORPO,DIST),orbita(CORPO,CORPOMAIOR), massa(CORPOMAIOR,MASSAMAIOR), PO is (2*pi*(sqrt(DIST^3/(6.674184*1E-11*MASSAMAIOR))))/1000.

% Periodo orbital em dias
periorbdia(CORPO,POD) :- periorb(CORPO,PO), POD is PO*366.

ajuda() :- write("

FUN��ES DESTE CODIGO

dados(C,R,M) = Apresenta o raio R e a massa M de um corpo C.

massa(X,Y) = O corpo X tem massa Y em Kilogramas.
raio(X,Y) = O corpo X tem raio Y em Kil�metros.
massasterrestres(X,Y) = O corpo X tem Y Massas Terrestres.

planeta(P) = Especifica se P � planeta, P deve orbitar uma estrela e ter raio >1500 km.

planeta_anao(PA) = Especifica se PA � planeta anao, PA deve orbitar uma estrela e ter raio <1500km.

lua(L) = Especifica se L � uma lua, deve orbitar um planeta ou um planeta an�o.

planetagasoso(PGAS) = Especifica se PGAS � planeta gasoso, deve ser planeta e ter raio >10000 km.

planetaterrestre(PTER) = Especifica se PTER � planeta terrestre, n�o � planeta gasoso.

maioresque(C,NUM) = Dado um valor NUM, C retorna todos os corpos com raio maior que NUM.

menoresque(C,NUM) = Dado um valor NUM, C retorna todos os corpos com raio menor que NUM.

maiorque(X,Y) = � verdade que o X � maior que Y ? | Quais corpos s�o maiores (X,corpo) ou menores (corpo,X) que tal corpo ?

pesadoue(X,Y) = � verdade que o X � mais pesado que Y ? | Quais corpos s�o maiores (X,corpo) ou menores (corpo,X) que tal corpo ?

densoque(X,Y) = � verdade que o X � mais denso que Y ? | Quais corpos s�o mais densos (X,corpo) ou menos densos (corpo,X) que tal corpo ?

distanteque(X,Y) = � verdade que o X � mais distante que Y em rela��o ao mesmo corpo orbitado ? | Quais corpos s�o mais distantes (X,corpo) ou menos distantes (corpo,X) em rela��o ao corpo orbitado ?

diferenca_raio (C1,C2,DIF) = Diferen�a DIF (em m�dulo) do raio de C1 para C2.

proporcao_raio (C1,C2,PRO) = Propor��o PRO do raio de C1 para C2 | Quantas vezes o primeiro corpo � maior que o segundo ?

proporcao_massa (C1,C2,PRO) = Propor��o PRO da massa de C1 para C2 | Quantas vezes o primeiro corpo � mais pesado que o segundo ?

proporcao_area (C1,C2,PRO) = Propor��o PRO da area de C1 para C2 | Quantas vezes o primeiro corpo � tem mais area que o segundo ?

proporcao_volume (C1,C2,PRO) = Propor��o PRO do volume de C1 para C2 | Quantas vezes o primeiro corpo � mais volumoso que o segundo ?

area(C,AR) =  A area AR de um corpo C, em KM�.

volume(C, VOL) = O volume VOL de um corpo C, em bilh�es de KM�

densidade(C, DEN) = A densidade DEN de um corpo C, relacioando com a massa sobre o volume de C, em g/cm�.

gravidade(C, GRA) = A gravidade GRA de um corpo C, em m/s�.

veloescape(C,VEL) = Velocidade de escape de um corpo C, em km/s.

periorb(CORPO,PO) = Periodo orbital em anos, envolvendo a distancia do corpo ao corpo orbitado e a massa deste, aplicando a terceira lei de kepler.

periorbdia(CORPO,POD) = O mesmo de acima por�m o resultado em dias terrestres (366)

").

