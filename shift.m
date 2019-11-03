% Solving a shifting problem in frequency domain
% 201314651 ���ڰ��к� �̿��� (Lee Won-jai) 2015.04.20
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
y2=cos(2*pi*(10-1)*t)+2*cos(2*pi*(20-1)*t)-1 %���ļ��� -1��ŭ �̵����� ���������� +1�� shift�Ǵ� ������ �ذ�
y3=fft(y2,100)
plot(abs(y3))