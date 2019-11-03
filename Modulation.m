%message signal & carrier signal in time domain & in frequency domain
%201314651 �̿���, 2015.04.02
% a�� �ð� b�� message signal�� ���ļ� c�� carrier signal�� ���ļ� d�� sampling ���ļ� S��
% message signal C�� carrier signal

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