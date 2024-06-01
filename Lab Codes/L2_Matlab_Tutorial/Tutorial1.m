%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introducing Matlab (adapted from http://www.cns.nyu.edu/~eero and
% http://www.cs.dartmouth.edu/~farid/teaching/cs88/matlab.intro.html)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (1) Help and basics

% The symbol "%" is used in front of a comment.

% To get help type "help" (will give list of help topics) or "help topic"

% If you don't know the exact name of the topic or command you are looking for,
% type "lookfor keyword" (e.g., "lookfor regression")

% When writing a long matlab statement that exceeds a single row use ...
% to continue statement to next row.

% When using the command line, a ";" at the end means matlab will not
% display the result. If ";" is omitted then matlab will display result.

% Use the up-arrow to recall commands without retyping them (and down
% arrow to go forward in commands).  

% Other commands borrowed from emacs and/or tcsh:
% C-a moves to beginning of line (C-e for end), C-f moves forward a
% character (C-b moves back), C-d deletes a character, C-k deletes 
% the line to the right of the cursor, C-p goes back through the
% command history and C-n goes forward (equivalent to up and down arrows),
% tab command completion.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (2) Objects in matlab -- the basic objects in matlab are scalars,
% vectors, and matrices...
close all;
clear all;

N	= 5                 % a scalar
v 	= [1 0 0]			% a row vector
v 	= [1;2;3]			% a column vector
v 	= v'				% transpose a vector (row to column or column to row)
v	= [1:.5:3]			% a vector in a specified range: 
v	= pi*[-4:4]/4		% [start:end] or [start:stepsize:end]
v	= []				% empty vector


m 	= [1 2 3; 4 5 6]	% a matrix: 1ST parameter is ROWS
                        %2ND parameter is COLS 
m	= zeros(2,3)   		% a matrix of zeros
v	= ones(1,3)  		% a matrix of ones
m	= eye(3)            % identity matrix
v	= rand(3,1)         % random matrix with values in [0,1] (see also randn)

load  -ASCII matrix_data 			% read data from a file:
					% create a file 'matrix_data' containing:
					% 	2     3     4
					% 	5     6     7
					% 	1     2     3
matrix_data


v	= [1 2 3];			% access a vector element
v(3)					%	vector(number) 
					% Index starts from 1


m 	= [1 2 3; 4 5 6]
m(1,3)					% access a matrix element
                        % matrix(rownumber, columnnumber)
m(2,:)    				% access a matrix row (2nd row)
m(:,1)    				% access a matrix column (1st row)


size(m)					% size of a matrix
size(m,1)  				% number rows
size(m,2)  				% number of columns

m1	= zeros(size(m))		% create a new matrix with size of m

who					% list of variables
whos				% list/size/type of variables