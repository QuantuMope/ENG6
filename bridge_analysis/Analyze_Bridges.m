%%% Andrew Choi
%%% 999796522

%% Task 1
fc=funcobs;
sd=structdef;
% Set funcobs and structdef to equal fc and sd respectively just for
% convenience purposes.
totalbridges=sum(sum(total(:,:)));
% Compute the sum of each column sum for total number of bridges built and set
% this to totalbridges.
fprintf('In total, %d bridges exist in the country. \n',totalbridges)
% Use a fprintf statement to display total bridges in the country.

%% Task 2
totalfc=sum(sum(fc(:,:)));
totalsd=sum(sum(sd(:,:)));
% Compute the sum of each column sum for total number of functionally obsolete
% bridges and structurally deficient bridges in the country.
fcperc=perc(totalfc,totalbridges);
sdperc=perc(totalsd,totalbridges);
% Use supporting function perc in order to compute the percentage of
% bridges in the country that are functionally obsolete and structurally
% deficient.
fprintf('%.0f percent of the bridges are functionally obsolete, while %.0f percent are structurally deficient. \n',fcperc,sdperc)
% Use a fprintf statement to display these percentages.

%% Task 3
statetotal=sum(total(:,:),2);
% Create a column array called statetotal of each state's total number of
% bridges by taking each sum of total's row's values.
[mv,mi]=max(statetotal(:));
% Find the max value and the index of that max value by using the max
% function on the column array statetotal.
mostbridges=states{mi};
% Use the max index found above on the cell array states to get the
% corresponding state name and have it assigned to mostbridges.
fprintf('%s has the greatest total number of bridges. \n',mostbridges)
% Use a fprintf statement to display which state has the greatest number of
% bridges.

%% Task 4
statesd=sum(sd(:,:),2);
% Create a column array called statesd of each state's structurally 
% deficient bridges by taking each sum of sd's row's values. 
statesdperc=perc(statesd,statetotal);
% Use supporting function perc using the statesd from above and statetotal 
% from task 3 in order to create a column array of each state's
% structurally deficient bridge percentage. Assign it to statesdperc.
[mv,mi]=max(statesdperc);
% Find the max value and the index of that max value by using the max
% function on the column array statesdperc.
mostsd=states{mi};
% Use the max index found above on the cell array states to get the
% corresponding state name and have it assigned to mostsd.
fprintf('%s has the highest percentage of structurally deficient bridges. %.0f percent are deficient. \n',mostsd,mv)
% Use a fprintf statement to display which state has the highest percentage
% and what that percentage is.

%% Task 5
ninethreesd=sd(:,3);
% Create column array for each state's structurally deficient bridges for
% 1993-1997.
ninethreefc=fc(:,3);
% Create column array for each state's functionally obsolete bridges for
% 1993-1997.
ninethreeprobs=ninethreesd+ninethreefc;
% Add the two previous column arrays to get the total number of faulty
% bridges for each state and call this array ninethreeprobs.
ninethreetotal=total(:,3);
% Create a column array for each state's total number of bridges for
% 1993-1997.
ratio=ninethreeprobs./ninethreetotal;
% Divide ninethreeprobs by ninethreetotal to get a column array of the
% ratios of each state's faulty bridges in 1993-1997.
[mv,mi]=max(ratio(:));
% Find the highest ratio and the max index using the max function on ratio.
ninethreeworst=states{mi};
% Use the max index on states to find the corresponding state name.
ninethreeprob=ninethreeprobs(mi);
% Find the number of faulty bridges using the max index for the state with
% the highest ratio.
ninethreesum=sum(total(mi,3));
% Find the number of total bridges using the max index for the state with
% the highest ratio.
fprintf('%s has the worst 1993-1997 bridges; %d out of %d are deficient or obsolete. \n',ninethreeworst,ninethreeprob,ninethreesum)
% Use a fprintf statement to display the state which has the highest ratio
% of faulty bridges, the number of faulty bridges, and the number of total
% briges built during 1993-1997.

%% Task 6
eighteen=sum(total(:,18:end),2);
% Create a column array called eighteebn of the number of bridges each 
% state built earlier than 1918. 
eighteenperc=perc(eighteen,statetotal);
% Use the supporting function perc on the above column array and statetotal
% from previous tasks to create a column array of each state's percentage
% of bridges built ealier than 1918.
[mv,mi]=max(eighteenperc);
% Find the highest percentage and the index using the max function.
mosteighteen=states{mi};
% Use the max index on states to find the corresponding state name to the
% highest percentage.
eighteentotal=sum(total(mi,:));
% Compute the total number of bridges that state built using the max index
% and the sum function on total.
fprintf('Of all states, %s built the highest percentage of its bridges before 1918. %s has %d bridges in total. \n',mosteighteen,mosteighteen,eighteentotal)
% Use a fprintf statement to display which state had the highest percentage
% of bridges built before 1918, how many bridges were built before, and the
% total number of bridges that state built in total.

