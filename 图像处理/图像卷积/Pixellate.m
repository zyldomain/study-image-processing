function [ dest ] = Pixellate(times, source )
%PIXELLATE 此处显示有关此函数的摘要
%   此处显示详细说明

    [height width dimension] = size(source);
    
    for i=1:times:height
        for j=1:times:width
            %获取第一个像素的值
            sumr = (0);
            sumg = (0);
            sumb = (0);
            count = (0);
            for p=i:1:i+times-1
                for q=j:1:j+times-1
                    if p > height || q > width
                        break;
                    end
                    sumr = sumr + double(source(p,q,1));
                    sumg = sumg + double(source(p,q,2));
                    sumb = sumb + double(source(p,q,3));
                    count = count + 1;
                end
            end
            
            sumr = sumr / count;
            sumg = sumg / count;
            sumb = sumb / count;
            
             for p=i:1:i+times-1
                for q=j:1:j+times-1
                    if p > height || q > width
                        break;
                    end
                    dest(p,q,1) = sumr;
                    dest(p,q,2) = sumg;
                    dest(p,q,3) = sumb;
                end
            end
        end
    end
    dest = uint8(dest);

end

