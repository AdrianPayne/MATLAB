%% PRACTICA 2 IMG
%% CUESTIONARIO TEORICO
% 1. En RGB el tono viene definido por las 3 magnitudes, mientras quen HSI
%solo por dos (H y S). Todo el entorno RGB queda representado en un cubo,
%mientra que HSI en dos conos con bases pegadas. HSI nace de la forma en la
%que el ojo humano entiende los colores.
% 2. Se obtendria el contorno de dicho disco. La forma de obtener este
%contorno con filtros lineales ser�a con un FILTRO PASO ALTO
% 3.                                n� objetos        resultado
% segmentaci�n binaria            |
% segmentaci�n por niveles de gris| 
% segmentaci�n por zonas planas   | sdfs|

%% I. Transformaci�n del espacio de representaci�n 
I = imread('Board_Recorte.tif');

imtool(I)
figure
imshow(I(:,:,1))
figure
imshow(I(:,:,2))
figure
imshow(I(:,:,3))
% El fondo es verde
%%
% Cambio a HSI
[h,s,i] = rgb2hsi(I);
figure
imshow(h)
figure
imshow(s)
figure
imshow(i)

componente = s;
%% II. Umbralizaci�n y filtrado
imhist(componente)

u =graythresh(componente);
Ibw = im2bw(componente,u);

imtool(Ibw)

Ibw = Ibw.*255;
Ibw = uint8(Ibw);

f = (1/25) * ones(5,5);
Ibw2 = imfilter(Ibw,f,'symmetric');

imtool(Ibw2)

%% III. Aplicaci�n de operadores morfol�gicos
