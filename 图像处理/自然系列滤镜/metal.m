function [ dest ] = metal( source )
       %½ğÊô·ç¸ñ
        dest(:,:,1) = abs(source(:,:,1) - 64);
        dest(:,:,2) = abs(dest(:,:,1) - 64);
        dest(:,:,3) = abs(dest(:,:,2) - 64);
        gray = double(222.0 * dest(:,:,1) + 707.0 * dest(:,:,2) + 71.0 * dest(:,:,3))/1000.0;
        dest(:,:,1) =  dest(:,:,1) + 70;
        dest(:,:,1) = dest(:,:,1) * 2 - 128;
        
        dest(:,:,2) =  dest(:,:,2) + 65;
        dest(:,:,2) = dest(:,:,2) * 2 - 128;
        
        dest(:,:,3) =  dest(:,:,3) + 75;
        dest(:,:,3) = dest(:,:,3) * 2 - 128;
        
        dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

