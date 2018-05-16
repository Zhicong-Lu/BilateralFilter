clear;
clc;

% GFilter = getGaussianFilter( 21, 0.15 );
% imgMatrix = imread('TP2gray10per.png');

% GFilter = getGaussianFilter( 15, 0.15 );
% imgMatrix = imread('rice6per.png');

% GFilter = getGaussianFilter( 15, 0.15 );
% imgMatrix = imread('cameraman6per.tif');

GFilter = getGaussianFilter( 15, 0.15 );
imgMatrix = imread('lena5perG.jpg');

outputPicBF = correlationWithBilateralFilter( imgMatrix, GFilter );
outputPicGF = correlationWithFilter( imgMatrix, GFilter );

figure;
imshow(imgMatrix);
figure;
imshow(outputPicBF);
figure;
imshow(outputPicGF);
if size(imgMatrix, 3) == 1
    figure;
    mesh(imgMatrix);
    figure;
    mesh(outputPicBF);
    figure;
    mesh(outputPicGF);
end
