function X = regressao(x, y)

A = zeros(length(x), 2);
A(:,1) = x;
A(:,2) = 1;

X = A'*A\A'*y;

t = min(x):0.01:max(x);
hold on
plot(x, y, 'o')
plot(t, X(1)*t + X(2))

