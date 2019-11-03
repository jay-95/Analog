% Making Single Side Band(SSB) using Hilbert Transform with LPF
% 201314651 ���ڰ��к� �̿��� (Lee Won-jai) 2015.04.13
% T is time
% L is Sinc Fuction
% Yl is Sinc Function in frequency domain
% M is Message Signal
% Ym is Message Signal in frequency domain
% C is Carrier Signal
% Yc is Carrier Signal in frequency domain
% Hm is Hilbert Transformed Message Signal
% Hc is sin formed carrier signal
% N1 is Lower Side Band
% Yn1 is Lower Side Band in frequency domain
% N2 is is Upper Side Band
% Yn2 is Upper Side Band in frequency domain
% K1 is demodulation of Lower Side Band
% Yk1 is demodulation of Lower Side Band in frequency domain
% K2 is demodulation of Upper Side Band
% Yk2 is demodulation of Upper Side Band in frequency domain
% S1 is filtered lower signal
% Ys1 is filtered lower signal in frequency domain
% S2 is filtered upper signal
% Ys2 is filtered upper signal in frequency domain

T = -(1/30)*10+0.000001:(1/30)/10:(1/30)*10 %Sinc Fuction�� ��� 0���� ����� ���� �ʱ� ������, 0������ ����� �����ְ��� -(1/30)*10+0.000001�� ���� �ð����� ����.
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

M = cos(2*pi*10*T) %���ļ��� 10�� Message Signal�̴�.
figure(2)
subplot(121)
plot(T,M)

Ym = fft(M,300)
subplot(122)
plot(abs(Ym)/300)

C = cos(2*pi*30*T) %���ļ��� 30�� Carrier Signal�̴�.
figure(3)
subplot(121)
plot(T,C)

Yc=fft(C,300)
subplot(122)
plot(abs(Yc)/300)

Hm = sin(2*pi*10*T) %Message Signal�� Hilbert Transform ���·� Message Signal�� ������ 90�� ���� ����.
figure(4)
subplot(121)
plot(T,M,T,Hm,'r')
grid on

Hc = sin(2*pi*30*T) %Sin ������ Carrier Signal�̴�.
subplot(122)
plot(T,Hc)

N1 = (M.*C)+(Hm.*Hc) %Lower Side Band�̰�, ���ļ��� 20�̴�.
figure(5)
subplot(121)
plot(T,N1)

Yn1=fft(N1,300)
subplot(122)
plot(abs(Yn1)/300)

N2 = (M.*C)-(Hm.*Hc) %Upper Side Band�̰�, ���ļ��� 40�̴�.
figure(6)
subplot(121)
plot(T,N2)

Yn2=fft(N2,300)
subplot(122)
plot(abs(Yn2)/300)

K1 = N1.*(2*C) %Lower Side Band�� Demodulation, ���ļ��� 10�� 50�� �������� �̷���� �ִ�.
figure(7)
subplot(121)
plot(T,K1)

Yk1=fft(K1,300) 
subplot(122)
plot(abs(Yk1)/300)

K2 = N2.*(2*C) %Upper Side Band�� Demodulation, ���ļ��� 10�� 70�� �������� �̷���� �ִ�.
figure(8)
subplot(121)
plot(T,K2)

Yk2=fft(K2,300)
subplot(122)
plot(abs(Yk2)/300)


S1=conv(K1,L)./300  %Lower Side Band�� LPF�� ��� ��Ų��.
figure(9)
subplot(121)
plot(S1)

Ys1=fft(S1,300) %���ļ��� 50�� ������ ��������, ���ļ��� 10�� ���и� ���� �ȴ�.
subplot(122)
plot(abs(Ys1)/300)

S2=conv(K2,L)./300 %Upper Side Band�� LPF�� ��� ��Ų��.
figure(10)
subplot(121)
plot(S2)

Ys2=fft(S2,300) %���ļ��� 70�� ������ ��������, ���ļ��� 10�� ���и� ���� �ȴ�.
subplot(122)
plot(abs(Ys2)/300)