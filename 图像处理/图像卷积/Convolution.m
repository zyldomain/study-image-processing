function [ dest ] = Convolution( source )
    %卷积核
    kernels=[1.0,1.0,1.0;1.0,1.0,1.0;1.0,1.0,1.0];
   [kerrow kercol kerdimension] = size(kernels);
  
   kernels=fliplr(kernels);
   kernels=flipud(kernels);
   %卷积核归一化
   kersum = sum(kernels);
  kernels = kernels / kersum(1,1);
   %开始二维卷积
   [height width dimension] = size(source);
   for i=1:1:height
       for j=1:1:width
           sumr = 0.0; sumg = 0.0; sumb = 0.0;
           corex = j; corey = i;
           
           for p=(corey - floor(kerrow / 2)):1:(corey + floor(kerrow / 2))
               for q=(corex - floor(kercol / 2)):1:(corex + floor(kercol / 2))
                   %去掉不符合条件的
                   if p < 1 || q < 1 || p > height || q > width
                       continue;
                   end
                   
                   %其他的相乘求和
                   keri = q - corex + 1 + floor(kercol / 2);
                   kerj = p - corey + 1 + floor(kerrow / 2);
                   sumr = sumr + source(p, q, 1) * kernels(kerj, keri);
                   sumg = sumg + source(p, q, 2) * kernels(kerj, keri);
                   sumb = sumb + source(p, q, 3) * kernels(kerj, keri);
               end
           end
           dest(i,j,1) = sumr;
           dest(i,j,2) = sumg;
           dest(i,j,3) = sumb;
       end
   end
   
   
   dest = uint8(dest);
end

