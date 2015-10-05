function [] = q6()
data = load('2015Assign1_1.txt');
t = data(:,1);
y = data(:,2);
% plot(s_true);
n=400;
std_v = 0.1;
var_s = var(y);
ind = 20;
l_s = pi/2;
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
plot(t,s1,'r');
plot(t,s2,'b');
plot(t,s3,'k');
plot(t,s4,'m');
plot(t,y,'--');
legend('Nugget','Linear','Exponential','Gaussian','y');
figure(62+ind);
hold on;
plot(t,diag(V1),'r');
plot(t,diag(V2),'b');
plot(t,diag(V3),'k');
plot(t,diag(V4),'m');
legend('Nugget','Linear','Exponential','Gaussian');
figure(63+ind);
hold on;
plot(t,s_pinv,'r-.');
plot(t,y,'--');
legend('Pseudo-inverse Solution','y');
%
figure(64+ind);
hold on;
plot(t,H*s1,'r');
plot(t,H*s2,'b');
plot(t,H*s3,'k');
plot(t,H*s4,'m');
plot(t,y,'--');
legend('Nugget','Linear','Exponential','Gaussian','y');
%% Question 7





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
