function [a] = gradientDescent(a, theta, y, eta, iter, prim)
%Gradient Descent,  this function will perform gradient descent on
%a given set of data. 

%a     -> inital augmented weight vector
%theta -> threshold
%y     -> augmented feature vector
%eta   -> learning rate
%iter  -> number of iterations
    flag = 0;
    i = 1;
    %augmentation
    temp = zeros(length(y), 4);
    for k = 1 : length(y)
        temp(k,:) = [1,y(k,:)];
    end
    y = temp;
    
    while (i < iter && flag ~= 1)
        accum = 0;
        gradient = [0,0,0];
        for j = 1 : length(y)
           %augmentation/rebuild
           class = y(j, 4);
           feature = y(j,1:3);
           %normalization
           if(class ~= prim)
               feature = feature .* -1;
           end
           %determines misclassifications an dums delta Jp
           if(classifier2(a, feature) ~= 1)
               gradient = gradient + feature;
               accum = accum + 1;
           end 
        end
        %update a
        a = a + eta .* gradient;

        if(norm(eta .* gradient) < theta)
           flag = 1;
           conv = i;
        end
        i = i + 1;
    end 
end


