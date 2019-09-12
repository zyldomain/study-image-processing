function [ XDest ] = caculatorDest(r,r1,r2,r3,src )
%进行新的rgb处理
    [x y z] = size(src);
    for i = 1:1:x
        for j = 1:1:y
            noise = rand();
            dest = double(src(i,j,1)) * r1 + double(src(i,j,2)) * r2 + double(src(i,j,3)) * r3;
            temp = uint16(noise * dest + (1.0 - noise) * src(i,j,r));
            if temp < 0
                temp = 0;
            elseif temp > 255
                temp = 255;
            end
            XDest(i,j) = temp;
        end
    end
    

end

