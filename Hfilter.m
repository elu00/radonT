function filtered = Hfilter(sinogram, N)

fourier = fft(sinogram);
size(fourier)

y = [1:1:2*N]'*ones(1,N);

hilbert = fourier.*min(2*N-y, y);

filtered = ifft(hilbert);

end