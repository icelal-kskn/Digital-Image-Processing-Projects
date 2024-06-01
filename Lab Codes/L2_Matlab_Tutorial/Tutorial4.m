%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(6) Creating functions using m-files:
% Functions in matlab are written in m-files. Create a file called 
% 'thres.m' In this file put the following 4 lines:

% function u = thres( v )
% u	= zeros( size(v) );		% initialize
% ind	= find( v>0 )			% index into >0 elements 
% u(ind)	= v( ind )			
% 
% 
% 
% v	= [3 5 -2 5 -1 0]
% x = thres( v )				% call from command line