function outputPic = correlationWithBilateralFilter( imgMatrix, GFilter )
%����һ��ͼ������һ����˹�˲������������˫���˲�����ͼ�����
%˫���˲�����spatial kernel�ں�����ʵ��

[rows, columns, nDimension] = size(imgMatrix);                  %��ȡͼ�񳤿��ͨ����������RGBͼ��
imgMatrix = double(imgMatrix);                                  %��Ҫת������
filterLength = size(GFilter, 1);                                %Ĭ�Ϸ����˲���
floorHalfLength = floor(filterLength / 2);
ceilHalfLength = ceil(filterLength / 2);
outputPic = zeros(rows, columns, nDimension);                   %Ԥ����ռ䣬��������ٲü�

%sigmoidOffset = 5;

%���ն��������ش���û���Ż���ͨ������ǰ���Ѽ���Ľ���Ż���
for d = 1 : nDimension
    for r = ceilHalfLength : rows - floorHalfLength
        for c = ceilHalfLength : columns - floorHalfLength
            
            centerPointValue = imgMatrix(r, c, d);
            originMatrix = imgMatrix(r - floorHalfLength : r + floorHalfLength, c - floorHalfLength : c + floorHalfLength, d);
            
            %���߿��Ե��������Բ��ÿ��Ե�����sigmoid���������Ժ�������ֵ��������ѡ����ֵ����
            
            %1.sigmoid
%             tempEXP = exp(-(abs(originMatrix - centerPointValue) - sigmoidOffset));
%             spatialKernelFunction = tempEXP / (1 + tempEXP);

            %2.linear
%            spatialKernelFunction = -abs(originMatrix - centerPointValue) / 255 + 1;

            %3.threshold
            spatialKernelFunction = abs(originMatrix - centerPointValue);
            %�˴�������ֵ�����ܿ�����Ϊ������������������Ӧ�ķ���ȷ��
            threshold = 50;
            spatialKernelFunction(spatialKernelFunction < threshold) = 1;
            spatialKernelFunction(spatialKernelFunction ~= 1) = 0;
            
            %��˵õ����յ�˫���˲���
            BFilter = spatialKernelFunction .* GFilter;
            
            %��һ��
            k = sum(BFilter(:));
            BFilter = BFilter / k;
            
            tempMatrix = originMatrix .* BFilter;               %������ز���
            outputPic(r, c, d) = sum(tempMatrix(:));
        end
    end
end

%�ü�
outputPic = outputPic(ceilHalfLength : rows - floorHalfLength, ceilHalfLength : columns - floorHalfLength, :);
%ת��Ϊuint8����������ʾ
outputPic = uint8(outputPic);

end

