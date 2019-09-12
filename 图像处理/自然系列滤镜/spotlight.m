function [ dest ] = spotlight( source )
    %¾Û¹âµÆ
    [width height dimension] = size(source);
    maxDistance = sqrt(double(width * width + height * height) / 4.0);
    for i=1:1:width
        for j=1:1:height
            scale = 1.0 - sqrt(double((i - width/2.0) * (i - width/2.0) + (j - height/2.0) * (j - height/2.0) )) / maxDistance;
            dest(i,j,1) = scale * source(i,j,1);
            dest(i,j,2) = scale * source(i,j,2);
            dest(i,j,3) = scale * source(i,j,3);
        end
    end
    
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

