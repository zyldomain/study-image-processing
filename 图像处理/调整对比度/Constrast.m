function [ dest ] = Constrast( contrast, source )
    %调整对比度
    contrast = 1 + contrast / 100.0;
    dest = [];
    dest(:,:,1) = ((double(source(:,:,1))/255.0 - 0.5) * double(contrast)  + 0.5) * 255.0;
    dest(:,:,2) = ((double(source(:,:,2))/255.0 - 0.5) * double(contrast)  + 0.5) * 255.0;
    dest(:,:,3) = ((double(source(:,:,3))/255.0 - 0.5) * double(contrast)  + 0.5) * 255.0;
    
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

