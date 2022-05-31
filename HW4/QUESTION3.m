% DZ = X/(FUNCTION*(1-X)) VE X = Z^(-1)
clc;
clear all;
syms t
syms s
X = 1/(s*s*(s+2));
Y = ilaplace(X);
a = ztrans(Y);
b = simplify(a);
