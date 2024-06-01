clearvars, close all, clc;

I=imread('images/noiseball.png');
imshow(I), title('Original image')

%Determine good padding for Fourier transform
PQ = paddedsize(size(I));

%Create a bandreject filter
D0 = 0.2*PQ(1);
H = bandreject('ideal', PQ(1), PQ(2), D0, 30);
figure,imshow(fftshift(H)), title('Filter in the frequency domain');

% Calculate the discrete Fourier transform of the image
F=fft2(double(I),size(H,1),size(H,2));

% Apply the filter to the Fourier spectrum of the image
BRFS_I = H.*F;

% convert the result to the spatial domain.
BRF_I=real(ifft2(BRFS_I)); 

% Crop the image to undo padding
BRF_I=BRF_I(1:size(I,1), 1:size(I,2));

%Display the filtered image
figure, imshow(BRF_I,[]), title('Filtered image')

% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(BRFS_I);
% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));

figure,imshow(S1,[]), title('Fourier spectrum of the original image');
figure, imshow(S2,[]), title('Fourier spectrum of the filtered image');