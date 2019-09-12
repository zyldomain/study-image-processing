function [ dest ] = Halftone(threshold, source )
    %HALFTONE 此处显示有关此函数的摘要
    %   此处显示详细说明
    error_dist = [0,0.2,0;0.6,0.1,0.1];
    
    [height width dimension] = size(source);
    
    [drow dcol] = size(error_dist);
    %总的错误
    eg = 0;
    %转移到下个像素点的错误分数
    ep = 0;
    
    for row=1:1:height
        for col=1:1:width
            tp = source(row, col,1) + ep;
            if tp > threshold
                dest(row, col, 1) = -1;
                eg = tp - 2 * threshold;
            else
                dest(row, col, 1) = hex2dec('ff000000');
                eg = threshold;
            end
            
            %错误扩散
            for sr=1:1:drow
                nrow = sr + row;
                if nrow > height
                    nrow = 1;
                end
                for sc=1:1:dcol
                    ncol = sc + col;
                    if ncol > width
                        ncol = 1;
                    end
                    p = source(nrow, ncol, 1) + eg * error_dist(sr,sc);
                    source(nrow, ncol, 1) = p;
                end
            end
        end
    end
    dest = uint8(dest);
end

