function outputPic = correlationWithFilter( imgMatrix, filter )
%������ͼ����˲���������ز��������������Ľ��
%���������ΪRGBͼ�񣬷ֱ��ÿ��ͨ�������˲���������Ե�����òü�����padding
%���⣺�е���

[rows, columns, nDimension] = size(imgMatrix);
filterLength = size(filter, 1);                                 %Ĭ�Ϸ����˲���
floorHalfLength = floor(filterLength / 2);
ceilHalfLength = ceil(filterLength / 2);
outputPic = zeros(rows, columns, nDimension);                   %Ԥ����ռ䣬������ü�

%���ն��壬û���Ż�
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

