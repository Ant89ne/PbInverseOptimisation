hold on

x0 = 2;
f = @(x) x.^2; %(x-1).*(x-2).*(x-3).*(x-5);%
eps = 1d-6;
lambda = 0.01; %Cas < 1 pour convergence

xn = [x0];
yn = [f(x0)];
diff = 1;
while (diff > eps)
    valeur = xn(end) - lambda * 2 * xn(end);%(4*xn(end)^3 - 33*xn(end)^2 +82*xn(end)-61);%
    diff = abs(valeur - xn(end));
    yn = [yn, f(xn(end)), f(valeur)];
    xn = [xn,valeur,valeur];
end
length(xn)
figure(1)
subplot(133)
X = -3:0.1:3;%0.5:0.01:5.5;% %Par exemple
plot(X, f(X))
hold on;
plot(xn, yn)
title(['Etude de la convergence pour lambda = ', num2str(lambda)])
plot(xn(1), f(xn(1)), '*b');
text(xn(1)+0.1, f(xn(1)),['Depart = ', num2str(xn(1))]);
plot(xn(end), f(xn(end)), '*g');
text(xn(end)+0.1, f(xn(end)), ['Arrivee = ', num2str(xn(end))]);
legend('Fonction initiale','Parcours')
%axis([0,6,-10,10])



x0 = 0.5;
lambda = 1.1; %Cas > 1 pour divergence

xn = [x0];
yn = [f(x0)];
for(i=0:7) %Boucle for car pas de convergence donc pas de while
    valeur = xn(end) - lambda * 2 * xn(end);
    yn = [yn, f(xn(end)), f(valeur)];
    xn = [xn,valeur,valeur];
end

figure(2)
subplot(132)
X = -3:0.1:3; %Par eemple
plot(X, f(X))
hold on;
plot(xn, yn)
title(['Etude de la divergence pour lambda = ', num2str(lambda)])
plot(xn(1), f(xn(1)), '*b');
text(xn(1)+0.1, f(xn(1)), ['Depart = ', num2str(xn(1))]);
plot(xn(end), f(xn(end)), '*g');
text(xn(end)+0.1, f(xn(end)), ['Arrivee = ', num2str(xn(end))]);
legend('Fonction initiale','Parcours')



x0 = 2;
lambda = 1; %Cas = 1 pour oscillation

xn = [x0];
yn = [f(x0)];
for(i=0:4) %Boucle for car pas de convergence donc pas de while
    valeur = xn(end) - lambda * 2 * xn(end);
    yn = [yn, f(xn(end)), f(valeur)];
    xn = [xn,valeur,valeur];
end

figure(3)
subplot(133)
X = -3:0.1:3; %Par eemple
plot(X, f(X))
hold on;
plot(xn, yn)
title(['Etude de l oscillation pour lambda = ', num2str(lambda)])
plot(xn(1), f(xn(1)), '*b');
text(xn(1)+0.1, f(xn(1)), ['Depart = ', num2str(xn(1))]);
plot(xn(end), f(xn(end)), '*g');
text(xn(end)+0.1, f(xn(end)), ['Arrivee = ', num2str(xn(end))]);
legend('Fonction initiale','Parcours')