%% Task 7
young=sum(total(:,1:10),2);
% Create a column array called young of the number of bridges each state
% bulit within the past 50 years.
lowyoungperc=perc(young,statetotal);
% Use the supporting function perc on the above column array and statetotal
% to create a column array of each state's percentage of bridges built
% within 50 years.
[mv,mi]=min(lowyoungperc);
% Find the lowest percentage and the min index using the min function.
lowyoung=states{mi};
% Use the min index on states to find the corresponding state name to the
% lowest percentage.
fprintf('%s has the fewest new bridges; only %.0f percent are fewer than 50 years old. \n',lowyoung,mv)
% Use a fprintf statement to display which state has the fewest new bridges
% and its percentge of bridges built within 50 years.

%% Task 8
moresd=sum(sd(:,:),2)>sum(fc(:,:),2);
% Create a logical array that computes the sums of each state's structurally
% deficient and functionally obsolete bridges and then sees which have a
% greater amount of structurally deficient amount that functionally
% obsolete.
moresdindex=find(moresd==1);
% Use the find function to find the indices of where the above case is
% true. Store the indices into moresdindex.
moresdavg=mean(sum(total(moresdindex,:),2));
% Use the mean function and moresdindex to compute the average of the
% number of total bridges for states that have more structurally deficient
% bridges than functionally obsolete ones.
fprintf('States with more structurally deficient than functionally obsolete bridges have, on average, %.0f total bridges. \n',moresdavg)
% Use a fprintf statement to display the average value.

%% Task 9
statefc=sum(fc(:,:),2);
% Create a column array called statefc of each state's number of functionally obsolete
% bridges.
statefcperc=perc(statefc,statetotal);
% Use the supporting function perc on the above array and statetotal to
% create a column array of each state's percentage of functionally obsolete
% bridges.
fifteenfc=statefcperc<15;
% Create a logical array called fifteenfcindex to find cases where a
% state's percentage is below 15.
fifteenfcindex=find(fifteenfc==1);
% Use the find function on the above logical array in order to find the
% indices where the above case is true.
fifteensd=sum(sum(sd(fifteenfcindex,:),2));
% With the indicies found above use them to compute the sum of the state's
% sd's column sums in order to find the total amount.
fprintf('There are %d total structurally deficient bridges in states in which fewer than 15 percent of bridges are functionally obsolete. \n',fifteensd)
% Use a fprintf statement to display the total amount of structurally
% deficient bridges for states that have fewer than 15 percent of their
% bridges as functionally obsolete.

%% Task 10
hightolowsd=flipud(sort(statesdperc));
% Use sort on statesdperc to arrange the percentages from lowest to
% highest. Then use flipud to rearrange them from highest to lowest.
highsdpercindex=[];
for g=1:3
    highsdpercinde=find(statesdperc==hightolowsd(g));
    % Use a for loop for g=1:3, since we are looking for the three highest
    % percentages to find the indicies of the states whose percentage
    % matches one of the three highest.
    highsdpercindex=[highsdpercindex,highsdpercinde];
    % Store these indices into an array called highsdpercindex.
end
cellstates=cellstr(states);
% Use cellstr on states for conversion purposes.
topthreesd=cellstates(highsdpercindex);
% Use the indices from highsdpercindex on cellstates to store the names of
% the states with the three highest structurally deficient percentages.
% Store them into topthreesd.
years=1:22;
% Have years range from 1 to 22 to replicate the 22 columns.
figure(1)
title('Number of Structurally Deficient Bridges Built per Data Range')
ylabel('Number of Structurally Deficient Bridges Built')
% Add the appropriate title and y axis label.
hold on
% Use hold to plot all three line graphs.
plot(years,fliplr(sd(highsdpercindex(1),:)),'g')
plot(years,fliplr(sd(highsdpercindex(2),:)),'--b')
plot(years,fliplr(sd(highsdpercindex(3),:)),'-.r')
% Plot each of those state's structurally deficient bridge numbers for each
% year period using the indices from highsdpercindex on the sd matrix. We
% use fliplr so that the year periods go from lowest to high.
xticklabel_rotate([1:22],90,{'No age','< 1907','1907-1912','1913-1917', ...
    '1918-1922','1923-1927','1928-1932','1933-1937','1938-1942', ...
    '1943-1947','1948-1952','1953-1957','1958-1962','1963-1967', ...
    '1968-1972','1973-1977','1978-1982','1983-1987','1988-1992', ...
    '1993-1997','1998-2002','2003-2007'})
