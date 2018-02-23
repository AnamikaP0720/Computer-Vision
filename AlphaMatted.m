clc;
clear all;
Img1=imread('back.png');
Img1=im2double(Img1);
imshow(Img1);title('Background Image');
Img2=imread('fore.png');
Img2=im2double(Img2);
figure;imshow(Img2);title('Foreground Image');

[r,c,l]=size(Img1);
C=r/2;

alph1(r,c)=zeros();
for i=1:r
    for j=1:c
        dist=sqrt(((C-i)^2)+((C-j)^2));
        if(dist<(C/2))
            alph1(i,j)=1;
        elseif(dist>C)
            alph1(i,j)=0;
        else
            alph1(i,j)=(C-dist)/100;
        end
    end
end
figure;imshow(alph1);title('Alpha Image');

Comp(r,c,l)=zeros();
for k=1:l
        Comp(:,:,k)=(((1-alph1).*Img1(:,:,k))+(alph1.*Img2(:,:,k)));
end

figure;imshow(Comp);title('Alpha Matted Image');
