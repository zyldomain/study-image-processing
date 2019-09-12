function [ dest ] = coldStyle( source )
    %±ù¶³·ç¸ñ
    dest(:,:,1) = abs(source(:,:,1) - source(:,:,2) - source(:,:,3))*1.5;
    dest(:,:,2) = abs(source(:,:,2) - source(:,:,3) - dest(:,:,1))*1.5;
    dest(:,:,3) = abs(source(:,:,3) - dest(:,:,1) - dest(:,:,2))*1.5;
    
     dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

