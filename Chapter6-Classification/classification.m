function [theta,JLoss] = classification(X,y,theta,iterations,alpha)
JLoss = zeros(iterations, 1);
m = size(X,1);
for i=1:iterations;
    prediction = X * theta;
    hx = 1./(1+exp(1).^(-prediction));
    error = hx-y;
    cost = -sum(y.*log(hx)+(1-y).*log(1-hx))/m;
    JLoss(i,1) = cost;
    delta = (1/m)*(X'*error); % 之前找了很久的bug出现在这里，梯度的右边应该是X'*error，错误写成了sum(X'*error)
    theta = theta-alpha*delta;
end;

% 损失函数的曲线图
% x = [1:iterations];
% plot(x,JLoss);
% disp(theta)

xaxis = [min(X(:,[2,3])):1:max(X(:,[2,3]))];
disp(xaxis)
% yaxis=theta(1,1)+theta(2,1)*xaxis+theta(3,1)*xaxis;
% y=1./(1+exp(1).^(-yaxis));
y=(-theta(1,1)-theta(2,1)*xaxis)./theta(3,1);
% y=1./(1+exp(1).^(-y));
disp(y)
plot(xaxis,y);
hold off;
end
