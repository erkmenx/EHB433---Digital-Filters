%
% FIR FILTRE TASARIMI
%
% FIR derecesi a?a??da belirlenir. ?ift olmal? !
Filtre_Tap=124;
Filtre_Tap_Yarim=Filtre_Tap/2;
%
%
% ALCAK GEC?REN F?LTRE 
%
Alcak_Kesim_Frekans=pi/3;
%
for i=1:1:Filtre_Tap+1,
    Filtre_Alcak_Geciren(i)=(sin((i-1-Filtre_Tap_Yarim)*Alcak_Kesim_Frekans))/((i-1-Filtre_Tap_Yarim)*pi);
end
Filtre_Alcak_Geciren(Filtre_Tap_Yarim+1)=Alcak_Kesim_Frekans/pi;
[Filtre_Alcak_Hjw,Filtre_Alcak_w_frekans]=freqz(Filtre_Alcak_Geciren,1,128);
%
% Frekans Cevab?
plot(Filtre_Alcak_w_frekans,abs(Filtre_Alcak_Hjw))
%%%%%%%%%%%%%%%
%      YUKSEK GE??REN
Yuksek_Kesim_Frekansi=pi/7;
%
for i=1:1:Filtre_Tap+1
Filtre_Yuksek_Geciren(i)=(sin((i-1-Filtre_Tap_Yarim)*pi)-sin((i-Filtre_Tap_Yarim)*Yuksek_Kesim_Frekansi))/((i-1-Filtre_Tap_Yarim)*pi);
end
Filtre_Yuksek_Geciren(Filtre_Tap_Yarim+1)=(pi-Yuksek_Kesim_Frekansi)/pi;
[Filtre_Yuksek_Hjw,Filtre_Yuksek_w_frekans]=freqz(Filtre_Yuksek_Geciren,1,128);
%
% Frekans cevab?
plot(Filtre_Yuksek_w_frekans,abs(Filtre_Yuksek_Hjw))
%%%%%%%%%%%%%%
%
%    BAND GE??REN FILTRE
%
BP_1_Kesim_Frekansi=pi/7;
BP_2_Kesim_Frekansi=2*pi/7;


for i=1:1:Filtre_Tap+1
Filtre_BP_Geciren(i)=(sin((i-1-Filtre_Tap_Yarim)*BP_2_Kesim_Frekansi)-sin((i-1-Filtre_Tap_Yarim)*BP_1_Kesim_Frekansi))/((i-1-Filtre_Tap_Yarim)*pi);
end
Filtre_BP_Geciren(Filtre_Tap_Yarim+1)=(BP_2_Kesim_Frekansi-BP_1_Kesim_Frekansi)/pi;
[Filtre_BP_Hjw,Filtre_BP_w_frekans]=freqz(Filtre_BP_Geciren,1,128);
%
% Frekans cevabi
plot(Filtre_BP_w_frekans,abs(Filtre_BP_Hjw))
%
%
% band sonduren
BS_1_Kesim_Frekansi=pi/7;
BS_2_Kesim_Frekansi=2*pi/7;


for i=1:1:Filtre_Tap+1
Filtre_BS_Geciren(i)=(sin((i-1-Filtre_Tap_Yarim)*pi)-sin((i-1-Filtre_Tap_Yarim)*BS_2_Kesim_Frekansi)+sin((i-1-Filtre_Tap_Yarim)*BS_1_Kesim_Frekansi))/((i-1-Filtre_Tap_Yarim)*pi);
end
Filtre_BS_Geciren(Filtre_Tap_Yarim+1)=(pi-BS_2_Kesim_Frekansi+BS_1_Kesim_Frekansi)/pi;
[Filtre_BS_Hjw,Filtre_BS_w_frekans]=freqz(Filtre_BS_Geciren,1,128);
%
% Frekans cevabi
plot(Filtre_BS_w_frekans,abs(Filtre_BS_Hjw))

%PENCERELER
%
%  @hamming        - Hamming window.
%    @hann           - Hann window

pencere=@hamming;
%
% ALCAK GEC?REN F?LTRE  PENCERE 
%
w_pencere  = window(pencere,Filtre_Tap+1);
Filtre_Alcak_Geciren_pencereli=Filtre_Alcak_Geciren.*w_pencere';
[Filtre_Alcak_Hjw_pencereli,Filtre_Alcak_w_frekans_pencereli]=freqz(Filtre_Alcak_Geciren_pencereli,1,128);
%
% pencereli ve penceresiz freksan
 plot(Filtre_Alcak_w_frekans,abs(Filtre_Alcak_Hjw),Filtre_Alcak_w_frekans_pencereli,abs(Filtre_Alcak_Hjw_pencereli))
%
% YUKSEK GE??REN 
%
Filtre_Yuksek_Geciren_pencereli=Filtre_Yuksek_Geciren.*w_pencere';
[Filtre_Yuksek_Hjw_pencereli,Filtre_Yuksek_w_frekans_pencereli]=freqz(Filtre_Yuksek_Geciren_pencereli,1,128);
%
% pencereli ve penceresiz.
 plot(Filtre_Yuksek_w_frekans,abs(Filtre_Yuksek_Hjw),Filtre_Yuksek_w_frekans_pencereli,abs(Filtre_Yuksek_Hjw_pencereli))
%%%%%%%%%%%%%%
%
%    BAND  GEC?REN F?LTRE
%
Filtre_BP_Geciren_pencereli=Filtre_BP_Geciren.*w_pencere';
%[Filtre_BP_Hjw_pencereli,Filtre_BP_w_frekans_pencereli]=freqz(Filtre_BP_Geciren_pencereli,1,128);
%
% pencereli ve penceresiz.
 %plot(Filtre_BP_w_frekans,abs(Filtre_BP_Hjw),Filtre_BP_w_frekans_pencereli,abs(Filtre_BP_Hjw_pencereli))
%%%%%%%%%%%%%%

%%%%%%%%%%%%%%
%
%    BAND SONDUREN  F?LTRE
%
Filtre_BS_Geciren_pencereli=Filtre_BS_Geciren.*w_pencere';
%[Filtre_BS_Hjw_pencereli,Filtre_BS_w_frekans_pencereli]=freqz(Filtre_BS_Geciren_pencereli,1,128);
%
% pencereli ve penceresiz.
% plot(Filtre_BS_w_frekans,abs(Filtre_BS_Hjw),Filtre_BS_w_frekans_pencereli,abs(Filtre_BS_Hjw_pencereli))
%%%%%%%%%%%%%%


 