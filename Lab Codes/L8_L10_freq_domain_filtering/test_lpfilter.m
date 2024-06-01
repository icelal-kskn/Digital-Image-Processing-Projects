footBall=imread('images/football.jpg');

%Convert to grayscale
footBall=rgb2gray(footBall); 
subplot(3,2,1), imshow(footBall), title('Original image')

%Determine good padding for Fourier transform
PQ = paddedsize(size(footBall));

%Create a Lowpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);
H = lpfilter('ideal', PQ(1), PQ(2), D0);
%H = bandreject('ideal', PQ(1), PQ(2), D0, 20);

subplot(3,2,4),imshow(fftshift(H)), title('Filter in the frequency domain');

% Calculate the discrete Fourier transform of the image
F=fft2(double(footBall),size(H,1),size(H,2));

% Apply the filter to the Fourier spectrum of the image
LPFS_football = H.*F;

% convert the result to the spatial domain.
LPF_football=real(ifft2(LPFS_football)); 

% Crop the image to undo padding
LPF_football=LPF_football(1:size(footBall,1), 1:size(footBall,2));

%Display the filtered image
subplot(3,2,5), imshow(LPF_football,[]), title('Filtered image')

% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(LPFS_football);

% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));

subplot(3,2,2),imshow(S1,[]), title('Fourier spectrum of the original image');
subplot(3,2,6), imshow(S2, []), title('Fourier spectrum of the filtered image');