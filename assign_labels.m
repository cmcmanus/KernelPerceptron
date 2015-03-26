function y = assign_labels(X, testcase)
switch (testcase)
	case 1  
		% Test case #1: linear decision boundary
		y = 0.2*(X(:,1)-0.5) + 0.6 - X(:,2) > 0;
	case 2
		% Test case #2: circle of radius 0.3 units, with center of the circle at (0.5,0.5).
		y = ((X(:,1)-0.5).*(X(:,1)-0.5)+(X(:,2)-0.5).*(X(:,2)-0.5)) > 0.3*0.3;
	case 3
		% Test case #3: parabolic decision boundary
		y = 4*(X(:,1)-0.5).*(X(:,1)-0.5) + 0.2 - X(:,2) > 0;
	case 4
		y = ((X(:,1) > 0.2) & (X(:,1) < 0.4) & (X(:,2) > 0.2) & (X(:,2) < 0.4)) ...
			| ((X(:,1) > 0.6) & (X(:,1) < 0.8) & (X(:,2) > 0.2) & (X(:,2) < 0.4)) ...
			| ((X(:,1) > 0.2) & (X(:,1) < 0.4) & (X(:,2) > 0.6) & (X(:,2) < 0.8)) ...
			| ((X(:,1) > 0.6) & (X(:,1) < 0.8) & (X(:,2) > 0.6) & (X(:,2) < 0.8));
	otherwise 
		error('unknown test case');
end
% map to {-1, 1}
y = 2*y - 1;
