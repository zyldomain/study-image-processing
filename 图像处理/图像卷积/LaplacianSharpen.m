function [ dest ] = LaplacianSharpen( source )
    %LAPLACIANSHARPEN 此处显示有关此函数的摘要
    %   此   处显示详细说明
    kernels = [-1,-1,-1;-1,8,-1;-1,-1,-1];
    [height width dimension] = size(source);
    [y x z] = size(kernels);
    dest(y,x,z) = 0;
    center = floor(x/2) + 1;
    
    for i=1:1:height
        for j=1:1:width
            sumr = 0.0;
            sumg = 0.0;
            sumb = 0.0;
            corey = i;
            corex = j;
            for p=corey-floor(x/2) : 1 : corey+floor(x/2)
                for q=corex-floor(x/2) : 1 : corex+floor(x/2)
                    if p < 1 || q < 1 || p > height || q > width
                        continue;
                    end
                    keri = q - corex + 1 + floor(x / 2);
                    kerj = p - corey + 1 + floor(x / 2);
                    sumr = sumr + double(source(p, q, 1)) * kernels(kerj, keri);
                    sumg = sumg + double(source(p, q, 2)) * kernels(kerj, keri);
                    sumb = sumb + double(source(p, q, 3)) * kernels(kerj, keri);
                end
            end
            
            dest(i,j,1) = sumr / (x * x);
            dest(i,j,2) = sumg / (x * x);
            dest(i,j,3) = sumb / (x * x);
        end
    end
    
    %修正像素值
    minr = 255;
    ming = 255;
    minb = 255;
    
    for i=1:1:height
        for j=1:1:width
           if minr > dest(i,j,1)
               minr = dest(i,j,1);
           end
           if ming > dest(i,j,2)
              ming = dest(i,j,2);
           end
           if minb > dest(i,j,3)
               minb = dest(i,j,3);
           end
        end
    end

    dest(:,:,1) = dest(:,:,1) - minr;
    dest(:,:,2) = dest(:,:,2) - ming;
    dest(:,:,3) = dest(:,:,3) - minb;
    
    maxr = 0;
    maxg = 0;
    maxb = 0;
    
    for i=1:1:height
        for j=1:1:width
           if maxr < dest(i,j,1)
               maxr = dest(i,j,1);
           end
           if maxg < dest(i,j,2)
              maxg = dest(i,j,2);
           end
           if maxb < dest(i,j,3)
               maxb = dest(i,j,3);
           end
        end
    end
   
    dest(:,:,1) = dest(:,:,1) * (255.0 / maxr);
    dest(:,:,2) = dest(:,:,2) * (255.0 / maxg);
    dest(:,:,3) = dest(:,:,3) * (255.0 / maxb);
    
    

    %将拉普拉斯结果与原来像素值叠加
    dest(:,:,1) = dest(:,:,1) + double(source(:,:,1));
    dest(:,:,2) = dest(:,:,2) + double(source(:,:,2));
    dest(:,:,3) = dest(:,:,3) + double(source(:,:,3));
    
    %修正像素值
     minr = 255;
    ming = 255;
    minb = 255;
    
    for i=1:1:height
        for j=1:1:width
           if minr > dest(i,j,1)
               minr = dest(i,j,1);
           end
           if ming > dest(i,j,2)
              ming = dest(i,j,2);
           end
           if minb > dest(i,j,3)
               minb = dest(i,j,3);
           end
        end
    end
    
    dest(:,:,1) = dest(:,:,1) - minr;
    dest(:,:,2) = dest(:,:,2) - ming;
    dest(:,:,3) = dest(:,:,3) - minb;
    
    maxr = 0;
    maxg = 0;
    maxb = 0;
    
    for i=1:1:height
        for j=1:1:width
           if maxr < dest(i,j,1)
               maxr = dest(i,j,1);
           end
           if maxg < dest(i,j,2)
              maxg = dest(i,j,2);
           end
           if maxb < dest(i,j,3)
               maxb = dest(i,j,3);
           end
        end
    end
    
    dest(:,:,1) = dest(:,:,1) * (255.0 / maxr);
    dest(:,:,2) = dest(:,:,2) * (255.0 / maxg);
    dest(:,:,3) = dest(:,:,3) * (255.0 / maxb);
    
    %像素的直方图拉伸
    minp = 55;
    maxp = 200;
    dynamic = maxp- minp;
    
    dest(find(dest(:,:,:) >= maxp)) = 255;
    dest(find(dest(:,:,:) <= minp)) = 0;
    dest(find(dest(:,:,:) > minp & dest(:,:,:) < maxp)) = ((dest(find(dest(:,:,:) > minp & dest(:,:,:) < maxp)) - minp) / dynamic) * 255;
    dest = uint8(dest);
end

