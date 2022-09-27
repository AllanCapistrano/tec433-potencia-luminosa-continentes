% Limpando o programa.
close all
clear all
clc

% Acessando o diretorio das imagens.
cd('./images');

% Carregando o pacote de imagens.
pkg load image

% Fazendo a leitura das imagens.
img_1 = imread('world.tif');
img_2 = imread('world-gray-scale.tif');

% Definindo a resolucao dos quadrantes da imagem.
amount_rows = rows(img_1) / 6;
amount_colums = columns(img_1) / 8;

begin_row = 1;
index = 1;

% Acessando o diretorio em que as imagens divididas serao armazenadas.
cd('./splitted');

for m = 1:6
  end_row = m * amount_rows;
  begin_column = 1;

  for n = 1:8
    end_column = n * amount_colums;

    img_1_result = img_1(begin_row:end_row, begin_column:end_column, :);
    img_2_result = img_2(begin_row:end_row, begin_column:end_column, :);

    begin_column = end_column + 1;

    img_1_name = strjoin({'img', 'colorful', num2str(index)}, '-');
    img_2_name = strjoin({'img', num2str(index)}, '-');

    cd('./colorful');
    imwrite(img_1_result, strcat(img_1_name, ".tif"));
    cd('..');

    cd('./gray-scale');
    imwrite(img_2_result, strcat(img_2_name, ".tif"));
    cd('..');

    index++;
  endfor

  begin_row = end_row + 1;
endfor

% Retornando para o diretorio das imagens.
cd('..');

% Retornando para o diretorio do script.
cd('..');
