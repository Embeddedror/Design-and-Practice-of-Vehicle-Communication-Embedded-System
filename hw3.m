clear all;
clc;

SNR_dB = 0:2:10;

for k = 1:length(SNR_dB)
BER_Th(k) = qfunc(sqrt(2*10.^((SNR_dB(k))/10)));
sim("BPSK.slx");
BER_Sim(k) = ErrorVec(1);
end


semilogy(SNR_dB, BER_Th, 'b-o',SNR_dB, BER_Sim, 'r-x');
hold on;
xlabel('SNR(dB)');
ylabel('BER');
legend('BER Theory','BER Simulink');
title('BPSK with AWGN noise');
axis([0 10 10^(-6) 10&(-1)]);
xticks(SNR_dB);
grid on;