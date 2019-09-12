function [ HSL ] = RGB2HSL( RGB )
%RGB2HSL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% RGB�ռ�ת����HSL�ռ�       
        r=RGB(:,:,1);
        g=RGB(:,:,2);
        b=RGB(:,:,3);
        
        
        [m,n]=size(r);
        
        
        %% ?�� L ?%%
        maxcolor=max(max(r,g),b);
        mincolor=min(min(r,g),b);
        L=(maxcolor+mincolor)/2;
        
        
        H=zeros(m,n);
        S=zeros(m,n);
        
        
        %% ?�� S ?%%
        for i=1:m
            for j=1:n
                if maxcolor(i,j)==mincolor(i,j)
                    S(i,j)=0;
                else
                    if L(i,j)<=0.5
                        S(i,j)=(maxcolor(i,j)-mincolor(i,j))/(2*L(i,j));
                    else
                        S(i,j)=(maxcolor(i,j)-mincolor(i,j))/(2-2*L(i,j));
                    end
                end
            end
        end
        
        
        %% ?�� H ?%%
        for i=1:m
            for j=1:n
                if maxcolor(i,j)==mincolor(i,j)
                    H(i,j)=0;
                else if r(i,j)==maxcolor(i,j)
                        if g(i,j)>=b(i,j)
                            H(i,j)=60*(g(i,j)-b(i,j))/(maxcolor(i,j)-mincolor(i,j));
                        else
                            H(i,j)=60*(g(i,j)-b(i,j))/(maxcolor(i,j)-mincolor(i,j))+360;
                        end
                    else if g(i,j)==maxcolor(i,j)
                            H(i,j)=120+60*(b(i,j)-r(i,j))/(maxcolor(i,j)-mincolor(i,j));
                        else
                            H(i,j)=240+60*(r(i,j)-g(i,j))/(maxcolor(i,j)-mincolor(i,j));
                        end
                    end
                end
            end
        end
        
        
        %%
        HSL=uint8(cat(3,H,S,L));
        
        
    end

