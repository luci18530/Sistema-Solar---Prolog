
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



% Rela��es de raios.

raiokm(sol,696342).
raiokm(mercurio,2439).
raiokm(venus,6051).
raiokm(terra,6371).
raiokm(marte,3389).
raiokm(jupiter,69911).
raiokm(saturno,58232).
raiokm(urano,25362).
raiokm(netuno,24622).
raiokm(ganymedes,2634).
raiokm(titan,2574).
raiokm(calisto,2410).
raiokm(io,1821).
raiokm(lua,1737).
raiokm(europa,1560).
raiokm(trit�o,1353).
raiokm(plut�o,1188).
raiokm(eris,1163).
raiokm(titania,788).
raiokm(haumea,780).
raiokm(reia,763).
raiokm(oberon,761).
raiokm(japeto,734).
raiokm(makemake,715).
raiokm(caronte,606).
raiokm(umbriel,584).
raiokm(ariel,578).
raiokm(dione,561).
raiokm(gonggong,615).
raiokm(quaoar,560).
raiokm(sedna,498).
raiokm(ceres,469).
raiokm(disnomia,350).
raiokm(proteu, 210).
raiokm(nereida, 178).
raiokm(larissa, 97).
raiokm(fobos,11).
raiokm(deimos,6).


% fonte: https://en.wikipedia.org/wiki/List_of_Solar_System_objects_by_size


% Defini��o de um planeta
planeta(P) :- orbita(P,S), estrela(S), raiokm(P, RAIO), RAIO > 1500.

% Defini��o de uma lua
lua(L) :- orbita(L,P), (planeta(P); planeta_anao(P)).

% Defini��o de um planeta an�o
planeta_anao(PA) :- orbita(PA,S), estrela(S), raiokm(PA, RAIO), RAIO < 1500.

% Definindo os planetas gasosos
planetagasoso(PGAS) :- planeta(PGAS), raiokm(PGAS, RAIO), RAIO > 10000.

% Definindo um planeta terreste
planetaterreste(PTER) :- planeta(PTER), (not(planetagasoso(PTER))).

% Se um � maior que o outro
maiorque(X,Y) :- raiokm(X,A), raiokm(Y,B), A>B.

% Diferen�a dos raios entre os corpos celestes
diferenca_raiokm(P1,P2,DIF) :- raiokm(P1,A), raiokm(P2,B),  DIF is abs(A-B).

% A propor��o dos raios entre os corpos celestes
proporcao_raiokm(P1,P2,PRO) :- raiokm(P1,A), raiokm(P2,B),  PRO is A/B.

% Volume do corpo celeste
volumebikmcub(P,VOL) :- raiokm(P,RAIO), VOL is ((4*3.1415*RAIO^3)/3000000000).
