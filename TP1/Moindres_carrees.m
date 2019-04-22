close all;
clear variables;

figure(1)
a = -0.1;
b = 0.1;
N = 64;
H = matH_1D(N,3,'gaussian',1);%diag(ones(1,N)); %Choix initial
n = (a + (b-a).*rand(N,1));
x1 = -5+5/N:10/N:5-5/N;

xbar = (sin(x1))';
z = H*xbar + n;

x0 = 20800+(zeros(1,N))';
hold on
%subplot(221)
plot(xbar);
%subplot(222);
plot(z)
f = @(x) norm(H * x - z);
df = @(x) 2 * H' * (H*x -z);

diff = 1;
eps = 5d-4;
lambda = 0.75;

%subplot(212)
xn = [x0];
%plot(x0);
pause(0.01)
while (diff > eps)
    valeur = xn(:,end) - lambda*df(xn(:,end));
    diff = norm(valeur-xn(:,end))
    xn = [xn, valeur];
    %plot(xn(:,end));
    pause(0.01);
end
plot(xn(:,end))
size(xn)

xchap = pinv((H')*H)*(H')*z;
plot(xchap)
legend('Signal initial', 'Signal modifie', 'Resoluton numerique', 'Resolution analytique')