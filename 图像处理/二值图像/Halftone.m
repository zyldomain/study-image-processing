function [ dest ] = Halftone(threshold, source )
    %HALFTONE �˴���ʾ�йش˺�����ժҪ
    %   �˴���ʾ��ϸ˵��
    error_dist = [0,0.2,0;0.6,0.1,0.1];
    
    [height width dimension] = size(source);
    
    [drow dcol] = size(error_dist);
    %�ܵĴ���
    eg = 0;
    %ת�Ƶ��¸����ص�Ĵ������
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
            
            %������ɢ
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

