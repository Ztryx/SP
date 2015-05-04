%Ejercicio 1
%Determinar el brillo y contraste de la imagen "P4.jpg"
I=imread('P4.jpg');
hist=imhist(I);
level=[0:255]';

total=sum(hist);

%B es el brillo de una imagen
B=sum(hist.*level)/total;
%C es el contraste de una imagen
C=sqrt(sum(hist.*(level-B).^2)/total);

%Ejercicio 2
%Genere nuevas imágenes de mayor y menor brillo
%que la original y mida, para cada imagen generada, 
%el nuevo valor de brillo.
%Me creo ambas funciones dedicadas a bajar y subir
%el brillo de la imagen
bajarContraste = @(x) x -80;
subirContraste = @(x) x +80;

%Bajo el brillo de la imagen deseada
ImenosContraste = bajarContraste(I);
Bbajada = getBrillo(ImenosContraste);

%Subo el brillo de la imagen deseada
ImasBrillo = subirContraste(I);
Bsubida = getBrillo(ImasBrillo);

%Muestro en la ventana las imágenes deseadas
figure;
subplot(1,3,1); imshow(ImenosContraste); title(strcat('B = ', num2str(Bbajada)));
subplot(1,3,2); imshow(I); title(strcat('B = ', num2str(B)));
subplot(1,3,3); imshow(ImasBrillo); title(strcat('B = ', num2str(Bsubida)));

%Ejercicio 3
%Genere nuevas imágenes de mayor y menor contraste que
%la original y mida, para cada imagen generada, el
%nuevo valor de contraste.
bajarContraste = @(x) (x - 0) * (150 - 0) / (255 - 0);
subirContraste = @(x) (x - 25) * (255 - 0) / (200 - 25);

ImasContraste = uint8(subirContraste(double(I)));
Cmas = getContraste(ImasContraste);

ImenosContraste = uint8(bajarContraste(double(I)));
Cmenos = getContraste(ImenosContraste);

figure;
subplot(2,3,1); imshow(ImenosContraste); title(strcat('C = ', num2str(Cmenos)));
subplot(2,3,4); imhist(ImenosContraste);
subplot(2,3,2); imshow(I); title(strcat('C = ', num2str(C)));
subplot(2,3,5); imhist(I);
subplot(2,3,3); imshow(ImasContraste); title(strcat('C = ', num2str(Cmas)));
subplot(2,3,6); imhist(ImasContraste);

%Ejercicio 4
%Aumente el contraste de la zona central de la imagen
%expandiendo de forma lineal el histograma.
ROI = roipoly(I);
cuadro = uint8(double(I).*ROI);
cuadroContrasteAlto=uint8(subirContraste(double(cuadro)));
IcuadroContrasteAlto=uint8(double(I).*(ROI==0)+double(cuadroContrasteAlto).*ROI);

figure;
subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(IcuadroContrasteAlto);