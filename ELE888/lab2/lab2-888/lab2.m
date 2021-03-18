function [a,iterations]=lab2(Training_Data,iter)
% x = individual sample to be tested (to identify its probable class label)
% Train_Data = x2 x3
y=Training_Data;

n = 0.01;

%Augmentation and nomalization of training data
[M,N]=size(y);    
y = [ones(M,1) y];
y(M/2+1:M,:) = y(M/2+1:M,:).*(-1);
y = y' % [class;x2;x3;]

a =[0;0;1]; %setting initial a

for i=1:iter
    temp = a'*y;
    if not(any(temp<0))
        fprintf('solution vector %f\n',a);
        break
    end
    grad = sum(-y,2);
    a = a-n*grad;
end
syms xa xb
eqn= (a'*[1 xa xb]');
xa = solve(eqn,xa);
xb = 1:0.01:5;
fplot(xa,[0 5]);
title('x2 vs x3')
xlabel('x3')
ylabel('x2')
hold on;
plot(Training_Data(1:M/2,:),Training_Data(M/2+1:M,:),'x');
a=a;
iterations = i;