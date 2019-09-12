function [ dest ] = Saturation(ration, source )
    %调整图片的饱和度
    hsv = rgb2hsv(source);
    sat = 0.1 * ration;
    [x y z] = size(source);
    
    for i = 1:1:x
        for j = 1:1:z
            hsv(i,:,j) = hsv(i,:,j) + sat;
        end
    end
    hsv(i,find(hsv(i,:,j) < 0),j) = 0;
    hsv(i,find(hsv(i,:,j) > 1),j) = 1;
    dest = uint8(hsv2rgb(hsv) * 255);

end

