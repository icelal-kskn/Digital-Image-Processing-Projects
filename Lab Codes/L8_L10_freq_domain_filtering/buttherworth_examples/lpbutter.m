clear all;
clc;
close all;

D = 5;
x = 0:0.01:2*D;

for n=1:2:6
    for i=1:size(x,2)
        y(i) = 1/(1+(x(i)/D)^(2*n));
    end
    n
    subplot(3,2,n);
    plot(x,y,'LineWidth',2);
    title(strcat('D = ', num2str(D), ', n = ', num2str(n)));
    axis square;

    F = zeros(64);
    c = [size(F,1)/2 size(F,2)/2];
    for i=1:size(F,1)
        for j=1:size(F,2)
            d = sqrt((i-c(1))^2 + (j-c(2))^2);
            F(i,j) = 1/(1+(d/D)^(2*n));
        end
    end
    subplot(3,2,n+1);
    imshow(F);
end
