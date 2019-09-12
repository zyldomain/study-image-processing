function [ dest ] = SobolPrewittEdge( S, P, DX, DY, source )
    %SOBOLPREWITTEDGE 此处显示有关此函数的摘要
    %   此处显示详细说明
    [height width dimension] = size(source);
    
    coefficient = 1;
    if S == 1
        coefficient = 2;
    end
    
    for row=1:1:height
        for col=1:1:width
            tr = 0.0;
            tg = 0.0;
            tb = 0.0;
            %不同的方向
            if DX == 1
                subrow = row - 1;
                subcol = col - 1;
                addrow = row + 1;
                addcol = col + 1;
                if subrow < 1
                    subrow = height;
                end
                
                if subcol < 1
                    subcol = width;
                end
                
                if addrow > height
                    addrow = 1;
                end
                
                if addcol > width
                    addcol = 1;
                end
                
                rgb2 = [source(subrow,addcol, 1) source(subrow,addcol, 2) source(subrow,addcol, 3)];
                rgb3 = [source(row,addcol, 1) source(row,addcol, 2) source(row,addcol, 3)];
                rgb4 = [source(addrow,addcol,1) source(addrow,addcol, 2) source(addrow,addcol, 3)];
                
                
                rgb0 = [source(subrow,subcol, 1) source(subrow,subcol, 2) source(subrow,subcol, 3)];
                rgb7 = [source(row,subcol, 1) source( row,subcol,2) source(row,subcol, 3)];
                rgb6 = [source(addrow,subcol, 1) source(addrow,subcol, 2) source(addrow,subcol, 3)];
                
                tr = (rgb2(1) + coefficient * rgb3(1) + rgb4(1)) - (rgb0(1) + coefficient * rgb7(1) + rgb6(1));
                tg = (rgb2(2) + coefficient * rgb3(2) + rgb4(2)) - (rgb0(2) + coefficient * rgb7(2) + rgb6(2));
                tb = (rgb2(3) + coefficient * rgb3(3) + rgb4(3)) - (rgb0(3) + coefficient * rgb7(3) + rgb6(3));
                
            else
                subrow = row - 1;
                subcol = col - 1;
                addrow = row + 1;
                addcol = col + 1;
                if subrow < 1
                    subrow = height;
                end
                
                if subcol < 1
                    subcol = width;
                end
                
                if addrow > height
                    addrow = 1;
                end
                
                if addcol > width
                    addcol = 1;
                end
                
                rgb6 = [source(addrow,subcol, 1) source(addrow,subcol, 2) source(addrow,subcol, 3)];
                rgb5 = [source(addrow,col, 1) source( addrow,col,2) source(addrow,col, 3)];
                rgb4 = [source(addrow,addcol, 1) source(addrow,addcol, 2) source(addrow,addcol, 3)];
                
                rgb0 = [source(subrow,subcol, 1) source(subrow,subcol, 2) source(subrow,subcol, 3)];
                rgb1 = [source(addrow,col, 1) source(addrow,col, 2) source(addrow,col, 3)];
                rgb2 = [source(subrow,addcol, 1) source( subrow,addcol,2) source(subrow,addcol, 3)];
                
                tr = (rgb6(1) + coefficient * rgb5(1) + rgb4(1)) - (rgb0(1) + coefficient * rgb1(1) + rgb2(1));
                tg = (rgb6(2) + coefficient * rgb5(2) + rgb4(2)) - (rgb0(2) + coefficient * rgb1(2) + rgb2(2));
                tb = (rgb6(3) + coefficient * rgb5(3) + rgb4(3)) - (rgb0(3) + coefficient * rgb1(3) + rgb2(3));
            end
            dest(row,col,1) = tr;
            dest(row,col,2) = tg;
            dest(row,col,3) = tb;
        end
    end
    dest = uint8(dest);
end

