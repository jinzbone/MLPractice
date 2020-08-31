function [theta, JList] = LinearRegression(X, y, iterations, theta, alpha)
% 线性回归
JList = zeros(iterations, 1);
for i = 1:iterations;
    prediction = X * theta;
    error = prediction - y;
    J_cost = sum(error.^2)/(2*size(X,1));
    JList(i,1) = J_cost;
    delta = X' * error; % 梯度列向量 (n*m)*(m*1)=(n*1)维的梯度向量
    theta = theta - alpha*delta;
end;
% 损失函数图像
% x=[1:iterations];
% plot(x, JList);
x=[min(X(:,2)):0.01:max(X(:,2))];
y=theta(1,1)+theta(2,1)*x; %如何画决策边界？（怎么计算x2的值）
disp(x)
disp(y)
plot(x,y,'r');
hold off;
end

