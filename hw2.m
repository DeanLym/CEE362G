clear all
close all

N_1=20;
N_2=200;
N_3=2000;

[H1,y1,s1]=shaw(N_1);
[H2,y2,s2]=shaw(N_2);
[H3,y3,s3]=shaw(N_3);


[~,spec1,~] = svd(H1);
[~,spec2,~] = svd(H2);
[~,spec3,~] = svd(H3);
spec1 = diag(spec1);
spec2 = diag(spec2);
spec3 = diag(spec3);

figure(21);
subplot(1,3,1);
plot((1:N_1)',log(spec1));

subplot(1,3,2);
plot((1:N_2)',log(spec2));

subplot(1,3,3);
plot((1:N_3)',log(spec3));


spec1=eig(H1);
spec2=eig(H2);
spec3=eig(H3);

bin=20;
figure(1);
hist(spec1,bin);
figure(2);
hist(spec2,bin);
figure(3);
hist(spec3,bin);