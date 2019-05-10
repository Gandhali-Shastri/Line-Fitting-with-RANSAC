function ransac(data,num,iter,threshDist,inlierRatio)
 %% Plot the data points
%  figure;plot(data(1,:),data(2,:),'o');hold on;
 number = size(data,2); % Total number of points
 bestInNum = 0; % Best fitting line with largest number of inliers
 bestParameter1=0;bestParameter2=0; % parameters for best fitting line
 
 for i=1:iter
 %% Randomly select 2 points
     idx = randperm(number,num); sample = data(:,idx);   
 %Compute the distances 
     ln = sample(:,2)-sample(:,1);
     Norm_ln = ln/norm(ln);
     Norm_v = [-Norm_ln(2),Norm_ln(1)];
     distance = Norm_v*(data - repmat(sample(:,1),1,number));
 %Compute inliers 
     inlierIdx = find(abs(distance)<=threshDist);
     inlierNum = length(inlierIdx);
    
     if inlierNum>=round(inlierRatio*number) && inlierNum>bestInNum
         bestInNum = inlierNum;
         m = (sample(2,2)-sample(2,1))/(sample(1,2)-sample(1,1));
         b = sample(2,1)-m*sample(1,1);
   
     end
 end
 
 %% Plot the best fitting line
 legend('show');
 x = -number/2:number/2; 
 y = m*x + b;
 plot(x,y,'c-','DisplayName','RANSAC');
 hold off;
 disp('RANSAC parameters');
disp('y intercept'); disp(b);
disp('slope'); disp(m);
end
