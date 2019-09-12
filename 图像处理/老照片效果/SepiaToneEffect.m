function [ dest ] = SepiaToneEffect( source )
    %����ƬЧ������
    [x y z] = size(source);
    dest = ones(x,y,z);
    %��Rͨ�����д���
    dest(:,:,1) = caculatorDest(1,0.393,0.769,0.189,source);
    %��Gͨ�����д���
    dest(:,:,2) = caculatorDest(2,0.349,0.686,0.168,source);
    %��Bͨ�����д���
    dest(:,:,3) = caculatorDest(3,0.272,0.534,0.131,source);
    
    dest=uint8(dest);
end

