function [ dest ] = Robot( A, B, source )
%ROBOT 此处显示有关此函数的摘要
%   此处显示详细说明
    [height width dimension] = size(source);
    if A == 1
        %使用A算子
        for i=1:1:height
            for j=1:1:width
                nexti = i + 1;
                nextj = j + 1;
                if nexti > height
                    nexti = 1;
                end
                if nextj > width 
                    nextj = 1;
                end
                r = source(i,j,1) - source(nexti, nextj, 1);
                g = source(i,j,2) - source(nexti, nextj, 2);
                b = source(i,j,3) - source(nexti, nextj, 3);
                dest(i,j,1) = r;
                dest(i,j,2) = g;
                dest(i,j,3) = b;
            end
        end
    else
        %使用B算子
        for i=1:1:height
            for j=1:1:width
                nexti = i + 1;
                nextj = j + 1;
                if nexti > height
                    nexti = 0;
                end
                if nextj > width 
                    nextj = 0;
                end
                r = source(nexti,j,1) - source(i, nextj, 1);
                g = source(nexti,j,2) - source(i, nextj, 2);
                b = source(nexti,j,3) - source(i, nextj, 3);
                dest(i,j,1) = r;
                dest(i,j,2) = g;
                dest(i,j,3) = b;
            end
        end
    end
dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    dest = uint8(dest);
end

