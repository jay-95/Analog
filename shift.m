% Solving a shifting problem in frequency domain
% 201314651 전자공학부 이원재 (Lee Won-jai) 2015.04.20
% t is time
% y is Nomal Message Signal
% y1 is Nomal Message Signal in frequency domain (has shift problem)
% y2 is Modified Message Signal
% y3 is Modified Message Signal in frequency domain

t = -3 : 0.01 : 3
subplot(211)
y=cos(2*pi*10*t)+2*cos(2*pi*20*t)-1
y1=fft(y,10000)
plot(y1)
grid on

subplot(212)
y2=cos(2*pi*(10-1)*t)+2*cos(2*pi*(20-1)*t)-1 %주파수를 -1만큼 이동시켜 오른쪽으로 +1씩 shift되는 현상을 해결
y3=fft(y2,100)
plot(abs(y3))