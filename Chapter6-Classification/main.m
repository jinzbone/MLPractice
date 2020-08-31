function theta = main(data)
d = load(data);
X = d(:,[1,2]);
y = d(:,[3]);
m = size(d,1);
n = size(d,2);
% ÕýÔò»¯
for i=1:size(X,2);
    x_max = max(X(:,i));
    x_min = min(X(:,i));
    x_ave = mean(X(:,i));
    X(:,i) = (X(:,i)-x_ave)/(x_max-x_min);
end;

for i=1:m;
    if y(i,1)==1;
        plot(X(i,1),X(i,2),'r+');
        hold on;
    else;
        plot(X(i,1),X(i,2),'go');
        hold on;
    end;
end;

X = [ones(size(d,1),1) X];

theta = rand(n,1);
alpha = 0.01;
iterations=100000;
[theta, JLoss] = classification(X,y,theta,iterations,alpha);
end

