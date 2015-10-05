function [] = q6()
data = load('2015Assign1_1.txt');
s_true = data(:,1);
y = data(:,2);
stop = 1;
% plot(s_true);
n=400;
t = linspace(-pi/2,pi/2,n);
H = shaw(n);
X = ones(n,1);
R = eye(n);
Q = eye(n);
[s,V,LAMBDA,MU] = GenLinInv(y,H,R,X,Q);
plotresult(t,s,s_true,61);



end


function [] = plotresult(t,s,s_true,ind)
% ind figure number
figure(ind);
hold on;
plot(t,s,'bo');
plot(t,s_true,'r-','linewidth',2);


end

function Q=linearQ(n,x)
Q=zeros(n);
h=abs(repmat(x,n,1)-repmat(x',1,n));
Q=1./h;
end

function Q=gaussianQ(n,x)
Q=zeros(n);
sigma=1;
L=1;
h=abs(repmat(x,n,1)-repmat(x',1,n));
Q=sigma^2*exp(-h.^2/L^2);
end


