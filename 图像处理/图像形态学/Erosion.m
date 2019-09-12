function [ dest ] = Erosion( source )
  %DILATION 此处显示有关此函数的摘要
    %   此处显示详细说明
    [height width dimension] = size(source);
    
    structureElements = [128,128,128;128,128,128;128,128,128];
    
    dest =  ones(height,width,dimension) * 255;
    
    [seh sew sed] = size(structureElements);
    
    coreh = floor(seh / 2) + 1;
    corew = floor(sew / 2) + 1;
    %膨胀
    for row=1:1:height
        for col=1:1:width
            flag = 0;
            for p=row-floor(seh / 2):1:row+floor(seh / 2)
                if flag == 1
                    break;
                end
                for q=col-floor(sew / 2):1:col+floor(sew / 2)
                    if p < 1 || q < 1 || p > height || q > width
                        continue;
                    end
                    
                    serow = p - row + 1 + floor(seh / 2);
                    secol = q - col + 1 + floor(sew / 2);
                    
   
                    g1 = source(p,q,1);
                    g2 = structureElements(serow,secol);
                    if g1 < 127
                        flag = 1;
                        break;
                    end
                end
            end
            if flag == 1
                dest(row, col, :) = 0;
            end
        end
    end
    dest = uint8(dest);

end



