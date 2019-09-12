function [ dest ] = PixelReplaceZoom(times, source )
    %像素替换放大
    [width height dimension] = size(source);
    dest(width*times, height*times, dimension) = 0;
    for i=1:1:width
        for j=1:1:height
            %横向放大
            indexi = (i - 1) * times + 1;
            indexj = (j - 1) * times + 1;
            dest(indexi:1:indexi+times-1,indexj:1:indexj+times-1,1) = source(i,j,1);
            dest(indexi:1:indexi+times-1,indexj:1:indexj+times-1,2) = source(i,j,2);
            dest(indexi:1:indexi+times-1,indexj:1:indexj+times-1,3) = source(i,j,3);
        end
    end
    dest = uint8(dest);

end

