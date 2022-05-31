clc;
clear all;

A= [2 0 1; -2 1 -.5;1 -2 4];
B = [1;2;3];
C = [1 0 -2];
D=1;

sysc = ss(A,B,C,D);
sysd = c2d(sysc,1,'zoh');

[numd dend] = ss2tf(sysd.a,sysd.b,sysd.c,sysd.d);

OB=obsv(sysd.a,sysd.c);
Ao=[0 0 -dend(4); 1 0 -dend(3);0 1 -dend(2)];
Co=[0 0 1];
OBo=obsv(Ao,Co);
Po=inv(OB)*OBo;
%P(z)= z^3- 0.07*z - 0.006
Kg(3,1)= 0-dend(2);
Kg(2,1)= .07-dend(3);
Kg(1,1)= .006-dend(4);
K=Po*Kg;
G=sysd.a-K*sysd.c;
H=sysd.b;