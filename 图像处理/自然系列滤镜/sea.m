function [ dest ] = sea( source )
    %º£Ñó·ç¸ñ
    gray = double(source(:,:,1) + source(:,:,2) + source(:,:,3)) / 3.0;
    dest(:,:,1) = gray / 3.0;
    dest(:,:,2) = gray;
    dest(:,:,3) = gray * 3;
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

