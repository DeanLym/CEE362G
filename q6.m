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