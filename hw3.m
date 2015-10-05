clear all
close all

N=200;
[H,y,s]=shaw(N);
[U,S,V_t]=svd(H);

V=V_t';

figure();
for (i=1:200)
    plot(V(:,i));
    
end
