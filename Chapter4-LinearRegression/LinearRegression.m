function [theta, JList] = LinearRegression(X, y, iterations, theta, alpha)
% ���Իع�
JList = zeros(iterations, 1);
for i = 1:iterations;
    prediction = X * theta;
    error = prediction - y;
    J_cost = sum(error.^2)/(2*size(X,1));
    JList(i,1) = J_cost;
    delta = X' * error; % �ݶ������� (n*m)*(m*1)=(n*1)ά���ݶ�����
    theta = theta - alpha*delta;
end;
% ��ʧ����ͼ��
% x=[1:iterations];
% plot(x, JList);
x=[min(X(:,2)):0.01:max(X(:,2))];
y=theta(1,1)+theta(2,1)*x; %��λ����߽߱磿����ô����x2��ֵ��
disp(x)
disp(y)
plot(x,y,'r');
hold off;
end

