%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (3) Simple operations on vectors and matrices

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (A) Pointwise (element by element) Operations:

close all;
clear all;

% addition of vectors/matrices and multiplication by a scalar
% are done "element by element"
a	= [1 2 3 4];		% vector
2 * a 					% scalar multiplication
a / 4					% scalar multiplication
b	= [5 6 7 8];		% vector
a + b					% pointwise vector addition
a - b					% pointwise vector addition
a .^ 2					% pointise vector squaring (note .)
a .* b					% pointwise vector multiply (note .)
a ./ b					% pointwise vector divide (note .)

log( [1 2 3 4] )			% pointwise arithmetic operation
round( [1.5 2; 2.2 3.1] )	% pointwise arithmetic operation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (B) Vector Operations (no for loops needed)
% Built-in matlab functions operate on vectors, if a matrix is given,
% then the function operates on each column of the matrix

a	= [1 4 6 3]			% vector
sum(a)					% sum of vector elements
mean(a)					% mean of vector elements
var(a)					% variance
std(a)					% standard deviation
max(a)					% maximum


a 	= [1 2 3; 4 5 6]		% matrix
a(:)                 			% vectorized version of the matrix
mean(a)                      		% mean of each column
max(a)                       		% max of each column    
max(max(a))		     		% to obtain max of matrix 
max(a(:))		     		% 	or...

%%%%%%%%%%%%%%%%%%%%%%%%
% (C) Matrix Operations:

[1 2 3] * [4 5 6]'  			% row vector 1x3 times column vector 3x1 
                    			% results in single number, also
                                % known as dot product or inner product

[1 2 3]' * [4 5 6]  			% column vector 3x1 times row vector 1x3
                    			% results in 3x3 matrix, also
                    			% known as outer product

a	= rand(3,2)			% 3x2 matrix
b	= rand(2,4)			% 2x4 matrix
c	= a * b				% 3x4 matrix

a	= [1 2; 3 4; 5 6]		% 3 x 2 matrix
b	= [5 6 7];			% 1 x 3 vector
b * a					% matrix multiply
a' * b'					% matrix multiply

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(4) Saving your work

save mysession      			% creates mysession.mat with all variables
save mysession a b  			% save only variables a and b

clear all                       % clear all variables
clear a b           			% clear variables a and b

load mysession                  % load session
a
b