% Making Double Side Band(DSB) using Conherent Demodulation with LPF
% 201314651 전자공학부 이원재 (Lee Won-jai) 2015.04.13
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

N=M.*C %Modulation
figure(4)
subplot(121)
plot(T,N)

Yn = fft(N,300) %Modulation의 결과, 주파수 성분이 20, 40임을 관찰할 수 있다.
subplot(122)
plot(abs(Yn)/300)

K=N.*(2.*C) %Demodulation
figure(5)
subplot(121)
plot(T,K)

Yk = fft(K,300) %Demodulation의 결과, 주파수 성분이 10, 50, 70임을 관찰할 수 있다.
subplot(122)
plot(abs(Yk)/300)

S=conv(K,L) %LPF를 통해 15이상의 주파수 성분을 걸러낸다. 즉, 주파수가 50, 70인 성분을 걸러낸다.
figure(6)
subplot(121)
plot(S/300)

Ys = fft(S,300) %주파수 성분이 10만 남음을 확인할 수 있다.
subplot(122)
plot(abs(Ys)/300)