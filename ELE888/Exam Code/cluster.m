function [sw,sb,m,tr]= cluster(x,d1,d2)
m(1,:)=sum(d1)/length(d1);%solve mean
m(2,:)=sum(d2)/length(d2);
s1=(d1-m(1,:));%solve j
s1=s1'*s1;
s2=(d2-m(2,:));
s2=s2'*s2;
sw = s1 + s2%solve s2
tr(1)= sum(diag(sw));%solve trsw
mean= sum(x)/length(x);%solve mean
m(1,:)= m(1,:)-mean;
m(2,:)= m(2,:)-mean;
sb = length(d1)*m(1,:)'*m(1,:)+length(d2)*m(2,:)'*m(2,:)
tr(2)= sum(diag(length(d1)*m(1,:)'*m(1,:)+length(d2)*m(2,:)'*m(2,:)));%solve tr of sb
tr
c = 2;%%change c for # of clusters
CH = tr(2)/tr(1)*(length(x)-c)/(c-1)%calinski harabasz
end%scatter