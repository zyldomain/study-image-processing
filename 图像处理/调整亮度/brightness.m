function [ dest ] = brightness(bright, source )
    %调整图像亮度
    %获取r,g,b的平均值
    Rmean = mean(source(:,:,1));
    Gmean = mean(source(:,:,2));
    Bmean = mean(source(:,:,3));
    dest = [];
    dest(:,:,1) = double(source(:,:,1)) + (bright - 1) * Rmean(1,1);
    dest(:,:,2) = double(source(:,:,2)) + (bright - 1) * Gmean(1,1);
    dest(:,:,3) = double(source(:,:,3)) + (bright - 1) * Bmean(1,1);
    
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    dest = uint8(dest);
end

