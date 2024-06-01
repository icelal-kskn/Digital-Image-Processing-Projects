%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(5) Relations and control statements

% Example: given a vector v, create a new vector with values equal to
% v if they are greater than 0, and equal to 0 if they less than or
% equal to 0.

close all;
clear all;


v	= [3 5 -2 5 -1 0]		% 1: FOR LOOPS
u 	= zeros( size(v) );		% initialize
for i = 1:size(v,2)			% size(v,2) is the number of columns
	if( v(i) > 0 )
		u(i) = v(i); 
	end
end
u

v	= [3 5 -2 5 -1 0]		% 2: NO FOR LOOPS
u2	= zeros( size(v) );		% initialize
ind	= find( v>0 )			% index into >0 elements 
u2(ind)	= v( ind )			
