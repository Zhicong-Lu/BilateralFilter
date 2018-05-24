%演示程序

clear;
clc;

%计时
tic;

%生成的图像
GFilter1 = getGaussianFilter( 21, 0.15 );                               %生成高斯模版
imgMatrix1 = imread('.\data\TP2gray10per.png');                         %读取图像

outputPicBF1 = correlationWithBilateralFilter( imgMatrix1, GFilter1 );  %应用双边滤波
outputPicGF1 = correlationWithFilter( imgMatrix1, GFilter1 );           %应用高斯滤波

figure('Name','合成图像（灰度图）');                                     %新窗口
set(gcf,'outerposition',get(0,'screensize'));                           %最大化
subplot(1, 3, 1);                                                       %子图
imshow(imgMatrix1);                                                     %显示
title('原图');                                                          %标题
subplot(1, 3, 2);
imshow(outputPicBF1);
title('双边滤波器');
subplot(1, 3, 3);
imshow(outputPicGF1);
title('高斯滤波器');
figure('Name','合成图像（灰度图）');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
mesh(imgMatrix1);
title('原图');
subplot(1, 3, 2);
mesh(outputPicBF1);
title('双边滤波器');
subplot(1, 3, 3);
mesh(outputPicGF1);
title('高斯滤波器');


%matlab中的rice
GFilter2 = getGaussianFilter( 15, 0.15 );
imgMatrix2 = imread('.\data\rice6per.png');
outputPicBF2 = correlationWithBilateralFilter( imgMatrix2, GFilter2 );
outputPicGF2 = correlationWithFilter( imgMatrix2, GFilter2 );

figure('Name','rice（灰度图）');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix2);
title('原图');
subplot(1, 3, 2);
imshow(outputPicBF2);
title('双边滤波器');
subplot(1, 3, 3);
imshow(outputPicGF2);
title('高斯滤波器');


%matlab中的cameraman
GFilter3 = getGaussianFilter( 15, 0.15 );
imgMatrix3 = imread('.\data\cameraman6per.tif');
outputPicBF3 = correlationWithBilateralFilter( imgMatrix3, GFilter3 );
outputPicGF3 = correlationWithFilter( imgMatrix3, GFilter3 );

figure('Name','Cameraman（灰度图）');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix3);
title('原图');
subplot(1, 3, 2);
imshow(outputPicBF3);
title('双边滤波器');
subplot(1, 3, 3);
imshow(outputPicGF3);
title('高斯滤波器');


%网上的Lena
GFilter4 = getGaussianFilter( 15, 0.15 );
imgMatrix4 = imread('.\data\lena5perG.jpg');
outputPicBF4 = correlationWithBilateralFilter( imgMatrix4, GFilter4 );
outputPicGF4 = correlationWithFilter( imgMatrix4, GFilter4 );

figure('Name','Lena（RGB图像）');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix4);
title('原图');
subplot(1, 3, 2);
imshow(outputPicBF4);
title('双边滤波器');
subplot(1, 3, 3);
imshow(outputPicGF4);
title('高斯滤波器');

toc;
