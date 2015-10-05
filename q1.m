function [] = q1()
n = 100;
H = shaw(n);
t = linspace(-pi/2,pi/2,n)';
%% Example 1 linear
s = t;
y = H*s;
%
figure(11);
% subplot(1,4,[1,2]);
hold on;
plot(t,y);
plot(t,s,'r');
legend('y(t)','s(t)');
xlabel('t');
ylabel('s(t) or y(t)');
title('s(t)=t');
%
% subplot(1,4,3);
% imagesc(s);
% colorbar;
% caxis([0 2]);
% set(gca, 'XTick', []);
%
% subplot(1,4,4);
% imagesc(y);
% colorbar;
% caxis([0 2]);
% set(gca, 'XTick', []);
%% Example 2 random
s = rand(1,n)';
y = H*s;
%
figure(12);
% subplot(1,4,[1,2]);
hold on;
plot(t,y);
plot(t,s,'r');
legend('y(t)','s(t)');
xlabel('t');
ylabel('s(t) or y(t)');
title('s(t)=rand(1,100)');
%
% subplot(1,4,3);
% imagesc(s);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
% %
% subplot(1,4,4);
% imagesc(y);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
%% Example 3 sin
s = sin(2*t);
y = H*s;
%
figure(13);
% subplot(1,4,[1,2]);
hold on;
plot(t,y);
plot(t,s,'r');
legend('y(t)','s(t)');
xlabel('t');
ylabel('s(t) or y(t)');
title('s(t)=sin(2t)');
%
% subplot(1,4,3);
% imagesc(s);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
% %
% subplot(1,4,4);
% imagesc(y);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
%% Example 4 cos
s = cos(t);
y = H*s;
%
figure(4);
% subplot(1,4,[1,2]);
hold on;
plot(t,y);
plot(t,s,'r');
legend('y(t)','s(t)');
xlabel('t');
ylabel('s(t) or y(t)');
title('s(t)=-cos(t)');
%
% subplot(1,4,3);
% imagesc(s);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
% %
% subplot(1,4,4);
% imagesc(y);
% colorbar;
% caxis([0 2.5]);
% set(gca, 'XTick', []);
end