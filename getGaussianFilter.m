function filterMatrix = getGaussianFilter( filterLength, sigma )
%���ɣ��ԳƵģ���˹�˲����ľ����������Ϊ�˲����ı߳���������filterLength�ͱ�׼��sigma

filterMatrix = zeros(filterLength);         %��ʼ��
step = 1 / filterLength;                    %���ò���
originOffset = ceil(filterLength / 2);      %���ĵ�����ƫ��
for i = 0 : originOffset - 1
    for j = 0 : i
        %��ȷ��ֱ����һά�ķ����Ƿ���ȷ
        f = 1 / (sqrt(2 * pi) * sigma) * exp(-(i * step * i * step + j * step * j *step) / (2 * sigma * sigma));
        filterMatrix(originOffset + i, originOffset + j) = f;
        %����������Գ�
        filterMatrix(originOffset - i, originOffset + j) = f;
        filterMatrix(originOffset - i, originOffset - j) = f;
        filterMatrix(originOffset + i, originOffset - j) = f;
        %���ڶԽ��߶Գ�
        filterMatrix(originOffset + j, originOffset + i) = f;
        filterMatrix(originOffset - j, originOffset + i) = f;
        filterMatrix(originOffset - j, originOffset - i) = f;
        filterMatrix(originOffset + j, originOffset - i) = f;
    end
end

%��һ��
k = sum(filterMatrix(:));
filterMatrix = filterMatrix / k;

end

