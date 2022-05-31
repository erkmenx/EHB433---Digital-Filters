clc;
clear all;

A= [2 0 1; -2 1 -.5;1 -2 4];
B = [1;2;3];
C = [1 0 -2];
D=1;

% System Continous
sysc = ss(A,B,C,D);

% System Discrete
sysd = c2d(sysc,1,'zoh');

[numd dend] = ss2tf(sysd.a,sysd.b,sysd.c,sysd.d);


Ac = [0 1 0; 0 0 1; -dend(4) -dend(3) -dend(2)];
Bc = [0;0;1];

OC = ctrb(sysd.a,sysd.b);

OCo = ctrb(Ac,Bc);

Pc = OC * inv(OCo);

%P(z) = (z^3)-(0.8*z^2)+(0.3*z)+(0.1)

Fc(3) = .8 + dend(2);
Fc(2)= -.3 + dend(3);
Fc(1)= -.1 + dend(4);


F = Fc * inv(Pc);


