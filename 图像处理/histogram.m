function [ dest ] = histogram( gray )
    [x y] = size(gray);
    dest(255)=0;
    for i=1:1:x
        for j=1:1:y
            dest(gray(i,j)) = dest(gray(i,j)) + 1;
        end
    end

end

