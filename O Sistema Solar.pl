% PROJETO DE LÓGICA APLICADA A COMPUTAÇÃO
% GRUPO :
% *Luciano Pereira de Oliveira Filho
% *Lucas Issac Pissaia da Silva
% *Vidal Elias Neto


% Definição inicial, sol é uma estrela
estrela(sol).


% Relações de Orbitas.
orbita(mercurio,sol).
orbita(venus,sol).
orbita(terra,sol).
orbita(marte,sol).
orbita(jupiter,sol).
orbita(saturno,sol).
orbita(urano,sol).
orbita(netuno,sol).
orbita(plutão,sol).
orbita(ceres,sol).
orbita(haumea, sol).
orbita(makemake, sol).
orbita(eris, sol).
orbita(lua,terra).
orbita(fobos,marte).
orbita(deimos,marte).
orbita(io,jupiter).
orbita(europa,jupiter).
orbita(ganymedes,jupiter).
orbita(calisto,jupiter).
orbita(titã,saturno).
orbita(reia,saturno).
orbita(japeto,saturno).
orbita(dione,saturno).
orbita(tetis,saturno).
orbita(titãnia,urano).
orbita(oberon,urano).
orbita(umbriel,urano).
orbita(ariel,urano).
orbita(tritão,netuno).
orbita(proteu,netuno).
orbita(nereida,netuno).
orbita(larissa,neturno).
orbita(caronte,plutão).
orbita(nix,plutão).
orbita(hidra,plutão).
orbita(estige,plutão).
orbita(disnomia,eris).
orbita(hiaka,haumea).



% Relações de dados de cada corpo celeste.
% Função | Corpo | Raio em KM | Massa em KG

dados(sol,696342, 1.989*1E30).
dados(mercurio,2439, 3.285*1E23).
dados(venus,6051, 4.867*1E24).
dados(terra,6371, 5.972*1E24).
dados(marte,3389, 6.39*1E23).
dados(jupiter,69911, 1.898*1E27).
dados(saturno,58232, 5.683*1E26).
dados(urano,25362, 8.681*1E25).
dados(netuno,24622, 1.024*1E26).
dados(ganymedes,2634, 1.4819 * 1E23 ).
dados(titan,2574, 1.3452 * 1E23).
dados(calisto,2410, 1.075938 * 1E23).
dados(io,1821,9.9319 * 1E22).
dados(lua,1737, 7.349 * 1E22).
dados(europa,1560, 4.80 * 1E22).
dados(tritão,1353, 2.14 * 1E22).
dados(plutão,1188, 1.305 * 1E22).
dados(eris,1163, 1.66 * 1E22).
dados(titania,788, 3.527 * 1E21).
dados(haumea,780, 4.2 * 1E21).
dados(reia,763, 1.66 * 1E21).
dados(oberon,761, 3.014 * 1E21).
dados(japeto,734, 1.805 * 1E21).
dados(makemake,715, 3.1 * 1E21).
dados(caronte,606, 1.586 * 1E21).
dados(umbriel,584, 1.275 * 1E21).
dados(ariel,578, 1.251 * 1E21).
dados(dione,561, 1.095 * 1E21).
dados(gonggong,615, 1.75 * 1E21).
dados(quaoar,560, 1.40 * 1E21).
dados(sedna,4983, 2 * 1E21).
dados(ceres,469, 8.958 * 1E20).
dados(disnomia,350, 4 * 1E20).
dados(proteu, 210, 4.4 * 1E19).
dados(nereida, 178, 3.1 * 1E19).
dados(larissa, 97, 4.2 * 1E18).
dados(fobos,11, 1.08 * 1E16).
dados(deimos,6, 1.4 * 1E15).


% fonte: https://en.wikipedia.org/wiki/List_of_Solar_System_objects_by_size



% Mostra a massa em kilogramas
massa(CORPO,MASSA) :- dados(CORPO,_,MASSA).

% Mossa a massa em massas terrestres
massasterrestres(CORPO,MT) :- massa(CORPO, MASSA), MT is MASSA/(5.972*1E24).

% Mostra o raio em kilômetros
raio(CORPO,RAIO) :- dados(CORPO,RAIO,_).

% Definição de um planeta
planeta(P) :- orbita(P,S), estrela(S), raio(P, RAIO), RAIO > 1500.

% Definição de uma lua
lua(L) :- orbita(L,P), (planeta(P); planeta_anao(P)).

% Definição de um planeta anão
planeta_anao(PA) :- orbita(PA,S), estrela(S), raio(PA, RAIO), RAIO < 1500.

% Definindo os planetas gasosos
planetagasoso(PGAS) :- planeta(PGAS), raio(PGAS, RAIO), RAIO > 10000.

% Definindo um planeta terreste
planetaterreste(PTER) :- planeta(PTER), (not(planetagasoso(PTER))).

% Se um é maior que o outro
maiorque(X,Y) :- raio(X,A), raio(Y,B), A>B.

% Se um é mais pesado que o outro
pesadoque(X,Y) :- massa(X,A), massa(Y,B), A>B.

% Diferença dos raios entre os corpos celestes
diferenca_raio(P1,P2,DIF) :- raio(P1,A), raio(P2,B),  DIF is abs(A-B).

% A proporção dos raios entre os corpos celestes
proporcao_raio(P1,P2,PRO) :- raio(P1,A), raio(P2,B),  PRO is A/B.

% Área da superficie de um corpo celeste em km²
area(CORPO,AREA) :- raio(CORPO,RAIO), AREA is RAIO^2*4*pi.

% Volume do corpo celeste em milhoes de kilometros cubicos
volume(P,VOL) :- raio(P,RAIO), VOL is ((4*pi*RAIO^3)/3000000000).

% Densidade de um corpo celeste em g/cm³
densidade(CORPO,DEN) :-  volume(CORPO,VOL), massa(CORPO,MASSA), DEN is (MASSA*1000)/(VOL*1E24).

% Gravidade de superficie de um corpo celeste em m/s²
gravidade(CORPO,GRA) :- raio(CORPO,RAIO), massa(CORPO,MASSA), GRA is (6.674184*1E-11*MASSA)/((RAIO*1000)^2).
