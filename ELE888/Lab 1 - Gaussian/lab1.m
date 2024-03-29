%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ELE 888/ EE 8209: LAB 1: Bayesian Decision Theory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [posteriors_x,g_x]=lab1(x,Training_Data)

% x = individual sample to be tested (to identify its probable class label)
% featureOfInterest = index of relevant feature (column) in Training_Data 
% Train_Data = Matrix containing the training samples and numeric class labels
% posterior_x  = Posterior probabilities
% g_x = value of the discriminant function

D=Training_Data;

% D is MxN (M samples, N columns = N-1 features + 1 label)
[M,N]=size(D);    
 
f=D(:,1);  % feature samples
la=D(:,N); % class labels


%% %%%%Prior Probabilities%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hint: use the commands "find" and "length"

disp('Prior probabilities:');
Pr1 = size(find(Training_Data(:,5)==1))/size(Training_Data(:,5))
Pr2 = size(find(Training_Data(:,5)==2))/size(Training_Data(:,5))

%% %%%%%Class-conditional probabilities%%%%%%%%%%%%%%%%%%%%%%%

disp('Mean & Std for class 1 & 2');
X1 = Training_Data((Training_Data(:,5)==1),2);
m1 = length(Training_Data((Training_Data(:,5)==1),2));
m11 = sum(X1)/m1  % mean of the class conditional density p(x/w1)
std11 = sqrt((1/m1)*sum((X1-m11).^2))% Standard deviation of the class conditional density p(x/w1)

X2 = Training_Data((Training_Data(:,5)==2),2);
m2 = length(Training_Data((Training_Data(:,5)==2),2));
m12 = sum(X2)/m2% mean of the class conditional density p(x/w2)
std12= sqrt((1/m2)*sum((X2-m12).^2))% Standard deviation of the class conditional density p(x/w2)


disp(['Conditional probabilities for x=' num2str(x)]);
cp11= 1/(sqrt(2*pi)*std11)*exp(-0.5*((x-m11)/(std11)).^2)% use the above mean, std and the test feature to calculate p(x/w1)

cp12=  1/(sqrt(2*pi)*std12)*exp(-0.5*((x-m12)/(std12)).^2)% use the above mean, std and the test feature to calculate p(x/w2)

%% %%%%%%Compute the posterior probabilities%%%%%%%%%%%%%%%%%%%%
p_x = cp11*Pr1+cp12*Pr2;

disp('Posterior prob. for the test feature');

pos11= (cp11*Pr1)./p_x% p(w1/x) for the given test feature value

pos12= (cp12*Pr2)./p_x% p(w2/x) for the given test feature value

posteriors_x = [pos11;pos12];

%% %%%%%%Discriminant function for min error rate classifier%%%

disp('Discriminant function for the test feature');

g_x= pos11-pos12 %>= 0;% compute the g(x) for min err rate classifier.

%correctness = sum(g_x == (Training_Data(:,5)'==1))
%syms x
%eqn = 1/(sqrt(2*pi)*std11)*exp(-0.5*((x-m11)/std11)^2) == 1/(sqrt(2*pi)*std12)*exp(-0.5*((x-m12)/std12)^2);
%disp('Threshold x2');
%S = solve(eqn,x);

% fplot(@(x) (1/(sqrt(2*pi)*std11)*exp(-0.5*((x-m11)/std11)^2)));
% grid on 
% title('Probability Density for Feature X2')
% xlabel('x');
% ylabel('y');
% hold on
% fplot(@(x) (1/(sqrt(2*pi)*std12)*exp(-0.5*((x-m12)/std12)^2)));
% legend({'p(x2|w1)','p(x2|w2)'},'Location','southwest')
% hold off

