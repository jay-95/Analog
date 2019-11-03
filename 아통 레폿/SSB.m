% Making Single Side Band(SSB) using Hilbert Transform with LPF
% 201314651 전자공학부 이원재 (Lee Won-jai) 2015.04.13
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

T = -(1/30)*10+0.000001:(1/30)/10:(1/30)*10 %Sinc Fuction의 경우 0에서 계산이 되지 않기 때문에, 0에서의 계산을 피해주고자 -(1/30)*10+0.000001를 시작 시간으로 정함.
                                            %사용하는 신호들 중 최대 주파수가 30이므로 나이퀴스트
                                            %법칙을 만족시키면서 관찰하기 좋은 눈금을 만들기 위해
                                            %Sampling Time = (1/30)/10로 설정한다.

L=sin(2*pi*15*T)./(pi*T) %Sinc Fuction으로 LPF의 역할을 한다. 주파수가 15 아래인 성분만 통과시킨다.
figure(1)
subplot(121)
plot(T,L)

Yl=fft(L,300)
subplot(122)
plot(abs(Yl)/300)

M = cos(2*pi*10*T) %주파수가 10인 Message Signal이다.
figure(2)
subplot(121)
plot(T,M)

Ym = fft(M,300)
subplot(122)
plot(abs(Ym)/300)

C = cos(2*pi*30*T) %주파수가 30인 Carrier Signal이다.
figure(3)
subplot(121)
plot(T,C)

Yc=fft(C,300)
subplot(122)
plot(abs(Yc)/300)

Hm = sin(2*pi*10*T) %Message Signal의 Hilbert Transform 형태로 Message Signal와 위상이 90도 차이 난다.
figure(4)
subplot(121)
plot(T,M,T,Hm,'r')
grid on

Hc = sin(2*pi*30*T) %Sin 형태의 Carrier Signal이다.
subplot(122)
plot(T,Hc)

N1 = (M.*C)+(Hm.*Hc) %Lower Side Band이고, 주파수가 20이다.
figure(5)
subplot(121)
plot(T,N1)

Yn1=fft(N1,300)
subplot(122)
plot(abs(Yn1)/300)

N2 = (M.*C)-(Hm.*Hc) %Upper Side Band이고, 주파수가 40이다.
figure(6)
subplot(121)
plot(T,N2)

Yn2=fft(N2,300)
subplot(122)
plot(abs(Yn2)/300)

K1 = N1.*(2*C) %Lower Side Band의 Demodulation, 주파수가 10과 50인 성분으로 이루어져 있다.
figure(7)
subplot(121)
plot(T,K1)

Yk1=fft(K1,300) 
subplot(122)
plot(abs(Yk1)/300)

K2 = N2.*(2*C) %Upper Side Band의 Demodulation, 주파수가 10과 70인 성분으로 이루어져 있다.
figure(8)
subplot(121)
plot(T,K2)

Yk2=fft(K2,300)
subplot(122)
plot(abs(Yk2)/300)


S1=conv(K1,L)./300  %Lower Side Band를 LPF에 통과 시킨다.
figure(9)
subplot(121)
plot(S1)

Ys1=fft(S1,300) %주파수가 50인 성분은 없어지고, 주파수가 10인 성분만 남게 된다.
subplot(122)
plot(abs(Ys1)/300)

S2=conv(K2,L)./300 %Upper Side Band를 LPF에 통과 시킨다.
figure(10)
subplot(121)
plot(S2)

Ys2=fft(S2,300) %주파수가 70인 성분은 없어지고, 주파수가 10인 성분만 남게 된다.
subplot(122)
plot(abs(Ys2)/300)