% Use the supporting function xticklabel_rotate to add the year periods to
% each of the x ticks and then rotate them 90 degrees for visibility.
legend(topthreesd)
% Add the legend using topthreesd.
hold off  

%% Task 11
hightolowfc=flipud(sort(statefcperc));
% Use sort on statefcperc to arrange the percentages from lowest to
% highest. Then use flipud to rearrange them from highest to lowest.
highfcpercindex=[];
for g=1:3
    highfcpercinde=find(statefcperc==hightolowfc(g));
    % Use a for loop for g=1:3, since we are looking for the three highest
    % percentages to find the indicies of the states whose percentage
    % matches one of the three highest.
    highfcpercindex=[highfcpercindex,highfcpercinde];
    % Store these indices into an array called highfcpercindex.
end
topthreefc=cellstates(highfcpercindex);
% Use the indices from highfcpercindex on cellstates to store the names of
% the states with the three highest functionally obsolete percentages.
% Store them into topthreefc.
figure(2)
title('Number of Functionally Obsolete Bridges Built per Data Range')
ylabel('Number of Functionally Obsolete Bridges Built')
% Add the appropriate title and y axis label.
hold on
% Use hold to plot all three line graphs.
plot(years,fliplr(fc(highfcpercindex(1),:)),'g')
plot(years,fliplr(fc(highfcpercindex(2),:)),'--b')
plot(years,fliplr(fc(highfcpercindex(3),:)),'-.r')
% Plot each of those state's functionally obsolete bridge numbers for each
% year period using the indices from highfcpercindex on the fc matrix. We
% use fliplr so that the year periods go from lowest to high.
xticklabel_rotate([1:22],90,{'No age','< 1907','1907-1912','1913-1917', ...
    '1918-1922','1923-1927','1928-1932','1933-1937','1938-1942', ...
    '1943-1947','1948-1952','1953-1957','1958-1962','1963-1967', ...
    '1968-1972','1973-1977','1978-1982','1983-1987','1988-1992', ...
    '1993-1997','1998-2002','2003-2007'});
% Use the supporting function xticklabel_rotate to add the year periods to
% each of the x ticks and then rotate them 90 degrees for visibility.
legend(topthreefc)
% Add the legend using topthreefc.
hold off  

%% Task 12
i=1;
while i==1;
    % Use a while loop so that if the user does not enter a valid state
    % name in all caps the input request is repeated.
    statename=inputdlg('Enter a State in all Capitals:');
    % Have a input dialog box pop up requesting the user to input a valid
    % state name in all capitals.
    statenamelogic=(strcmp(states,statename));
    % Use strcmp to compare the string entered and the strings stored in
    % states.
    statenamelogic(statenamelogic==0)=[];
    % All cases that are false (0s) are then removed. If there was a match
    % then statenamelogic should simply contain a single 1 for a true case.
    if statenamelogic==1
        stateindex=find(strcmp(states,statename));
        % If there was a true case, meaning that the user inputed a valid
        % entry, then we use strcmp again to find the index where the name
        % entered matches a name in the states array. This index is then
        % stored as stateindex.
        state2007=sum(total(stateindex,1));
        % Using the sum function and stateindex on total, we find that 
        % particular state's number of bridges built during 2003-2007.
        state1997=sum(total(stateindex,3));
        % Using the sum function and stateindex on total, we find that 
        % particular state's number of bridges built during 1993-1997.
        fprintf('You have entered %s. \n',char(statename))
        % Use a fprintf statement to display what the user entered. Use
        % char so that the string can be interpreted properly.
        i=i+1;
        % i becomes 2 so that the while loop is not repeated.
    else
        fprintf('Please enter a state name in all capitals. \n')  
        % Use a fprintf statement prompting the user to input a valid
        % entry.
    end
end
if state2007>state1997
    fprintf('More %s bridges were built in 2003-2007. \n',char(statename))
    % If the particular state's 2003-2007 bridges were higher than its
    % 1993-1997 bridges than a fprintf statement is displays that indicates
    % this.
else 
    fprintf('More %s bridges were built in 1993-1997. \n',char(statename))
    % If the particular state's 2003-2007 bridges were not higher than its
    % 1993-1997 bridges than a fprintf statement is displays that indicates
    % the opposite of the above statement.
end

    










