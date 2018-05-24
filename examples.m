%��ʾ����

clear;
clc;

%��ʱ
tic;

%���ɵ�ͼ��
GFilter1 = getGaussianFilter( 21, 0.15 );                               %���ɸ�˹ģ��
imgMatrix1 = imread('.\data\TP2gray10per.png');                         %��ȡͼ��

outputPicBF1 = correlationWithBilateralFilter( imgMatrix1, GFilter1 );  %Ӧ��˫���˲�
outputPicGF1 = correlationWithFilter( imgMatrix1, GFilter1 );           %Ӧ�ø�˹�˲�

figure('Name','�ϳ�ͼ�񣨻Ҷ�ͼ��');                                     %�´���
set(gcf,'outerposition',get(0,'screensize'));                           %���
subplot(1, 3, 1);                                                       %��ͼ
imshow(imgMatrix1);                                                     %��ʾ
title('ԭͼ');                                                          %����
subplot(1, 3, 2);
imshow(outputPicBF1);
title('˫���˲���');
subplot(1, 3, 3);
imshow(outputPicGF1);
title('��˹�˲���');
figure('Name','�ϳ�ͼ�񣨻Ҷ�ͼ��');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
mesh(imgMatrix1);
title('ԭͼ');
subplot(1, 3, 2);
mesh(outputPicBF1);
title('˫���˲���');
subplot(1, 3, 3);
mesh(outputPicGF1);
title('��˹�˲���');


%matlab�е�rice
GFilter2 = getGaussianFilter( 15, 0.15 );
imgMatrix2 = imread('.\data\rice6per.png');
outputPicBF2 = correlationWithBilateralFilter( imgMatrix2, GFilter2 );
outputPicGF2 = correlationWithFilter( imgMatrix2, GFilter2 );

figure('Name','rice���Ҷ�ͼ��');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix2);
title('ԭͼ');
subplot(1, 3, 2);
imshow(outputPicBF2);
title('˫���˲���');
subplot(1, 3, 3);
imshow(outputPicGF2);
title('��˹�˲���');


%matlab�е�cameraman
GFilter3 = getGaussianFilter( 15, 0.15 );
imgMatrix3 = imread('.\data\cameraman6per.tif');
outputPicBF3 = correlationWithBilateralFilter( imgMatrix3, GFilter3 );
outputPicGF3 = correlationWithFilter( imgMatrix3, GFilter3 );

figure('Name','Cameraman���Ҷ�ͼ��');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix3);
title('ԭͼ');
subplot(1, 3, 2);
imshow(outputPicBF3);
title('˫���˲���');
subplot(1, 3, 3);
imshow(outputPicGF3);
title('��˹�˲���');


%���ϵ�Lena
GFilter4 = getGaussianFilter( 15, 0.15 );
imgMatrix4 = imread('.\data\lena5perG.jpg');
outputPicBF4 = correlationWithBilateralFilter( imgMatrix4, GFilter4 );
outputPicGF4 = correlationWithFilter( imgMatrix4, GFilter4 );

figure('Name','Lena��RGBͼ��');
set(gcf,'outerposition',get(0,'screensize'));
subplot(1, 3, 1);
imshow(imgMatrix4);
title('ԭͼ');
subplot(1, 3, 2);
imshow(outputPicBF4);
title('˫���˲���');
subplot(1, 3, 3);
imshow(outputPicGF4);
title('��˹�˲���');

toc;
