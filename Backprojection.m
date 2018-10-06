function reconstructed_image_blur = Backprojection(sinogram, N)

%proj = zeros(200, 101);
%projline = zeros(200, 101);

%for i=1:200
%    for j=1:100
%        if sinogram(i, j) > 0
%            
%            t = (100-i)/101;
%            theta = j*2*pi/101;
%            
%            if a*cos(theta)+b*sin(theta)-t > -0.01
%                projline(a, b) = 1;
%
%            end
%            
%            proj = proj + projline;
%                
%        end
%    end
%end
%backproj = proj;
[x, y] = meshgrid(linspace(0, pi, N), linspace(0, 2*N-1, 2*N));

the = linspace(0, pi, N);

reconstructed_image_blur = zeros(N);

for i=1:N
    for j=1:N
        t_the = 2*(j-N/2)*cos(the)+2*(i-N/2)*sin(the)+N;
        reconstructed_image_blur(i, j) = sum(interp2(x, y, sinogram, the, t_the, 'linear',0))*pi/N;
    end
end

end