%% HW4 Andrew Choi 999796522
%% Problem 1 Part 1
c=0;
% Set up i as an index for the first and second elements
i=[1,2];
% Set up m as the sum of the two last indices so that they can act as the
% upper limit for i as it is looped
m=(length(rnaSequence)-1:length(rnaSequence));
while sum(i)<=sum(m);
    x=rnaSequence(i)==subSequence1;
    % Set up an if statement that makes it so x becomes 1 (true) if both
    % rna elements equal the sub-sequence
    if sum(x)==2;
        x=1;
    % If none or only one of the rna elements equal the sub-sequence then x
    % becomes a 0 (false)
    else sum(x)~=2;
        x=0;
    end
    % i is +1 so that the next two consecutive indices may be tested
    i=i+1;
    % Initially c=0 just so that the vector could exist. [c,x] makes it so
    % that the value of either 1 or 0 is added to the end of c vector
    c=[c,x];
end
% The initial zero of the c vector is removed 
c(1)=[];
% Find the total number of matches by counting the number of 1s
total = sum(c==1);
% Find the index number for each of these matches using find()
[k]=find(c);
fprintf('Part 1: There are %d matches to sub-sequence 1: \n',total)
fprintf('Match 1 is at index %d.\n',k(1))
fprintf('Match 2 is at index %d.\n',k(2))
fprintf('Match 3 is at index %d.\n',k(3))
fprintf('Match 4 is at index %d.\n',k(4))

%% Problem 1 Part 2
c=0;
% All procedures are the same as part 1 except now variables have been
% modified for scanning 3 consecutive values instead of 2
i=[1,2,3];
m=(length(rnaSequence)-2:length(rnaSequence));
while sum(i)<=sum(m);
    x=rnaSequence(i)==subSequence2;
    if sum(x)==3;
        x=1;
    else sum(x)~=3;
        x=0;
    end
    i=i+1;
    c=[c,x];
end
c(1)=[];
total = sum(c(:)==1);
[k]=find(c);
fprintf('Part 2: There are %d matches to sub-sequence 2:\n',total)
fprintf('Match 1 is at index %d.\n',k(1))
fprintf('Match 2 is at index %d.\n',k(2))
fprintf('Match 3 is at index %d.\n',k(3))
fprintf('Match 4 is at index %d.\n',k(4))

%% Problem 1 Part 3
c=0;
% All procedures are same as previous except for a few changes
% Although i is set for four consecutive indices, the if statement is the 
% same as part two's so that only three of the values have to match the sub-sequence
% instead of four since sub-sequence 3 has one value that is unimportant
i=[1,2,3,4];
m=(length(rnaSequence)-3:length(rnaSequence));
while sum(i)<=sum(m);
    x=rnaSequence(i)==subSequence3;
    if sum(x)==3;
        x=1;
    else sum(x)~=3;
        x=0;
    end
    i=i+1;
    c=[c,x];
end
c(1)=[];
total=sum(c(:)==1);
[k]=find(c);
fprintf('Part 3: There are %d matches to sub-sequence 3:\n',total)
fprintf('Match 1 is at index %d.\n',k(1))
fprintf('Match 2 is at index %d.\n',k(2))

%% Problem 2 
% Use inputdlg to have a dialog box appear prompting for a number 
data = inputdlg('Enter a number: ');
num = str2double(data{:});
fprintf('You entered: %d \n',num)
i=4;
% fib1 and fib2 are both set to 1 to resemble the second and third
% fibonnaci numbers
fib1=1;
fib2=1;
% Use if statements for the first three fibonacci numbers since they are
% irregular due to the initial zero
if num==1;
    fprintf('The desired Fibonacci number is 0. \n')
elseif (2<=num) && (num<=3);
    fprintf('The desired Fibonacci number is 1. \n')
else num>3;
    % For all numbers greater than three a while loop is used that imitates
    % the fibonnaci function. The loop is conducted (number entered - 4)
    % times. i.e number = 7   loop is conducted 3 times to achieve the
    % fibonnaci number
    % The variables fib1 and fib2 change their values every loop into the
    % values necessary to compute the consecutive fibonnaci number
    while i<=num
        fib1=fib1+fib2;
        fib2=fib1-fib2;
        i=i+1;
    end
end
fprintf('The desired Fibonacci number is %d. \n',fib1)  

%% Problem 3
adult = 40;
senior = 30;
children = 20;
% Use menu function to to create pop up box
choice = menu('Health Club Membership Menu','1. Standard Adult Membership','2. Child Membership','3. Senior Citizen Membership','4. Quit the Program');
% Use if statements for each of the possible choices
% Then use inputdlg to prompt the user to enter the months
% Depending on the first choice and the number of months entered the cost
% is displayed accordingly
if choice == 1;
    x = inputdlg('Number of Months:');
    months = str2double(x{:});
    cost = adult * months;
    fprintf('A standard adult membership costs $40.00. \n')
    fprintf('You entered %d months. \n',months)
    fprintf('The total charges are $%.2f. \n',cost)
elseif choice == 2;
    x = inputdlg('Number of Months:');
    months = str2double(x{:});
    cost = children * months;
    fprintf('A child membership costs $20.00. \n')
    fprintf('You entered %d months. \n',months)
    fprintf('The total charges are $%.2f. \n',cost)
elseif choice == 3;
    x = inputdlg('Number of Months:');
    months = str2double(x{:});
    cost = senior * months;
    fprintf('A senior citizen membership costs $30.00. \n')
    fprintf('You entered %d months. \n',months)
    fprintf('The total charges are $%.2f. \n',cost)
else choice = 4;
    fprintf('The program is ending. \n')
end

%% Problem 4
p=pinCode;
% Set a variable to equal the pinCode so that the pinCode's intial vector
% does not change
% Set up i as an index for the first and second elements
i=[1,2];
case1 = [1,1];
case2 = [2,2];
case3 = [3,3];
case4 = [4,4];
% Set up m as the sum of the two last indices so that they can act as the
% upper limit for i as it is looped
m=length(p)-1:length(p);
while sum(i)<=sum(m)
    x=(p(i));
    % Construct an if statement for each of the four cases of repetition so 
    % that if the rna-sequence matchs a repetition the first element is
    % converted into a 0
    % Use g=i, g(2)=[], and p(g)=0 so that we can turn the desired element 
    % into a 0 without having to change i
    y=x==case1;
    if sum(y)==2; 
        g=i;
        g(2)=[];
        p(g)=0;
    end
    y=x==case2;
    if sum(y)==2;
        g=i;
        g(2)=[];
        p(g)=0;
    end
    y=x==case3;
    if sum(y)==2;
        g=i;
        g(2)=[];
        p(g)=0;
    end
    y=x==case4;
    if sum(y)==2;
        g=i;
        g(2)=[];
        p(g)=0;
    end
    i=i+1;
end
% Find total number of repetitions by summing up the number of 0s in p
total = sum(p==0);
% Omit all the cases of 0s in p and then set this new vector to be name
% pinCodeFixed
p(p==0)=[];
pinCodeFixed=p;
fprintf('The original pinCode is \n')
disp(pinCode)
fprintf('The fixed pinCode is\n')
disp(pinCodeFixed)
fprintf('There were %d repetitions that were deleted.\n',total)