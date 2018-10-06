RGB = imread('demo.jpg');
% imshow(RGB);
% pause;

R=RGB(:,:,1); G=RGB(:,:,2); B=RGB(:,:,3);

% grayscale_image = rgb2gray(RGB);
% imshow(grayscale_image);
% pause;

down_R = im2double(imresize(R, [128, 128]));
down_G = im2double(imresize(G, [128, 128]));
down_B = im2double(imresize(B, [128, 128]));

N=128;
%down_gray = phantom([0.5, 0.3], [0.2, 0.4], [0.2, 0.4], [0.1, 0.3], N);
%imshow(down_gray);
% pause;

Radon_R = zeros(2*N, N);
a = 20;
b = 50;

for i=0:2*N-1
    for j=0:N-1
        Radon_R(i+1, j+1) = Radon(down_R, (i-N)/N, j*pi/N, N);
         %if(j>a && j <b)
         %   Radon_R(i+1, j+1) = 0;
         %end
    end
end
filtered_R = Hfilter(Radon_R, N);


Radon_G = zeros(2*N, N);

for i=0:2*N-1
    for j=0:N-1
        Radon_G(i+1, j+1) = Radon(down_G, (i-N)/N, j*pi/N, N);
         %if(j>a && j <b)
            %Radon_G(i+1, j+1) = 0;
        %end
    end
end
filtered_G = Hfilter(Radon_G, N);


Radon_B = zeros(2*N, N);

for i=0:2*N-1
    for j=0:N-1
        Radon_B(i+1, j+1) = Radon(down_B, (i-N)/N, j*pi/N, N);
        %if(j>a && j <b)
        %    Radon_B(i+1, j+1) = 0;
        %end
    end
end
filtered_B = Hfilter(Radon_B, N);
% imshow(atan(20*Radon_t)*2/pi);
% pause;

figure;
imshow(filtered_R);
figure;
imshow(filtered_G);
figure;
imshow(filtered_B);
% pause;

Backproj = zeros(N,N, 3);

Backproj(:, :, 1) = Backprojection(filtered_R, N);
Backproj(:, :, 2) = Backprojection(filtered_G, N);
Backproj(:, :, 3) = Backprojection(filtered_B, N);
figure;
imshow(Backproj/(3));