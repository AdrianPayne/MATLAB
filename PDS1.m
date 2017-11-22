%PRACTICA 1
%% 1 INTRODUCCION
%1 Generar onda y escucharla
f0 = 100;
t = 0:0.001:1;
s = sin(f0*2*(pi)*t);

soundsc(s,1000)
% 2 Representar

%% 2 EXTRACCION DE CARACTERISTICAS
%Lectura
[sig,Fs] = audioread('material_P1/confront.wav');
soundsc(sig,Fs)
figure
plot(sig)
%Enventanado
N = 1/0.02;
r = rectwin(N)
h = hamming(N)
figure
subplot(2,1,1);
plot(r)
subplot(2,1,2);
plot(h)
% XXXXX introducira menos distorsion
espectro_ventanas(r,h)

%Energia localizada y tasa de cruces