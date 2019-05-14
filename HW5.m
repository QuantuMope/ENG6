%% HW 5 Andrew Choi 999796522

%% Problem 1
n=10;
vecx=[];
vecy=[];
x=0;
y=0;
% Set up a for loop, conditionals, and the randi function in order to
% create the Sierpinski triangle using the three functions given.
for g=1:n;    
    r=randi([1,3]);
    if r==1;
        xn=0.5*x;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    elseif r==2;
        xn=0.5*x+0.25;
        yn=0.5*y+(3^.5)/4;
        x=xn;
        y=yn;                    
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    else r==3;
        xn=0.5*x+0.5;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    end
end
% Plot this graph when n=10 then copy and paste the for loop for when
% n=100,1000,and 10000. Use subplot so all four graphs are on one figure.
figure(1)
subplot(2,2,1)
plot(vecx,vecy,'^')
title('Sierpinski Triangle, n=10')
n=100;
vecx=[];
vecy=[];
x=0;
y=0;
for g=1:n;    
    r=randi([1,3]);
    if r==1;
        xn=0.5*x;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    elseif r==2;
        xn=0.5*x+0.25;
        yn=0.5*y+(3^.5)/4;
        x=xn;
        y=yn;                    
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    else r==3;
        xn=0.5*x+0.5;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    end
end
subplot(2,2,2)
plot(vecx,vecy,'^')
title('Sierpinski Triangle, n=100')
n=1000;
vecx=[];
vecy=[];
x=0;
y=0;
for g=1:n;    
    r=randi([1,3]);
    if r==1;
        xn=0.5*x;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    elseif r==2;
        xn=0.5*x+0.25;
        yn=0.5*y+(3^.5)/4;
        x=xn;
        y=yn;                    
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    else r==3;
        xn=0.5*x+0.5;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    end
end
subplot(2,2,3)
plot(vecx,vecy,'^')
title('Sierpinski Triangle, n=1000')
n=10000;
vecx=[];
vecy=[];
x=0;
y=0;
for g=1:n;    
    r=randi([1,3]);
    if r==1;
        xn=0.5*x;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    elseif r==2;
        xn=0.5*x+0.25;
        yn=0.5*y+(3^.5)/4;
        x=xn;
        y=yn;                    
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    else r==3;
        xn=0.5*x+0.5;
        yn=0.5*y;
        x=xn;
        y=yn;
        vecx=[vecx,xn];
        vecy=[vecy,yn];
    end
end
subplot(2,2,4)
plot(vecx,vecy,'^')
title('Sierpinski Triangle, n=10000')

%% Problem 2(a)
num=inputdlg('Enter a Positive Odd Integer');
n=str2double(num{:});
array=zeros(n,2*n-1);
fprintf('You have entered %d.',n)
% Use an if statement that triggers the while loop if the input is a
% positive odd integer. 
if mod(n,2)==1 && n>0;
    i=1;
    % Have the while loop create a descending pyramid using algebra and i
    % as the changing loop
    while i<=n;
        array(i:end,[n-(i-1),n+(i-1)])=i;
        i=i+1;
    end
    disp(array)
else
    fprintf('Please Enter a Positive Odd Integer')
end    

%% Problem 2(b)
num=inputdlg('Enter a Positive Odd Integer');
n=str2double(num{:});
array2=zeros(n,n);
fprintf('You have entered %d.',n)
% Use an if statement that triggers the while loop if the input is a
% positive odd integer. 
if mod(n,2)==1 && n>0;
    i=1;
    % Have the while loop create a matrix that starts at 1 and ascends in
    % value until the necessary middle value is reached.
    while i<n;
        array2(1:end,i:(n+1)/2)=i;
        i=i+1;
               
    end
    % Use array functions to duplicate the array, omit the first column,
    % flip the array, and then concatenate it to get a matrix that starts
    % at 1 ascends to the middle then descends back to 1.
    array2(:,end+1-((n-1)/2):end)=[];
    arrayp2=fliplr(array2);
    arrayp2(:,1)=[];
    farray=[array2,arrayp2];
    % Use the indexes of the diagonal of the matrix and replace them with
    % n+1.
    farray(find(eye(n)))=n+1;
    i=1;
    % Use another while loop to get the diagonal ascending and descending
    % patterns using algebra and a changing i value.
    while i<=((n-5)/2)+1;
    farray((1:((n-5)/2)+2-i),((n-1)/2)+1-i)=((n-1)/2)+1+i;
    farray((((n-1)/2)+2+i:end),(((n-1)/2)+1+i))=((n-1)/2)+1+i;
    i=i+1;
    end
    disp(farray)
else
    fprintf('Please Enter a Positive Odd Integer')
end


%% Problem 3 
%% Part 1(a)
hw=hwScore;
mid=midScore;
fin=finalScore;
% Find all indices in the matrices where inputs are negative.
[nhrow,nhcol]=find(hw<0);
[nmrow,nmcol]=find(mid<0);
% Use two seperate for loops and the indices found to replace the negative
% values with the average of that student's non negative grades.
for g=1:numel(nhrow)
    vec=[2,3,4,5,6];
    vec(vec==nhcol(g))=[];
    hw(nhrow(g),nhcol(g))=round(sum(hw(nhrow(g),vec))/numel(vec));  
end
for g=1:numel(nmrow)
    vec=[2,3,4];
    vec(vec==nmcol(g))=[];
    mid(nmrow(g),nmcol(g))=round(sum(mid(nmrow(g),vec))/numel(vec));
