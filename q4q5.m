function [] = q4q5()
n = 200;
H = shaw(n);
t = linspace(-pi/2,pi/2,n)';
s = 2*exp(-6*(t-0.8).^2)+exp(-2*(t+0.5).^2);
y = H*s;
s_hat = pinv(H)*y;
figure(31);
hold on;
plot(t,s,'r','linewidth',2);
plot(t,s_hat,'bo','linewidth',2);
legend({'s(t)','$\hat{s}$(t)'})
set(legend,'Interpreter','latex')
xlabel('t','fontsize',18);
ylabel('s','fontsize',18);
%%
v = normrnd(0,1e-12,n,1);
y_noise = H*s + v;
s_hat_noise = pinv(H)*y_noise;
figure(41);
subplot(2,2,1);
hold on;

plot(t,s_hat_noise,'bo','linewidth',2);
plot(t,s,'r','linewidth',2);
legend({'$\hat{s}$(t)','s(t)'})
set(legend,'Interpreter','latex');
title('v~N(0,1e-12)','fontsize',18);
xlabel('t','fontsize',18);
ylabel('s','fontsize',18);
%
v = normrnd(0,5e-12,n,1);
y_noise = H*s + v;
s_hat_noise = pinv(H)*y_noise;
subplot(2,2,2);
hold on;
plot(t,s_hat_noise,'bo','linewidth',2);
plot(t,s,'r','linewidth',2);
legend({'$\hat{s}$(t)','s(t)'})
set(legend,'Interpreter','latex');
title('v~N(0,5e-12)','fontsize',18);
xlabel('t','fontsize',18);
ylabel('s','fontsize',18);
%
v = normrnd(0,1e-11,n,1);
y_noise = H*s + v;
s_hat_noise = pinv(H)*y_noise;
subplot(2,2,3);
hold on;
plot(t,s_hat_noise,'bo','linewidth',2);
plot(t,s,'r','linewidth',2);
legend({'$\hat{s}$(t)','s(t)'});
set(legend,'Interpreter','latex');
title('v~N(0,1e-11)','fontsize',18);
xlabel('t','fontsize',18);
ylabel('s','fontsize',18);
%
v = normrnd(0,5e-11,n,1);
y_noise = H*s + v;
s_hat_noise = pinv(H)*y_noise;
subplot(2,2,4);
hold on;
plot(t,s_hat_noise,'bo','linewidth',2);
plot(t,s,'r','linewidth',2);
legend({'$\hat{s}$(t)','s(t)'})
set(legend,'Interpreter','latex');
title('v~N(0,1e-12)','fontsize',18);
xlabel('t','fontsize',18);
ylabel('s','fontsize',18);


end