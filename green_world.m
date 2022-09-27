% Limpando o programa.
close all
clear all
clc

% Acessando o diretorio das imagens.
cd('./images');

% Carregando o pacote de imagens.
pkg load image

% Fazendo a leitura da imagem do mundo.
img_world = imread('world.tif');

% Separando a imagem nas matrizes R G B.
img_world_R  = img_world(:, :, 1);
img_world_G  = img_world(:, :, 2);
img_world_B  = img_world(:, :, 3);

index = 1;

for n = 1:columns(img_world_B)
  for m = 1:rows(img_world_B)
    if ((img_world_R(m, n) != 4) && (img_world_G(m, n) != 5) && (img_world_B(m, n) != 15))
      % Alterando para verde a cor de tudo menos os rios, lagos e oceanos .
      img_world_R(m, n) = 0;
      img_world_G(m, n) = 255;
      img_world_B(m, n) = 0;

      index++;
    endif
  endfor
endfor

img_result = cat(3, img_world_R, img_world_G, img_world_B);

imwrite(img_result, "green-world.tif");

% Acessando o diretorio dos quadrantes das imagens.
cd('./splitted');

amount_imgs = 48;

for index = 1:amount_imgs
  % Fazendo a leitura dos quadrantes da imagem
  img_name = strcat(strjoin({'img', 'colorful', num2str(index)}, '-'), ".tif");

  cd('./colorful');
  img_quadrant = imread(img_name);

  % Separando a imagem nas matrizes R G B.
  img_quadrant_R  = img_quadrant(:, :, 1);
  img_quadrant_G  = img_quadrant(:, :, 2);
  img_quadrant_B  = img_quadrant(:, :, 3);

  for n = 1:columns(img_quadrant_B)
    for m = 1:rows(img_quadrant_B)
      if ((img_quadrant_R(m, n) != 4) && (img_quadrant_G(m, n) != 5) && (img_quadrant_B(m, n) != 15))
        % Alterando para verde a cor de tudo menos dos mares e aceanos .
        img_quadrant_R(m, n) = 0;
        img_quadrant_G(m, n) = 255;
        img_quadrant_B(m, n) = 0;
      endif
    endfor
  endfor

  cd('..');

  img_result = cat(3, img_quadrant_R, img_quadrant_G, img_quadrant_B);

  cd('./green');
  imwrite(img_result, strcat(strjoin({'img', 'green', num2str(index)}, '-'), ".tif"));
  cd('..');
endfor

% Retornando para o diretorio das imagens.
cd('..');

% Retornando para o diretorio do script.
cd('..');
