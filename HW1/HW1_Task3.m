% Task 3 - Basic Image Processing in Octave

% Load the original RGB image
originalImage = imread('./images/lighthouse.png');

% Display the original RGB image
subplot(2, 2, 1);
imshow(originalImage);
title('Original RGB Image');

% Convert the original RGB image to grayscale
grayImage = rgb2gray(originalImage);

% Display the grayscale image
subplot(2, 2, 2);
imshow(grayImage);
title('Grayscale Image');

% Load the image package
pkg load image

% Rotate the original RGB image
rotatedImage = imrotate(originalImage, 45);

% Display the rotated image
subplot(2, 2, 3);
imshow(rotatedImage);
title('Rotated Image');

% Display the histogram of the grayscale image
subplot(2, 2, 4);
imhist(grayImage);
title('Histogram of Grayscale Image');

