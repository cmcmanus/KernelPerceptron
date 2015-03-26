function f = kernel_perceptron_test(a, Xtrain, sigma, Xtest)

N = size(Xtrain, 1);

k = zeros(N,1);
for i = 1:N
	dist = norm(Xtrain(i,:)' - Xtest);
	k(i,1) = dist*dist;
end

k = k ./ (2 * sigma * sigma);
k = exp(-k);

f = a' * k;
