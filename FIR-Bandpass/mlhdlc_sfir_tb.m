clear mlhdlc_sfir;
T = 2;
dt = 0.001;
N = T/dt+1;
sample_time = 0:dt:T;

df = 1/dt;
sample_freq = linspace(-1/2,1/2,N).*df;

% input signal with noise
x_in = cos(2.*pi.*(sample_time).*(1+(sample_time).*75)).';

% filter coefficients
h1=-4.575107e-07; h2=-4.079471e-06; h3=7.456164e-06; h4=3.099938e-05; h5=-2.187885e-05; h6=-9.942866e-05; h7=3.008318e-05; h8=2.130346e-04; h9=-1.105876e-05; h10=-3.516139e-04; h11=-4.938998e-05; h12=4.714982e-04; h13=1.429943e-04; h14=-5.171683e-04; h15=-2.289078e-04; h16=4.417575e-04; h17=2.352812e-04; h18=-2.300895e-04; h19=-7.533975e-05; h20=-8.444796e-05; h21=-3.242131e-04; h22=4.174590e-04; h23=9.897741e-04; h24=-6.503096e-04; h25=-1.873234e-03; h26=6.650779e-04; h27=2.841484e-03; h28=-3.900612e-04; h29=-3.691080e-03; h30=-1.570930e-04; h31=4.189581e-03; h32=8.436837e-04; h33=-4.136803e-03; h34=-1.426450e-03; h35=3.431551e-03; h36=1.592348e-03; h37=-2.124659e-03; h38=-1.031923e-03; h39=4.394011e-04; h40=-4.688701e-04; h41=1.253898e-03; h42=2.940704e-03; h43=-2.511617e-03; h44=-6.172347e-03; h45=2.928459e-03; h46=9.703728e-03; h47=-2.264160e-03; h48=-1.288288e-02; h49=5.544726e-04; h50=1.498424e-02; h51=1.825445e-03; h52=-1.536957e-02; h53=-4.169998e-03; h54=1.365910e-02; h55=5.534863e-03; h56=-9.873180e-03; h57=-4.902948e-03; h58=4.506315e-03; h59=1.397082e-03; h60=1.493137e-03; h61=5.502639e-03; h62=-6.845861e-03; h63=-1.578498e-02; h64=1.015237e-02; h65=2.882061e-02; h66=-1.015578e-02; h67=-4.339042e-02; h68=6.005811e-03; h69=5.783448e-02; h70=2.531463e-03; h71=-7.030142e-02; h72=-1.496573e-02; h73=7.905511e-02; h74=3.010558e-02; h75=-8.278058e-02; h76=-4.621585e-02; h77=8.082879e-02; h78=6.128429e-02; h79=-7.334962e-02; h80=-7.334962e-02; h81=6.128429e-02; h82=8.082879e-02; h83=-4.621585e-02; h84=-8.278058e-02; h85=3.010558e-02; h86=7.905511e-02; h87=-1.496573e-02; h88=-7.030142e-02; h89=2.531463e-03; h90=5.783448e-02; h91=6.005811e-03; h92=-4.339042e-02; h93=-1.015578e-02; h94=2.882061e-02; h95=1.015237e-02; h96=-1.578498e-02; h97=-6.845861e-03; h98=5.502639e-03; h99=1.493137e-03; h100=1.397082e-03; h101=4.506315e-03; h102=-4.902948e-03; h103=-9.873180e-03; h104=5.534863e-03; h105=1.365910e-02; h106=-4.169998e-03; h107=-1.536957e-02; h108=1.825445e-03; h109=1.498424e-02; h110=5.544726e-04; h111=-1.288288e-02; h112=-2.264160e-03; h113=9.703728e-03; h114=2.928459e-03; h115=-6.172347e-03; h116=-2.511617e-03; h117=2.940704e-03; h118=1.253898e-03; h119=-4.688701e-04; h120=4.394011e-04; h121=-1.031923e-03; h122=-2.124659e-03; h123=1.592348e-03; h124=3.431551e-03; h125=-1.426450e-03; h126=-4.136803e-03; h127=8.436837e-04; h128=4.189581e-03; h129=-1.570930e-04; h130=-3.691080e-03; h131=-3.900612e-04; h132=2.841484e-03; h133=6.650779e-04; h134=-1.873234e-03; h135=-6.503096e-04; h136=9.897741e-04; h137=4.174590e-04; h138=-3.242131e-04; h139=-8.444796e-05; h140=-7.533975e-05; h141=-2.300895e-04; h142=2.352812e-04; h143=4.417575e-04; h144=-2.289078e-04; h145=-5.171683e-04; h146=1.429943e-04; h147=4.714982e-04; h148=-4.938998e-05; h149=-3.516139e-04; h150=-1.105876e-05; h151=2.130346e-04; h152=3.008318e-05; h153=-9.942866e-05; h154=-2.187885e-05; h155=3.099938e-05; h156=7.456164e-06; h157=-4.079471e-06; h158=-4.575107e-07; h159=0; h160=-1.778539e-07;

len = length(x_in);
y_out = zeros(1,len);
x_out = zeros(1,len);

for ii=1:len
    data = x_in(ii);
    % call to the design 'mlhdlc_sfir' that is targeted for hardware
    [y_out(ii), x_out(ii)] = mlhdlc_sfir(data,h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31, h32, h33, h34, h35, h36, h37, h38, h39, h40, h41, h42, h43, h44, h45, h46, h47, h48, h49, h50, h51, h52, h53, h54, h55, h56, h57, h58, h59, h60, h61, h62, h63, h64, h65, h66, h67, h68, h69, h70, h71, h72, h73, h74, h75, h76, h77, h78, h79, h80, h81, h82, h83, h84, h85, h86, h87, h88, h89, h90, h91, h92, h93, h94, h95, h96, h97, h98, h99, h100, h101, h102, h103, h104, h105, h106, h107, h108, h109, h110, h111, h112, h113, h114, h115, h116, h117, h118, h119, h120, h121, h122, h123, h124, h125, h126, h127, h128, h129, h130, h131, h132, h133, h134, h135, h136, h137, h138, h139, h140, h141, h142, h143, h144, h145, h146, h147, h148, h149, h150, h151, h152, h153, h154, h155, h156, h157, h158, h159, h160 );
end

figure('Name', [mfilename, '_plot']);
subplot(3,1,1);
plot(1:len,x_in,'-b');
xlabel('Time (ms)')

ylabel('Amplitude')
title('Input Signal (with noise)')
subplot(3,1,2); plot(1:len,y_out,'-b');
xlabel('Time (ms)')
ylabel('Amplitude')
title('Output Signal (filtered)')

freq_fft = @(x) abs(fftshift(fft(x)));

subplot(3,1,3); semilogy(sample_freq,freq_fft(x_in),'-b');
hold on
semilogy(sample_freq,freq_fft(y_out),'-r')
hold off
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
title('Input and Output Signals (Frequency domain)')
legend({'FilterIn', 'FilterOut'}, 'Location','South')
axis([-500 500 1 100])
