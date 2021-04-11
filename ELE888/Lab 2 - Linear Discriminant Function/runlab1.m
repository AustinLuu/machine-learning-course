%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAB 1, Bayesian Decision Theory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Attribute Information for IRIS data:
%    1. sepal length in cm
%    2. sepal width in cm
%    3. petal length in cm
%    4. petal width in cm

%    class label/numeric label: 
%       -- Iris Setosa / 1 
%       -- Iris Versicolour / 2
%       -- Iris Virginica / 3


%% this script will run lab1 experiments..
clear
load irisdata.mat

%% extract unique labels (class names)
labels = unique(irisdata_labels);

%% generate numeric labels
numericLabels = zeros(size(irisdata_features,1),1);
for i = 1:size(labels,1)
    numericLabels(find(strcmp(labels{i},irisdata_labels)),:)= i;
end

% %% feature distribution of x1 for two classes
% figure
% 
%     
% subplot(1,2,1), hist(irisdata_features(find(numericLabels(:)==1),2),100), title('Iris Setosa, sepal width (cm)');
% subplot(1,2,2), hist(irisdata_features(find(numericLabels(:)==2),2),100); title('Iris Veriscolour, sepal width (cm)');
% 
% figure
% 
% subplot(1,2,1), hist(irisdata_features(find(numericLabels(:)==1),1),100), title('Iris Setosa, sepal length (cm)');
% subplot(1,2,2), hist(irisdata_features(find(numericLabels(:)==2),1),100); title('Iris Veriscolour, sepal length (cm)');
%     
% 
% figure
% 
% plot(irisdata_features(find(numericLabels(:)==1),1),irisdata_features(find(numericLabels(:)==1),2),'rs'); title('x_1 vs x_2');
% hold on;
% plot(irisdata_features(find(numericLabels(:)==2),1),irisdata_features(find(numericLabels(:)==2),2),'k.');
% axis([4 7 1 5]);
 
    

%% build training data set for two class comparison
% merge feature samples with numeric labels for two class comparison (Iris
% Setosa vs. Iris Veriscolour
trainingSet = [irisdata_features(1:100,:) numericLabels(1:100,1) ];

dataSetA = irisdata_features(1:50,2:3);
dataSetB = irisdata_features(51:100,2:3);
dataSetC = irisdata_features(101:150,2:3);

trainingAB30 = [dataSetA(1:15,:); dataSetB(1:15,:)];
trainingAB70  = [dataSetA(1:35,:); dataSetB(1:35,:)];
testAB70 = [dataSetA(16:50,:); dataSetB(16:50,:)];
testAB30 = [dataSetA(36:50,:); dataSetB(36:50,:)];

trainingCB30 = [dataSetC(1:15,:); dataSetB(1:15,:)];
trainingCB70  = [dataSetC(1:35,:); dataSetB(1:35,:)];
testCB70 = [dataSetC(16:50,:); dataSetB(16:50,:)];
testCB30 = [dataSetC(36:50,:); dataSetB(36:50,:)];

%% Lab1 experiments (include here)
