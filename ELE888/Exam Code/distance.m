function [d1,d2] = distance(x,u1,u2)
    d1=sqrt((x(:,1)-u1(:,1)).^2+(x(:,2)-u1(:,2)).^2);
    d2=sqrt((x(:,1)-u2(:,1)).^2+(x(:,2)-u2(:,2)).^2);
    d1
    d2
    class=d1<d2;
%    fuzzy k-means
    mean(1,:) = sum(x(class,:))/sum(class(:)==1);
    mean(2,:) = sum(x(~class,:))/sum(class(:)==0);
    mean
end