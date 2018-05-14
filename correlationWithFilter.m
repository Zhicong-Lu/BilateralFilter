function outputPic = correlationWithFilter( imgMatrix, filter )
%对输入图像和滤波器进行相关操作，输出操作后的结果
%方法：如果为RGB图像，分别对每个通道进行滤波操作。边缘处采用裁剪而不padding
%问题：有点慢

[rows, columns, nDimension] = size(imgMatrix);
filterLength = size(filter, 1);                                 %默认方形滤波器
floorHalfLength = floor(filterLength / 2);
ceilHalfLength = ceil(filterLength / 2);
outputPic = zeros(rows, columns, nDimension);                   %预分配空间，操作后裁剪

%按照定义，没有优化
for d = 1 : nDimension
    for r = ceilHalfLength : rows - floorHalfLength
        for c = ceilHalfLength : columns - floorHalfLength
            tempMatrix = double(imgMatrix(r - floorHalfLength : r + floorHalfLength, c - floorHalfLength : c + floorHalfLength, d)) .* filter;
            outputPic(r, c, d) = sum(tempMatrix(:));
        end
    end
end

outputPic = outputPic(ceilHalfLength : rows - floorHalfLength, ceilHalfLength : columns - floorHalfLength, :);
outputPic = uint8(outputPic);

end

