function demo_kernel_perceptron(testcase,sigma)
% demo_kernel_perceptron(testcase,sigma)
%   testcases = {1,2,3,4}
%   sigma is the parameter for the Gaussian RBF kernel
% provided for CS542 A4, Feb 26 2015
% authors: Stan Sclaroff and Kun He

if nargin < 1 
	testcase = 1; 
end
if nargin < 2
  sigma = .1;
end
 
% load data, class labels
load xdata2d
ytrain = assign_labels(Xtrain, testcase);
ytest  = assign_labels(Xtest,  testcase);

%%%% PLEASE IMPLEMENT: train kernel perceptron
%%%% kernel_perceptron_train()
a = kernel_perceptron_train(Xtrain, ytrain, sigma);

% test kernel perceptron
ypred = zeros(size(ytest));
for j = 1:size(Xtest, 1)
  %%%% PLEASE IMPLEMENT: evaluate f for j-th test example
  %%%% kernel_perceptron_test()
  f = kernel_perceptron_test(a, Xtrain, sigma, Xtest(j, :)');
  ypred(j) = 2*(f>0) - 1;
end
% compute testing error
test_error = mean(ypred ~= ytest)

% plot
% first evaluate the classifier on a grid of X points
% this will enable us to visualize the decision boundary & contours
Xmax = max(Xtrain);
Xmin = min(Xtrain);
nsteps = 25;
step = (Xmax-Xmin)/nsteps;
[x, y] = meshgrid(Xmin(1):step(1):Xmax(1), Xmin(2):step(2):Xmax(2)); 
f = zeros(size(x));
for i = 1:size(x, 1)
	for j = 1:size(x,2)
		f(i,j) = kernel_perceptron_test(a, Xtrain, sigma, [x(i,j),y(i,j)]');
	end
end

% produce figure of decision boundary & contours, training samples
F = figure();
colormap bone
contourf(x, y, f, 50, 'LineStyle', 'none');
hold on;
scatter(Xtrain(ytrain>=0,1),Xtrain(ytrain>=0,2),30,'r', 'filled');
scatter(Xtrain(ytrain<=0,1),Xtrain(ytrain<=0,2),30,'g', 'filled');
contour(x,y,f,[0,0],'y','linewidth',2);
hold off
print(F, 'partII', '-djpeg');
