function [ dest ] = air( source )
    %¿ÕÆø·ç¸ñ
    dest(:,:,1) = (source(:,:,2) + source(:,:,3)) / 2;
    dest(:,:,2) = (source(:,:,1) + source(:,:,3)) / 2;
    dest(:,:,3) = (source(:,:,2) + source(:,:,1)) / 2;

    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