end

%% Part 1(b)
% Find all indices where the inputs are over the max.
[ohrow,ohcol]=find(hw>10 & hw<101);
[omrow,omcol]=find(mid>50 & mid<101);
% Use two seperate for loops and the indices found to replace the over max
% values with the average of that student's non over max grades.
for g=1:numel(ohrow)
    vec=[2,3,4,5,6];
    vec(vec==ohcol(g))=[];
    hw(ohrow(g),ohcol(g))=round(sum(hw(ohrow(g),vec))/numel(vec));
end
for g=1:numel(omrow)
    vec=[2,3,4];
    vec(vec==omcol(g))=[];
    mid(omrow(g),omcol(g))=round(sum(mid(omrow(g),vec))/numel(vec));
end
disp(hw)
disp(mid)

%% Part 1(c)
% Attach all the grades horizontally into one matrix called allScores.
mid(:,1)=[];
fin(:,1)=[];
allScores=[hw,mid,fin];
disp(allScores)

%% Part 1(d)
% Get rid of any students that have zeros for all their scores by using a for
% loop to identify each row. If a row is all zeros then the row is replaced
% with -1s.
[i,k]=size(allScores);
for g=1:i
    if allScores(g,2:end)==0
        allScores(g,:)=[-1];
    end
end
% Variable x is made to count the instances of -1s so that the number of
% dropped students can be recorded. This value is necessary so that the
% function works for any class size with any varying grades for it is used
% to alter all other loops later on.
x=numel(find(allScores(:,1)==-1));
% Omit all -1s.
allScores(allScores==-1)=[];
% Reshape the matrix.
allScores=reshape(allScores,[i-x,k])

%% Part 1(e)
% Find the rounded max and min scores for each category and store them in
% a vector. Then vertically concatenate them into matrix T. Omit students numbers.
maxScores=max(allScores);
maxScores(:,1)=[];
maxScores=round(maxScores);
minScores=min(allScores);
minScores(:,1)=[];
minScores=round(minScores);
T=[maxScores;minScores];

%% Part 1(f)
% Find the rounded mean, median, and standard deviation of each category.
% Then vertically concatenate them into matrix T again. Omit student
% numbers.
meanScores=mean(allScores);
meanScores(:,1)=[];
meanScores=round(meanScores);
medianScores=median(allScores);
medianScores(:,1)=[];
medianScores=round(medianScores);
stdScores=std(allScores);
stdScores(:,1)=[];
stdScores=round(stdScores);
T=[T;meanScores;medianScores;stdScores];
disp(T)

%% Part 2(a)
hwgrade=[];
% Use a for loop to find out the lowest score in each student's homework
% and then calculate their average score omitting that lowest score.
% Multiply every value by a factor of .25 and store these into hwgrade
% column vector.
for g=1:i-x
    minhw=min(allScores(g,2:6));
    hwgrad=(sum(allScores(g,2:6))-minhw)/4;
    hwgrade=[hwgrade;hwgrad*.25];
end
hwgrade=round(hwgrade);
midgrade=[];
% Use a for loop and conditionals to see if the average mid term score of
% each student is greater than their final score. If it isn't then the same
% procedure as above occurs for their midterm grades. If it is then their
% midterm average value for all three is used. Multiply every value by a
% factor of .35 and store them into midgrade column vector.
for g=1:i-x
    if (sum(allScores(g,7:9))/3)>allScores(g,10)
        midgrad=(sum(allScores(g,7:9))/3);
        midgrade=[midgrade;midgrad*.35];
    else 
        minmid=min(allScores(g,7:9));
        midgrad=(sum(allScores(g,7:9))-minmid)/2;
        midgrade=[midgrade;midgrad*.35];
    end
end
midgrade=round(midgrade);
finalgrade=[];
% Use a for loop to multiply every student's final grade by a factor of .4
% and then store them into finalgrade column vector.
for g=1:i-x
    finalgrad=allScores(g,10);
    finalgrade=[finalgrade;finalgrad*.4];
end
finalgrade=round(finalgrade);
% Horizontally concatenate all the grades and the allScores matrix.
allScores=[allScores,hwgrade,midgrade,finalgrade];
disp(allScores)

%% Part 2(b)
total=[];
% Use a for loop to add up the three grades for each student and store
% these sums into a column vector. Concatenate this vector with allScores
% and name this matrix grades.
for g=1:i-x
    tota=sum(allScores(g,11:13));
    total=[total;tota];
end
grades=[allScores,total];

%% Part 2(c)
percent=[];
% Use a for loop to calculate the grade percentage of each student using
% Part 2(b)'s data. Store this data into a column vector and concatenate
% it with grades.
for g=1:i-x
    percen=(total(g)/40)*100;
    percent=[percent;percen];
end
percent=round(percent);
grades=[grades,percent];
disp(grades)

%% Part 2(d)
G=[];
% Use a for loop and conditionals to assign a letter grade depending on
% their percentage score from Part 2(c). Assign the letter grades into a
% column vector named G.
for g=1:i-x
    if percent(g)>=90
        letter=['A'];
    elseif percent(g)>=80
        letter=['B'];
    elseif percent(g)>=70 
        letter=['C'];
    elseif percent(g)>=60
        letter=['D'];
    else 
        letter=['E'];
    end
    G=[G;letter];
end
disp(G)
        