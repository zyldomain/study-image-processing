function [ dest ] = jiao( source, gray )
    %JIAO 此处显示有关此函数的摘要
    %   此处显示详细说明
    [height width dimension] = size(source);
    dest = ones(height, width) * 0;
    
    
     for row=1:1:height
        for col=1:1:width
            if source(row, col,1) > 127
                source(row,col ,1) = 0;
            else
                 source(row,col ,1) = 255;
            end
        end
     end
    
    for row=1:1:height
        for col=1:1:width
            if source(row, col, 1) == gray(row, col)
                dest(row, col) = 255;
            end
        end
    end
    
    dest=uint8( dest);

end

