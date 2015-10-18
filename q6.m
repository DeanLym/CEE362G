function [] = q6()
close all;
data = load('2015Assign1_1.txt');
t = data(:,1);
y = data(:,2);
% plot(s_true);
n=400;
std_v = 0.1;
var_s = var(y);
% var_s = 1e-6;
ind = 20;
l_s = pi*5;
H = shaw(n); 
X = ones(n,1);
%% case 1 Nugget Effect
R = std_v*eye(n);
Q = var_s*eye(n);
[s1,V1,lamda1,mu1] = GenLinInv(y,H,R,X,Q);
% plotresult(t,s,s_true,61);
%% case 2 Linear Covariance
R = std_v*eye(n);
Q = linearQ(n,t,var_s,l_s);
[s2,V2,lamda2,mu2] = GenLinInv(y,H,R,X,Q);
%% case 3 Exponential Covariance
% R = std_v*eye(n);
Q = ExponentialCov(n,t,var_s,l_s);
[s3,V3,lamda3,mu3] = GenLinInv(y,H,R,X,Q);
%% case 4 Gaussian Covariance
% R = std_v*eye(n);
Q = gaussianQ(n,t,var_s,l_s);
[s4,V4,lamda4,mu4] = GenLinInv(y,H,R,X,Q);
%% case 5 pinv solution
s_pinv = pinv(H)*y;

figure(61+ind);
hold on;
plot(t,s1,'r','linewidth',2);
plot(t,s2,'b','linewidth',2);
plot(t,s3,'k','linewidth',2);
plot(t,s4,'m-.','linewidth',2);
plot(t,y,'--','linewidth',2);
legend('$\hat{s}$(t) Nugget Covariance','$\hat{s}$(t) Linear Covariance',...
    '$\hat{s}$(t) Exponential Covariance','$\hat{s}$(t) Gaussian Covariance','y(t)',...
    'Location','NorthEastOutside');
set(legend,'Interpreter','latex');
set(legend,'Fontsize',12);
set(legend,'Fontname','Times New Roman');
figure(62+ind);
hold on;
plot(t,diag(V1),'r','linewidth',2);
plot(t,diag(V2),'b','linewidth',2);
plot(t,diag(V3),'k','linewidth',2);
plot(t,diag(V4),'m-.','linewidth',2);
legend('Std Nugget Covariance','Std Linear Covariance',...
    'Std Exponential Covariance','Std Gaussian Covariance',...
    'Location','NorthEastOutside');
set(legend,'Interpreter','latex');
set(legend,'Fontsize',12);
set(legend,'Fontname','Times New Roman');
figure(63+ind);
hold on;
plot(t,s_pinv,'r-.','linewidth',2);
plot(t,y,'--','linewidth',2);
legend('$\hat{s}$(t) Pseudo-inverse','y(t)');
set(legend,'Interpreter','latex');
set(legend,'Fontsize',12);
set(legend,'Fontname','Times New Roman');
%
figure(64+ind);
hold on;
plot(t,H*s1,'r','linewidth',2);
plot(t,H*s2,'b','linewidth',2);
plot(t,H*s3,'k','linewidth',2);
plot(t,H*s4,'m','linewidth',2);
plot(t(1:10:end),y(1:10:end),'o','linewidth',2);
legend('$\hat{y}$(t) Nugget Covariance','$\hat{y}$(t) Linear Covariance',...
    '$\hat{y}$(t) Exponential Covariance','$\hat{y}$(t)Gaussian Covariance','y(t)',...
        'Location','NorthEastOutside');
set(legend,'Interpreter','latex');
set(legend,'Fontsize',12);
set(legend,'Fontname','Times New Roman');
%% Question 7
nr=10;
s_c = zeros(n,nr);
figure(65+ind);
% title('Conditional realizations of $\hat{s}$(t)','Interpreter','latex','Fontsize',12,'Fontname','Times New Roman');
hold on;
Q = ExponentialCov(n,t,var_s,l_s);
% Q = gaussianQ(n,t,var_s,l_s);
lamda = lamda4;
for i=1:nr
v_u = simv(R);
s_u = simvm2(1,Q,X);
s_c(:,i) = s_u + lamda*(y+v_u-H*s_u);
subplot(2,5,i);
hold on;
plot(t,s_c(:,i));
plot(t,s3,'r');
ylim([-3,3]);
end

figure(66+ind);
hold on;
for i=1:nr

subplot(2,5,i);
hold on;
plot(t,H*s_c(:,i));
plot(t,y,'r');
% ylim([-3,3]);
end


end


function [] = plotresult(s)
% ind figure number
figure(ind);
hold on;
plot(t,s,'bo');
plot(t,s_true,'r-','linewidth',2);

end

function Q = ExponentialCov(n,t,v,l)

h = abs(repmat(t,1,n) - repmat(t',n,1));
Q = v*exp(-h/l);

end


function Q=linearQ(n,x,var,l)

theta = var/l;
h=abs(repmat(x,1,n)-repmat(x',n,1));
Q=-theta * h;

end

function Q=gaussianQ(n,x,var,L)

h=abs(repmat(x,1,n)-repmat(x',n,1));
Q=var*exp(-(h.^2/L^2));

end

function Q=smoothCov(n,t)

h = abs(repmat(t,1,n) - repmat(t',n,1));
Q = h.^3;

end
