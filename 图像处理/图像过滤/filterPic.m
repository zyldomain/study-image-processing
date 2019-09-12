function [ dest ] = filterPic( source )
    %Í¼Ïñ¹ýÂË
    Rsum = sum(source(:,1) * source(:,1));
    Rmin = min(source(:,1));
    Rmax = max(source(:,1));
    Rmean = mean(source(:,1));
    
    dest(:,1) = source(:,1);
    dest(:,2) = source(:,1);
    dest(:,3) = source(:,1);
    [width height dimension] = size(source);
    total = width * height;
end

