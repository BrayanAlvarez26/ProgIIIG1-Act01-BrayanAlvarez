% HECHOS
estadounidense(west).
pais(corea_del_norte).
enemigo(corea_del_norte, estados_unidos).
misil(m1).
tiene(corea_del_norte, m1).
vendio(west, m1, corea_del_norte).

% REGLAS
hostil(X) :- pais(X), enemigo(X, estados_unidos).

arma(X) :- misil(X).

criminal(X) :-
    estadounidense(X),
    vendio(X, Y, Z),
    arma(Y),
    hostil(Z).

% Consultas de ejemplo:
% ?- criminal(west).           -> true
% ?- criminal(X).              -> X = west
% ?- hostil(X).                -> X = corea_del_norte
% ?- arma(X).                  -> X = m1
