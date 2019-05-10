load('linefit.mat')

x = xs;
y = n_y1;
% y=mx+b
[a1,b1] = least_square(x,y);

plot(x,y,'go'); %points
legend('show');
hold on;
plot(x,a1+b1*x,'b-','DisplayName','xs and n-y1'); %line
% hold off;
disp('xs and n_y parameters:');
disp('y intercept'); disp(a1);
disp('slope'); disp(b1);

%------------------------------------------------------------------
y2 = n_y2;
[a1,b1] = least_square(x,y2);
plot(x,y2,'ro'); %points

hold on;
legend('show');
plot(x,a1+b1*x,'m-','DisplayName','xs and n-y2'); %line
disp('xs and n_y2 parameters:');
disp('y intercept'); disp(a1);
disp('slope'); disp(b1);
%------------------------------------------------------------------
c = [x;y2];
d = c';
% hold off;
%data,num,iter,threshDist,inlierRatio
ransac(d',5,20,2,0.1);
