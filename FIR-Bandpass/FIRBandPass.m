%Muhammed Erkmen
% Istanbul Technical University
% 040170049
% FIR Bandpass Filter Design 

clc;
%Passband : 900-1000 Hz
%Stop Frequencies : 800,1100 Hz
%Sampling frequency is 4kHz:
fs = 4000;
%Passband
fpass1 = 900;
fpass2 = 1000;
%Stopband
fstop1 = 800;
fstop2 = 1100;
%Düşüş parametreleri(dB):
Rp = 3;
Rs = 40;
%Frequency Mapping
wstop1 = 2*pi*fstop1/fs;
wstop2=  2*pi*fstop2/fs;
wpass1 = 2*pi*fpass1/fs;
wpass2=  2*pi*fpass2/fs;
%∆w calculation
deltaw1 = (wstop1-wpass1);
deltaw2 = (wstop2-wpass2);
% Sigma Calculation
sp = (10^(Rp/20)-1)/(1+10^(Rp/20)); %δp = 0.0144
ss = (1+sp)/(10^(Rs/20));           %δs = 0.0117
% δmin = 0.0117
smin = 0.0117;

% A = -20*log10(SigmaMin);
A = -20*log10(smin);

% Choosed hann window for implementation
% Finding L from hann window formula
L = (8*pi/deltaw2); 
N=L-1;

% For Bandpass, the hn[n] function is given that:
%hn[n] = sin(((wpass1+wstop1)/2)*(i-N/2))/(pi*(i-N/2)) - sin(((wpass2+wstop2)/2)*(i-N/2))/(pi*(i-N/2));
%hn: ideal bp filter
hn = ones(160,1);
for i=1:160
    hn(i)=sin(((wpass1+wstop1)/2)*(i-N/2))/(pi*(i-N/2)) - sin(((wpass2+wstop2)/2)*(i-N/2))/(pi*(i-N/2));
end

%wn: hann window coefficients
wn = ones(160,1);
for i=1:160
    wn(i)=(0.5*(1-cos(2*pi*i/N)));
end

%h: Designed Filter
h = hn.*wn;


% HDL Coder Easy Coding Part for copy pasting.

% Y calculating 
%for i=1:160
   %fprintf('m%d = ud%d * h%d;\n', [i,i,i]);
%end

%Shifting 
%for i=1:160
    %fprintf('ud%d = ud%d;\n', [161-i,160-i]);
%end


% Ploting 
%freqz(hn);
%freqz(wn);
%freqz(h);


