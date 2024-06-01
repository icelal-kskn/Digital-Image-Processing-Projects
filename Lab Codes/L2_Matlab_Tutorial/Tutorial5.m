%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(7) Plotting 

close all;
clear all;

x	= [0 1 2 3 4];			% basic plotting
plot( x, 2*x );
axis( [0 8 0 8] );
figure;
plot( x );
figure;

x 	= pi*[-24:24]/24;
plot( x, sin(x) );
xlabel( 'radians' );
ylabel( 'sin value' );
title( 'dummy' );
gtext( 'put cursor where you want text and press mouse' );

figure;					% multiple functions in separate graphs
subplot( 1,2,1 );
plot( x, sin(x) );
axis square;
subplot( 1,2,2 );
plot( x, 2.*cos(x) );
axis square;

figure;					% multiple functions in single graph
plot( x,sin(x) );
hold on;              			% hold on tells matlab to write on top 
plot (x, 2.*cos(x), '--' );		% of the current plot
legend( 'sin', 'cos' );
hold off;

figure;					% matrices as images
m = rand(64,64);
imagesc(m)
colormap gray;
axis image
axis off;