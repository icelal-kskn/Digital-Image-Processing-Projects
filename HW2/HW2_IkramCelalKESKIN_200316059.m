originalA = imread('./Original_Photos/A_original.png');
originalB = imread('./Original_Photos/B_original.png');
originalC = imread('./Original_Photos/C_original.png');
originalD = imread('./Original_Photos/D_original.png');
originalE = imread('./Original_Photos/E_original.png');
originalF = imread('./Original_Photos/F_original.png');

modifiedA = imread('./Modified_Photos/A_modified.png');
modifiedB = imread('./Modified_Photos/B_modified.png');
modifiedC = imread('./Modified_Photos/C_modified.png');
modifiedD = imread('./Modified_Photos/D_modified.png');
modifiedE = imread('./Modified_Photos/E_modified.png');
modifiedF = imread('./Modified_Photos/F_modified.png');


% A's operation
reproducedA = imcomplement(originalA);

figure, subplot(1,3,1), imshow(originalA), title('Original');
subplot(1,3,2), imshow(modifiedA),title('Modified')
subplot(1,3,3), imshow(reproducedA), title('Reproduced'); %display
% A' s process by tanken complement


%B's operation
reproducedB= histeq(originalB);

figure, subplot(1,3,1), imshow(originalB), title('Original');
subplot(1,3,2), imshow(modifiedB),title('Modified')
subplot(1,3,3), imshow(reproducedB), title('Reproduced'); %display
%B's operation is CLAHE but i did not find in octave




%C's operation
w=15; %size of blurring filter
f=fspecial('average',w); %create a blurring filter
reproducedC=imfilter(originalC,f); %blur the original image

figure, subplot(1,3,1), imshow(originalC), title('Original');
subplot(1,3,2), imshow(modifiedC),title('Modified')
subplot(1,3,3), imshow(reproducedC), title('Reproduced'); %display
%C's operation is blurring


%D's operation
f=[0.1667 0.6667 0.1667; 0.6667 -3.3333 0.6667; 0.1667 0.6667 0.1667]
Ilap=imfilter(originalD,f);
reproducedD=imsubtract(originalD,Ilap);

figure, subplot(1,3,1), imshow(originalD), title('Original');
subplot(1,3,2), imshow(modifiedD),title('Modified')
subplot(1,3,3), imshow(reproducedD , []), title('Reproduced'); %display
%D's operation is sharpening



%E's operation
reproducedE = ordfilt2(originalE,1,true(9));

figure, subplot(1,3,1), imshow(originalE), title('Original');
subplot(1,3,2), imshow(modifiedE),title('Modified')
subplot(1,3,3), imshow(reproducedE), title('Reproduced'); %display
%E's operation is Min filtered



%F's operation

reproducedF = zeros(size(originalF));
for i = 1:6
    bit_i = double(bitget(originalF,i));
    bit_i_shifted = bit_i * 2^(i-1);
    reproducedF = reproducedF + bit_i_shifted;
end

figure, subplot(1,3,1), imshow(originalF), title('Original');
subplot(1,3,2), imshow(modifiedF),title('Modified')
subplot(1,3,3), imshow(reproducedF,[]), title('Reproduced'); %display
%F's operation is bitplane slicing



