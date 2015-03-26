function a = kernel_perceptron_train(x, y, sigma)

if nargin < 3
	sigma = 0.1;
end

[N D] = size(x);

k = zeros(N,N);
for i = 1:N
	for j = 1:N
		dist = norm(x(i,:) - x(j,:));
		k(i,j) = dist*dist;
	end
end

k = k ./ (2 * sigma * sigma);
k = exp(-k);

a = ones(N,1);
misclassified = ones(N,1);

MAX_ITERS = 10000;
iter = 0;

while sum(misclassified) > 0 && iter <= MAX_ITERS
	iter = iter + 1;
	alpha = a .* y;
	misclassified = k * alpha;
	misclassified = sign(misclassified);
	misclassified = misclassified ~= y;
	a = a + misclassified;
	
	m = sum(misclassified);
	
	fprintf('Iteration %d: %d misclassified\n', iter, m);
end

a = alpha;

if sum(misclassified) > 0
	warning(sprintf('Not perfectly separated, %d misclassified', sum(misclassified)));
end
