% Making Double Side Band(DSB) using Non-Conherent Demodulation with LPF & Diode
% 201314651 ���ڰ��к� �̿��� (Lee Won-jai) 2015.04.13
% T is time
% L is Sinc Fuction
% Yl is Sinc Function in frequency domain
% M is Message Signal
% Ym is Message Signal in frequency domain
% C is Carrier Signal
% Yc is Carrier Signal in frequency domain
% A is Natural Constant
% O is rectified Signal
% Yo is rectified Signal in frequency domain
% S is Filtered Signal
% Ys is Filtered Signal in frequency domain
% H is prefectly demodulated signal
% Yh is prefectly demodulated signal in frequency domain

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

A=10
N=(M+A).*C
figure(4)
subplot(121)
plot(T,N)

O=(abs(N)+N)/2 %N�� ��ȣ�� ���̿��带 ���� ������Ų ��ȣ
subplot(122)
plot(T,O)

Yn = fft(N,300) %figure(5)�� ���� ���̿��尡 ��ȣ�� �����ϴ� ������ ���� �� �� �ִ�.
figure(5)
subplot(121)
plot(abs(Yn)/300)

Yo = fft(O,300)
subplot(122)
plot(abs(Yo)/300)

S=conv(O,L) %LPF�� ���� 15�̻��� ���ļ� ������ �ɷ�����.
figure(6)
subplot(121)
plot(S/300)

Ys = fft(S,300)
subplot(122)
plot(abs(Ys)/300)

H=S-A
figure(7)
subplot(121)
plot(H/300)

Yh = fft(H,300) %���ļ� ������ 10�� ������ Ȯ���� �� �ִ�.
subplot(122)
plot(abs(Yh)/300)