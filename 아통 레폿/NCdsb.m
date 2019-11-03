% Making Double Side Band(DSB) using Non-Conherent Demodulation with LPF & Diode
% 201314651 전자공학부 이원재 (Lee Won-jai) 2015.04.13
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

T=-(1/30)*10+0.000001:(1/30)/10:(1/30)*10 %Sinc Fuction의 경우 0에서 계산이 되지 않기 때문에, 0에서의 계산을 피해주고자 -(1/30)*10+0.000001를 시작 시간으로 정함.
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

M=cos(2*pi*10*T) %주파수가 10인 Message Signal이다.
figure(2)
subplot(121)
plot(T,M)

Ym=fft(M,300)
subplot(122)
plot(abs(Ym)/300)

C=cos(2*pi*30*T) %주파수가 30인 Carrier Signal이다.
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

O=(abs(N)+N)/2 %N의 신호를 다이오드를 통해 정류시킨 신호
subplot(122)
plot(T,O)

Yn = fft(N,300) %figure(5)를 통해 다이오드가 신호를 분해하는 역할을 함을 알 수 있다.
figure(5)
subplot(121)
plot(abs(Yn)/300)

Yo = fft(O,300)
subplot(122)
plot(abs(Yo)/300)

S=conv(O,L) %LPF를 통해 15이상의 주파수 성분을 걸러낸다.
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

Yh = fft(H,300) %주파수 성분이 10만 남음을 확인할 수 있다.
subplot(122)
plot(abs(Yh)/300)