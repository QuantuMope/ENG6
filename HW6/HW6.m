%% HW 6 Andrew Choi 

%% Problem 1
coeff1=[8,4,4,46];
coeff2=[65,56,8,4];
coeff3=[6,65,6,4];
coeff4=[6,13,24,5];
coeff=[coeff1;coeff2;coeff3;coeff4];
% set up coefficient matrix of the four equations
outcome=[-40;99;-125;209];
% set up the outcomes of each four equations
variables=coeff\outcome;
variables=round(variables);
% use mldivide to obtain the values of the variables
fprintf('For the system of linear equations A=%d, B=%d, C=%d, and D=%d.\n',variables(1),variables(2),variables(3),variables(4))
% use a fprintf statement to display what A,B,C, and D equal

%% Problem 2
data=Race_Data;
[l,w]=size(data);
leng=length(data);
% determine the size and length of the matrix to use in the for loop in
% order for the script to work for any matrix
avg=[];
for g=1:leng
    average=sum(data(g,2:end))/(w-1);
    avg=[avg;average];
end
avg=round(avg,2);
data=[data,avg];
% concantenate the average to the data matrix
lowhi=sort(avg);
hilow=flipud(lowhi);
% obtain a matrix containing the averages from highest to low
rnrindex=[];
for g=1:leng
    runnerindex=find(data(g,5)==hilow);
    rnrindex=[rnrindex;runnerindex];
    % use a for loop to find the ranking of each runner of each runner
    % according to their average time
end
rnrindex2=[];
for g=1:7
    runnerindex2=find(rnrindex==g);
    rnrindex2=[rnrindex2;runnerindex2];
    % use another for loop to find the corresponding student number index 
    % for each ranking
end
rnrrank=data(rnrindex2,1);
% find the corresponding student number for each index found in the
% previous for loop
fprintf('The students that will be going to the meet are %d, %d, %d, %d, %d, %d, and %d.\n',rnrrank(:))
fprintf('The students that will be nominated to race in the upper division are %d and %d. \n',rnrrank(1),rnrrank(2))

%% Problem 3
[X,Y]=meshgrid(-2:.1:2,-2:.1:2);
% construct a meshgrid for the x and y boundaries
func1=cos(X.^2+Y.^2);
func2=X.*Y.^3-Y.*X.^3;
func3=X.*Y.*exp(-X.^2-Y.^2);
% copy down the three functions
figure(1)
subplot(2,2,1)
mesh(func1)
title('z=cos(x^2+y^2)')
% use the mesh function and subplot to get all three surface graphs onto
% one figure, then title each with their function
subplot(2,2,2)
mesh(func2)
title('z=x*y^3-y*x^3')
subplot(2,2,3)
mesh(func3)
title('z=x*y*exp(-x^2-y^2)')

