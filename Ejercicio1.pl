% HECHOS: relaciones directas

% Todos los padre juntos
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

% Todos los madre juntos
madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

% Genero (necesario para reglas)
hombre(abraham). hombre(homero). hombre(herbert). hombre(clancy). hombre(bart).
mujer(mona). mujer(marge). mujer(patty). mujer(selma).
mujer(jacqueline). mujer(lisa). mujer(maggie). mujer(ling).

% REGLAS: relaciones de mas de una generacion

abuelo(X, Y) :- hombre(X), padre(X, Z), padre(Z, Y).
abuelo(X, Y) :- hombre(X), padre(X, Z), madre(Z, Y).
abuela(X, Y) :- mujer(X),  madre(X, Z), padre(Z, Y).
abuela(X, Y) :- mujer(X),  madre(X, Z), madre(Z, Y).

hermano(X, Y) :- hombre(X), padre(P, X), padre(P, Y), X \= Y.
hermana(X, Y) :- mujer(X),  padre(P, X), padre(P, Y), X \= Y.

tio(X, Y) :- hombre(X), padre(P, Y), hermano(X, P).
tio(X, Y) :- hombre(X), madre(P, Y), hermano(X, P).
tia(X, Y) :- mujer(X),  padre(P, Y), hermana(X, P).
tia(X, Y) :- mujer(X),  madre(P, Y), hermana(X, P).

primo(X, Y) :- hombre(X), tio(T, X), padre(T, Y).
primo(X, Y) :- hombre(X), tia(T, X), madre(T, Y).
prima(X, Y) :- mujer(X),  tio(T, X), padre(T, Y).
prima(X, Y) :- mujer(X),  tia(T, X), madre(T, Y).

% Consultas de ejemplo:
% ?- abuelo(X, bart).          -> X = abraham ; X = clancy
% ?- abuela(X, lisa).          -> X = mona ; X = jacqueline
% ?- hermano(X, homero).       -> X = herbert
% ?- tia(X, bart).             -> X = patty ; X = selma
% ?- primo(bart, X).           -> X = ling
