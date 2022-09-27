% Limpando o programa.
close all
clear all
clc

% Acessando o diretorio das imagens.
cd('./images');

% Carregando o pacote de imagens.
pkg load image

% Fazendo a leitura das imagens.
#img_1 = imread('world.tif');
#img_2 = imread('world-gray-scale.tif'); 31 32 39 40

% Fazendo a leitura dos quadrantes das imagens.
cd('./splitted/colorful');
#img_1 = imread('img-colorful-10.tif');
img_1 = vertcat(imread('img-colorful-31.tif'), imread('img-colorful-32.tif'), imread('img-colorful-39.tif'), imread('img-colorful-40.tif'));
cd('..');

cd('./gray-scale');
#img_2 = imread('img-10.tif');
img_2 = vertcat(imread('img-31.tif'), imread('img-32.tif'), imread('img-39.tif'), imread('img-40.tif'));
cd('..');

% Voltando para o diretorio de imagens.
cd('..');

% Separando a imagem nas matrizes R G B.
img_1_R  = img_1(:, :, 1);
img_1_G  = img_1(:, :, 2);
img_1_B  = img_1(:, :, 3);

index = 1;
lighting = 0;

for n = 1:columns(img_2)
  for m = 1:rows(img_2)
    if ((img_1_R(m, n) != 4) && (img_1_G(m, n) != 5) && (img_1_B(m, n) != 15))
      pixel(index) = img_2(m, n);
      if (img_2(m, n) != 0)
        lighting++;
      endif

      index++;
    endif
  endfor
endfor

% Calculando a porcentagem de pixels claros presentes na imagem.
lighting_percentage = lighting / length(pixel) * 100;

printf("Existem %d pixels claros num total de %d pixels\n", lighting, length(pixel));
printf("Porcentagem de pixels claros: %.2f%%\n", lighting_percentage);

% Exibindo o histograma.
hist(pixel, 32);

% Retornando para o diretorio do script.
cd('..');
