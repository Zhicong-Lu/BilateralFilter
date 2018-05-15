function outputPic = correlationWithBilateralFilter( imgMatrix, GFilter )
%����һ��ͼ������һ����˹�˲������������˫���˲�����ͼ�����
%˫���˲�����spatial kernel�ں�����ʵ��

[rows, columns, nDimension] = size(imgMatrix);                  %��ȡͼ�񳤿��ͨ����
imgMatrix = double(imgMatrix);
filterLength = size(GFilter, 1);                                 %Ĭ�Ϸ����˲���
floorHalfLength = floor(filterLength / 2);
ceilHalfLength = ceil(filterLength / 2);
outputPic = zeros(rows, columns, nDimension);                   %Ԥ����ռ䣬��������ٲü�
sigmoidOffset = 5;
%���ն��壬û���Ż�
for d = 1 : nDimension
    for r = ceilHalfLength : rows - floorHalfLength
        for c = ceilHalfLength : columns - floorHalfLength
            
            centerPointValue = imgMatrix(r, c, d);
            originMatrix = imgMatrix(r - floorHalfLength : r + floorHalfLength, c - floorHalfLength : c + floorHalfLength, d);
            
            %���߿��Ե��������Բ��ÿ��Ե�����sigmoid����
            tempEXP = exp(-(abs(originMatrix - centerPointValue) - sigmoidOffset));
            
            spatialKernelFunction = tempEXP / (1 + tempEXP);
            BFilter = spatialKernelFunction * GFilter;
            
            %��һ��
            k = sum(BFilter(:));
            BFilter = BFilter / k;
            
            tempMatrix = originMatrix .* BFilter;
            outputPic(r, c, d) = sum(tempMatrix(:));
        end
    end
end

%�ü�
outputPic = outputPic(ceilHalfLength : rows - floorHalfLength, ceilHalfLength : columns - floorHalfLength, :);
%ת��Ϊuint8����������ʾ
outputPic = uint8(outputPic);

end

