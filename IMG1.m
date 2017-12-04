clc
clear all
C = imread('coins.png');
P = imread('peppers.png');
% Dimension de las imagenes: 
% size(C), size(P)
% Descripcion variables
% whos C,whos P
% Calculo de bytes
% D = size(C); D(1)*D(2), whos C

% Visualizacion
figure
imshow(P)

imtool(P)

% Img ciudad
I = imread('vista_ciudad.tif');
figure, imshow(I);
figure, imshow(I,[]);

% Rgb to Gray
figure
imshow(rgb2gray(P))

% Negativo capa Roja
Pr = P(:,:,1);
P(:,:,1) = 255 - Pr;

figure
imshow(P)

%% 2 Obtener monedas
imtool(C)
imhist(C)

imtool(im2bw(C,100/255))

% Se observa que este resultado no nos vale si queremos automatizar el
% proceso de conteo de monedas, ya que existe variacion de frecuencia
% dentro de alguna moneda.
%Preprocesado: Se deberia suavizar las monedas para eliminar las transiciones
%dentro de ellas

% Umbralizacion automatica de Matlab
umbral = graythresh (C)
imtool(im2bw(C,umbral))
% Esta forma es aun peor
%% 3 Ruido y filtrado espacial
close all
R = zeros(256,256) + 128;
whos R
R = uint8(R);

SP = imnoise(R,'salt & pepper',0.2);
G = imnoise(R,'gaussian',0, 0.02);
S = imnoise(R,'speckle',0.02);

figure
subplot(4,1,1)
imshow(R)
subplot(4,1,2)
imshow(SP)
subplot(4,1,3)
imshow(G)
subplot(4,1,4)
imshow(S)

figure
subplot(4,1,1)
imhist(R)
subplot(4,1,2)
imhist(SP)
subplot(4,1,3)
imhist(G)
subplot(4,1,4)
imhist(S)

%% Filtrado lineal
f = (1/25) * ones(5,5);
SP2 = imfilter(SP,f,'symmetric');
G2 = imfilter(G,f,'symmetric');
S2 = imfilter(S,f,'symmetric');

figure
subplot(3,1,1)
imshow(SP2)
subplot(3,1,2)
imshow(G2)
subplot(3,1,3)
imshow(S2)

figure
subplot(3,1,1)
imhist(SP2)
subplot(3,1,2)
imhist(G2)
subplot(3,1,3)
imhist(S2)

%% Filtrado No lineal
SP3 = medfilt2(SP,[5,5],'symmetric');
G3 = medfilt2(G,[5,5],'symmetric');
S3 = medfilt2(S,[5,5],'symmetric');

figure
subplot(3,1,1)
imshow(SP3)
subplot(3,1,2)
imshow(G3)
subplot(3,1,3)
imshow(S3)

figure, title("NO LINEAL | MEDIANA")
subplot(3,1,1)
imhist(SP3)
subplot(3,1,2)
imhist(G3)
subplot(3,1,3)
imhist(S3)

%% 4. Extracción de contornos
figure
imshow(C)

f = (1/25) * ones(5,5);
C2 = imfilter(C,f,'symmetric');

figure
imshow(C2)
C3 = im2bw(C2,100/255);
figure
imshow(C3)

f2 = (-1) * ones(5,5);
f2(3,3) = 24;

C4 = imfilter(C3,f2,'symmetric');
figure
imshow(C4)

Cr = gray2rgb(C4)
 
