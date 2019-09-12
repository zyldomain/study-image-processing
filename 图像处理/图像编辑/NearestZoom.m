function [ dest ] = NearestZoom(times, source )
    %临近点插值算法
    [x1 y1 z1] = size(source);
    x = round(x1 * times);
    y = round(y1 * times);
    dest(x, y, z1) = 0;
    for i=1:1:x
        for j=1:1:y
            indexi = round(i/times + 1); indexj = round(j/times + 1);
            if indexi > x1 
                indexi = x1;
            end
            if indexj > y1
                indexj = y1;
            end
            dest(i, j ,1 ) = source(indexi, indexj, 1);
            dest(i, j ,2 ) = source(indexi, indexj, 2);
            dest(i, j ,3 ) = source(indexi, indexj, 3);
        end
    end
    dest = uint8(dest);
end

