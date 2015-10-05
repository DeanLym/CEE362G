clear all
close all

N=200;
[H,y,s]=shaw(N);
[U,S,V]=svd(H);

figure();

for (i=1:30)
    subplot(5,6,i);
    plot(V(:,i));

end
