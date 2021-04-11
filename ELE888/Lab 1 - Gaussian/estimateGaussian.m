function [mu sigma2 px] = estimateGaussian(X)

[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

mu = (1/m)*sum(X,1);
sigma2 = (1/m)*sum((X-mu).^2);

px = (1/(2*pi*sigma2))*exp(-(X-mu)/(2*sigma2));