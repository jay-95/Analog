% Making Double Side Band(DSB) using Conherent Demodulation with LPF
% 201314651 ���ڰ��к� �̿��� (Lee Won-jai) 2015.04.13
% T is time
% L is Sinc Fuction
% Yl is Sinc Function in frequency domain
% M is Message Signal
% Ym is Message Signal in frequency domain
% C is Carrier Signal
% Yc is Carrier Signal in frequency domain
% N is multiplication of Message Signal & Carrier Signal
% Yn is multiplication of Message Signal & Carrier Signal in frequency
% domain
% K is Sampled and Quantized Signal
% Yk is Sampled and Quantized Signal in frequency domain
% S is Filtered Signal
% Ys is Filtered Signal in frequency domain

T=-(1/30)*10+0.000001:(1/30)/10:(1/30)*10 %Sinc Fuction�� ��� 0���� ����� ���� �ʱ� ������, 0������ ����� �����ְ��� -(1/30)*10+0.000001�� ���� �ð����� ����.
                                          %����ϴ� ��ȣ�� �� �ִ� ���ļ��� 30�̹Ƿ� ��������Ʈ
                                          %��Ģ�� ������Ű�鼭 �����ϱ� ���� ������ ����� ����
                                          %Sampling Time = (1/30)/10�� �����Ѵ�.
                                          
L=sin(2*pi*15*T)./(pi*T) %Sinc Fuction���� LPF�� ������ �Ѵ�. ���ļ��� 15 �Ʒ��� ���и� �����Ų��.
figure(1)
subplot(121)
plot(T,L)

Yl=fft(L,300)
subplot(122)
plot(abs(Yl)/300)

M=cos(2*pi*10*T) %���ļ��� 10�� Message Signal�̴�.
figure(2)
subplot(121)
plot(T,M)

Ym=fft(M,300)
subplot(122)
plot(abs(Ym)/300)

C=cos(2*pi*30*T) %���ļ��� 30�� Carrier Signal�̴�.
figure(3)
subplot(121)
plot(T,C)

Yc=fft(C,300)
subplot(122)
plot(abs(Yc)/300)

N=M.*C %Modulation
figure(4)
subplot(121)
plot(T,N)

Yn = fft(N,300) %Modulation�� ���, ���ļ� ������ 20, 40���� ������ �� �ִ�.
subplot(122)
plot(abs(Yn)/300)

K=N.*(2.*C) %Demodulation
figure(5)
subplot(121)
plot(T,K)

Yk = fft(K,300) %Demodulation�� ���, ���ļ� ������ 10, 50, 70���� ������ �� �ִ�.
subplot(122)
plot(abs(Yk)/300)

S=conv(K,L) %LPF�� ���� 15�̻��� ���ļ� ������ �ɷ�����. ��, ���ļ��� 50, 70�� ������ �ɷ�����.
figure(6)
subplot(121)
plot(S/300)

Ys = fft(S,300) %���ļ� ������ 10�� ������ Ȯ���� �� �ִ�.
subplot(122)
plot(abs(Ys)/300)