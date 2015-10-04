function [] = q1()
n = 100;
[A,b,x] = shaw(100);
%% Example 1 from shaw.m
figure(1);
subplot(1,4,[1,2]);
hold on;
plot(1:n',b);
plot(1:n',x,'r');
subplot(1,4,3);
imagesc(x);
colorbar;
caxis([0 4]);
subplot(1,4,4);
imagesc(b);
colorbar;
caxis([0 4]);
%% Example 2 linear image
x = linspace(0,1,n)';
b = A*x;
figure(2);
subplot(1,4,[1,2]);
hold on;
plot(1:n',b);
plot(1:n',x,'r');
subplot(1,4,3);
imagesc(x);
colorbar;
caxis([0 2.5]);
subplot(1,4,4);
imagesc(b);
colorbar;
caxis([0 2.5]);
%% Example 3 random image
x = rand(1,n)';
b = A*x;
figure(3);
subplot(1,4,[1,2]);
hold on;
plot(1:n',b);
plot(1:n',x,'r');
subplot(1,4,3);
imagesc(x);
colorbar;
caxis([0 2.5]);
subplot(1,4,4);
imagesc(b);
colorbar;
caxis([0 2.5]);
end