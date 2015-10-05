function [] = q4()
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
end