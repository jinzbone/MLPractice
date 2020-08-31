function [theta,JLoss] = classification(X,y,theta,iterations,alpha)
JLoss = zeros(iterations, 1);
m = size(X,1);
for i=1:iterations;
    prediction = X * theta;
    hx = 1./(1+exp(1).^(-prediction));
    error = hx-y;
    cost = -sum(y.*log(hx)+(1-y).*log(1-hx))/m;
    JLoss(i,1) = cost;
    delta = (1/m)*(X'*error); % ֮ǰ���˺ܾõ�bug����������ݶȵ��ұ�Ӧ����X'*error������д����sum(X'*error)
    theta = theta-alpha*delta;
end;

% ��ʧ����������ͼ
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
