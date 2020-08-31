function theta = main(data)
% 主函数
d = load(data);
X = d(:,[1]);
y = d(:,3);
% 对X中的feature进行正则化,因为feature的scale相差太大，容易NaN
for i=1:size(X,2);
    x_max = max(X(:,i));
    x_min = min(X(:,i));
    x_ave = mean(X(:,i));
    X(:,i) = (X(:,i)-x_ave)/(x_max-x_min);
end; % 一定要有end啊，debug了好久...
scatter(X,y);
hold on;
X = [ones(47,1) X];

iterations = 1000;
m = size(d,1);
n = size(X,2);
theta = rand(n, 1);
alpha = 0.01;
[theta, JList] = LinearRegression(X, y, iterations, theta, alpha);
end

