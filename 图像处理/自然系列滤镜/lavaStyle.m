function [ dest ] = lavaStyle( source )
    %»€—“∑Á∏Ò
    gray = (source(:,:,1) + source(:,:,2) + source(:,:,3)) / 3;
    dest(:,:,1) = gray;
    dest(:,:,2) = abs(source(:,:,2) - 128);
    dest(:,:,3) = abs(source(:,:,2) - 128);
    
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

