function [ dest ] = GradientEdge( MX, MY, threshold )
    %GRADIENTEDGE 此处显示有关此函数的摘要
    %   此处显示详细说明
    [height width dimension] = size(MX);
    
    %计算图像梯度
    for row=1:1:height
        for col=1:1:width
            dest(row, col, 1) = sqrt(double(MX(row, col, 1)) * double(MX(row, col, 1)) + double(MY(row, col, 1)) * double(MY(row, col, 1)));
            dest(row, col, 2) = sqrt(double(MX(row, col, 2)) * double(MX(row, col, 2)) + double(MY(row, col, 2)) * double(MY(row, col, 2)));
            dest(row, col, 3) = sqrt(double(MX(row, col, 3)) * double(MX(row, col, 3)) + double(MY(row, col, 3)) * double(MY(row, col, 3)));
        end
    end
    
    dest(find(dest(:,:,:) < 0)) = 0;
    dest(find(dest(:,:,:) > 255)) = 255;
    
    %根据阈值细化边缘
    for row=1:1:height
        for col=1:1:width
            if dest(row, col ,1) < threshold || dest(row, col ,2) < threshold || dest(row, col ,3) < threshold 
                dest(row, col ,1) = 0;
                dest(row, col ,2) = 0;
                dest(row, col ,3) = 0;
            else
                dest(row, col ,1) = 255;
                dest(row, col ,2) = 255;
                dest(row, col ,3) = 255;
            end
        end
    end
    
    dest = uint8(dest);
end

