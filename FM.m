% Making Frequacy Modulation and Demodulation using integral, differential
% envelope dectector and Low Pass Filter
% 201314651 전자공학부 이원재 (Lee Won-jai) 2015.06.05
% T is time
% M is Message Signal
% C is Integrated Signal
% Ms is frequency of Message Signal
% Cs is frequency of Carrier Signal
% L is Sinc Fuction
% F is frequency Modulated Signal
% G is just a signal for using differential
% D is Differentiated Signal
% O is filtered signal by Diode
% S is filtered singal by LPF

T=-0.4+0.000001:0.0001:0.4+0.000001; %sinc function cannot be calculated on zero point
Ms=10; % frequency of Message Signal
Cs=100; % frequency of Carrier Signal
M=cos(2*pi*Ms*T); % Message Signal
x1=0;
L=sin(2*pi*35*T)./(pi*T); % Transfer Fuction of LPF (Sinc Function)

%% Comparing Message Signal and Integrated Signal

figure (1);

plot(T,M); % Drawing Message Signal
hold on;

for i = 1 : length(T) % intengral
    x1 = x1+M(i)*0.0001;
    sum(i) = x1;
end

C=sum*2*pi*Ms; % Making amplitude of Integrated Signal as 1
plot(T,C,'r'); % Drawing Integrated Signal in red

%% Comparing Frequency Modulated Singal and Message Signal

F=cos((2*pi*Cs*T)+(5*C)); % Frequency Modulated Signal
figure(2);
plot(T,M); % Drawing Message Signal
hold on;
plot(T,F,'r'); % Drawing Frequency Modulated Signal in red

%% Comparing Differentiated Singal and Frequency Modulated Singal

G=cos((2*pi*Cs*(T-0.0001))+(5*sin(2*pi*Ms*(T-0.0001)))); % a signal for using differential
D=100*(F-G); % Differential
figure(3);
plot(T,F); % Drawing Frequency Modulated Signal
hold on;
plot(T,D,'r'); % Drawing Differentiated Signal in red

%% Envelope Detector

O=(abs(D)+(D))/2; % Filtering using Diode
figure(4);
plot(T,D); % Drawing Differentiated Signal
hold on;
plot(T,O,'r'); % Drawing a signal filtered by diode in red
hold on;
plot(T,M,'g'); % Comparing two above signals with Message Signal

%% Filtering with LPF (Low Pass Filter)

figure(5);
S=conv(O,L);
plot(0.0001*S);
