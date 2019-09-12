function [ dest ] = SepiaToneEffect( source )
    %老照片效果处理
    [x y z] = size(source);
    dest = ones(x,y,z);
    %对R通道进行处理
    dest(:,:,1) = caculatorDest(1,0.393,0.769,0.189,source);
    %对G通道进行处理
    dest(:,:,2) = caculatorDest(2,0.349,0.686,0.168,source);
    %对B通道进行处理
    dest(:,:,3) = caculatorDest(3,0.272,0.534,0.131,source);
    
    dest=uint8(dest);
end

