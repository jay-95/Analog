%message signal & carrier signal in time domain & in frequency domain
%201314651 이원재, 2015.04.02
% a는 시간 b는 message signal의 주파수 c는 carrier signal의 주파수 d는 sampling 주파수 S는
% message signal C는 carrier signal

a =0:0.001:2
b = 20
c = 60
d = 500
S = cos(2*pi*b*a)
C = cos(2*pi*c*a)
 
subplot(521)
plot (a,S)
 
subplot(522)
plot (a,C)

subplot(523)
plot (a,S+C)

subplot(524)
plot (a,S.*C)

subplot(525)
plot (a,S.*C.*2.*C)

subplot(526)
y=fft(S,d)
plot(abs(y))

subplot(527)
y=fft(C,d)
plot(abs(y))

subplot(528)
y=fft(S+C,d)
plot(abs(y))

subplot(529)
y=fft(S.*C,d)
plot(abs(y))

subplot(5,2,10)
y=fft(S.*C.*2.*C,d)
plot(abs(y))