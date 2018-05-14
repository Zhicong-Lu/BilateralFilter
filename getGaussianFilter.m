function filterMatrix = getGaussianFilter( filterLength, sigma )
%生成（对称的）高斯滤波器的矩阵，输入参数为滤波器的边长（奇数）filterLength和标准差sigma

filterMatrix = zeros(filterLength);         %初始化
step = 1 / filterLength;                    %设置步长
originOffset = ceil(filterLength / 2);      %中心点坐标偏移
for i = 0 : originOffset - 1
    for j = 0 : i
        %不确定直接用一维的方法是否正确
        f = 1 / (sqrt(2 * pi) * sigma) * exp(-(i * step * i * step + j * step * j *step) / (2 * sigma * sigma));
        filterMatrix(originOffset + i, originOffset + j) = f;
        %关于坐标轴对称
        filterMatrix(originOffset - i, originOffset + j) = f;
        filterMatrix(originOffset - i, originOffset - j) = f;
        filterMatrix(originOffset + i, originOffset - j) = f;
        %关于对角线对称
        filterMatrix(originOffset + j, originOffset + i) = f;
        filterMatrix(originOffset - j, originOffset + i) = f;
        filterMatrix(originOffset - j, originOffset - i) = f;
        filterMatrix(originOffset + j, originOffset - i) = f;
    end
end

%归一化
k = sum(filterMatrix(:));
filterMatrix = filterMatrix / k;

end

