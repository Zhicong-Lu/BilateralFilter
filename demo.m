clear;
clc;

GFilter = getGaussianFilter( 21, 0.15 );

imgMatrix = imread('TP2gray1per.png');
outputPicBF = correlationWithBilateralFilter( imgMatrix, GFilter );
outputPicGF = correlationWithFilter( imgMatrix, GFilter );

figure;
imshow(imgMatrix);
figure;
imshow(outputPicBF);
figure;
imshow(outputPicGF);
figure;
mesh(imgMatrix);
figure;
mesh(outputPicBF);
figure;
mesh(outputPicGF);
