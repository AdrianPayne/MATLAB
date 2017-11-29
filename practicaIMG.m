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


%% 2 Obtener monedas
imtool(C)
imhist(C)

imtool(im2bw(C,100/255))

% Se observa que este resultado no nos vale si queremos automatizar el
% proceso de conteo de monedas, ya que existe variacion de frecuencia
% dentro de alguna moneda.

%Preprocesado: Se deberia suavizar las monedas para eliminar las transiciones
%dentro de ellas
umbral = graythresh (C)
imtool(im2bw(C,umbral))
% Esta forma es aun peor
%% 3 Ruido y filtrado espacial
R = zeros(256,256) + 128;

whos R
R = uint8(R);
figure
imshow(R)
%% 4 Negativo capa Roja
Pr = P(:,:,1);
P(:,:,1) = Pr;

figure
imshow(P)