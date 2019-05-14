%% Homework 3 - Andrew Choi - 999796522

%% Problem 1(a)
% Set variables
w = 2640 * pi;
frequency = w / (2 * pi);
% Compute sample rate by using the highest frequency from the function then
% multiply by 0.01 since upper limit is 10 ms
samprate = 16 * frequency * 0.01;
% Make an array for time and the wave function, then plot
t = linspace(0, 0.01, samprate);
func = sin(1760.*pi.*t) + sin(2220.*pi.*t) + sin(2640.*pi.*t);
figure(1)
plot(t,func)
title('Chord Wave Superposition vs Time')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')

%% Problem 1(b)
% Use the end function to keep only every second, fourth, eighth, or
% sixtheenth value in the time array, then make a new function array for
% each corresponding array
halft = t(1:2:end);
halffunc = sin(1760.*pi.*halft) + sin(2220.*pi.*halft) + sin(2640.*pi.*halft);
fourtht = t(1:4:end);
fourthfunc = sin(1760.*pi.*fourtht) + sin(2220.*pi.*fourtht) + sin(2640.*pi.*fourtht);
eightht = t(1:8:end);
eighthfunc = sin(1760.*pi.*eightht) + sin(2220.*pi.*eightht) + sin(2640.*pi.*eightht);
sixteent = t(1:16:end);
sixteenfunc = sin(1760.*pi.*sixteent) + sin(2220.*pi.*sixteent) + sin(2640.*pi.*sixteent);
% Use subplot to make a compound figure of the new made arrays
figure(2)
subplot(2,2,1)
plot(halft,halffunc)
title('Sample Rate x 1/2')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
subplot(2,2,2)
plot(fourtht, fourthfunc)
title('Sample Rate x 1/4')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
subplot(2,2,3)
plot(eightht, eighthfunc)
title('Sample Rate x 1/8')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
subplot(2,2,4)
plot(sixteent,sixteenfunc)
title('Sample Rate x 1/16')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')

%% Problem 1(c)
% Interpolate the arrays from part b to the original values of t 
halfinterp = interp1(halft,halffunc,t);
fourthinterp = interp1(fourtht,fourthfunc,t);
eighthinterp = interp1(eightht,eighthfunc,t);
sixteeninterp = interp1(sixteent,sixteenfunc,t);
% Use the interpolated values of part b to graph against the plot from part
% a using subplots again
figure(3)
subplot(2,2,1)
plot(t,func,t,halfinterp)
title('Ideal Wave vs Half Sample Rate')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
legend('Original Wave','Sample Rate x 1/2')
subplot(2,2,2)
plot(t,func,t,fourthinterp)
title('Ideal Wave vs Fourth Sample Rate')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
legend('Original Wave','Sample Rate x 1/4')
subplot(2,2,3)
plot(t,func,t,eighthinterp)
title('Ideal Wave vs Eighth Sample Rate')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
legend('Original Wave','Sample Rate x 1/8')
subplot(2,2,4)
plot(t,func,t,sixteeninterp)
title('Ideal Wave vs Sixteenth Sample Rate')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')
legend('Original Wave','Sample Rate x 1/16')

%% Problem 1(d)
% Use fprintf to discuss the errors shown from the comparison graph
fprintf('From looking at figure 3 from part c it seems that the less data points we decide to use the higher the \n discrepancies become between the interpolated graphs from part c and the original from part a leading \n to a higher and higher error. \n')

%% Problem 1(e)
% Make logical arrays of values that are less than or equal to abs(1.2)
clipplogic = le(func,1.2);
clipnlogic = ge(func,-1.2);
% Multiply these by the function
clip = clipplogic .* clipnlogic .*func;
% Whatever values are zeros now, turn them into one then multiply the
% positive values by 1.2 and the negatives by -1.2
clipp = ~clipplogic .* 1.2;
clipn = ~clipnlogic .* -1.2;
% Add all the clip arrays together to get the final finished clip then
% plot
finalclip = clip + clipp + clipn;
figure(4)
plot(t,finalclip)
title('Chord Wave Superposition vs Time Clipped at +-1.2')
xlabel('Time (seconds)')
ylabel('Angular Frequency (radians)')

%% Prob 2(a)
% Assign variables
a = 3.01*10^9;
b = 2.74*10^9;
k = ((a^2 - b^2)^.5)/a;
% Make 100 discrete points from 0 to 2pi
theta1 = linspace(0,pi/2,100);
func1 = (1 - k.^2 .* sin(theta1).^2).^.5;
% Compute the integral using Riemann sum method
integral1 = sum(func1) .* ((pi/2)/100);
% Make 1000 discrete points from 0 to 2pi
theta2 = linspace(0,(pi/2),1000);
func2 = (1 - k.^2 .* sin(theta2).^2).^.5;
% Compute the integral using Riemann sum method
integral2 = sum(func2) .* ((pi/2)/1000);
% Compute the two perimeters with the equation given
perim1 = integral1 * 4 * a;
perim2 = integral2 * 4 * a;
fprintf('By using the riemann sum method of integration we obtain that the perimeter of \n the ellipse is %s and %s km when using 100 and 1000 \n discrete points respectively. \n',perim1,perim2)

%% Prob 2(b)
func = @(x) (1 - k.^2 .* sin(x).^2).^.5;
% Compute the integral using Matlab's integral function
i = integral(func,0,pi/2);
% Compute the perimeter
perim3 = i * 4 * a;
% Compute the absolute value of the relative error for the two reults from
% part a using the relative error equation
percenterror1 = abs((perim3 - perim1)/perim3)*100;
percenterror2 = abs((perim3 - perim2)/perim3)*100;
fprintf('The perimeter gained by using the integral function is %s km. The absolute value of the \n relative errors are %f and %f percent respectively \n for the results from part a. \n',perim3,percenterror1,percenterror2)

%% Prob2(c)
% Compute the avgspeeds of part a's result by dividing perimeter by time
avgspeed1 = perim1*1000/(84.3*365*24*3600);
avgspeed2 = perim2*1000/(84.3*365*24*3600);
fprintf('The average speed of Uranus given that a single cycle takes 84.3 years is \n %f and %f m/s when using the perimeters from part a respectively. \n',avgspeed1,avgspeed2)

%% Problem 3(a)
% Assign variables
v = [5 10 15 25 35 40 50 65 80];
fe = [47 72 82 80 71 66 55 42 31];
% Compute coefficients of the third order polynomial
coef = polyfit(v,fe,3);
newv = linspace(0,80,150);
% Compute y values of the polynomial
newfe = polyval(coef,newv);
% Plot original data points and third order polynomial curve
figure(5)
plot(v,fe,'o',newv,newfe)
title('Third Order Polynomial for Velocity versus Fuel Efficiency')
legend('Original Data Points','Third Order Polynomial')
xlabel('Velocity (mph)')
ylabel('Fuel Efficiency (mpg)')

%% Problem 3(b)
% Write out the polynomial function and compute fuel efficiency when
% velocity = 60 mph
polyfunc = @(ve) 0.0008.*ve.^3 - 0.1137.*ve.^2 + 4.1566.*ve + 35.8941;
fewhenveis60 = polyfunc(60);
fprintf('The fuel efficiency of the vehicle at 60mph using a third order polynomial is %f mpg. \n',fewhenveis60)
% Compute velocity when fuel efficiency = 50 mpg using the min function and
% indexing
[i,k] = min(abs(newfe-50));
vewhenfeis50 = newv(k);
fprintf('The velocity of the vehicle when fuel efficiency is around 50mpg using a third \n order polynomial is %f mph. \n',vewhenfeis50)

%% Problem 3(c)
% Use interp1 function to make a linear interpolation of the data points then graph
g = (5:80); 
interpy = interp1(v,fe,g);
figure(6)
subplot(2,1,1)
plot(v,fe,'o',g,interpy)
title('Linear Interpolation for Velocity versus Fuel Efficiency')
legend('Original Data Points','Linear Interpolation')
xlabel('Velocity (mph)')
ylabel('Fuel Efficiency (mpg)')
% Use interp1 function to compute fuel efficency when velocity = 60 mph
linearfeat60 = interp1(v,fe,60);
fprintf('The fuel efficiency of the vehicle at 60mph using linear interpolation is %f mpg. \n',linearfeat60)
% Use spline function to make a cubic spline interpolation of the data points then
% graph
spliney = spline(v,fe,g);
subplot(2,1,2)
plot(v,fe,'o',g,spliney)
title('Cubic Spline Interpolation for Velocity versus Fuel Efficiency')
legend('Original Data Points','Cubic Spline Interpolation')
xlabel('Velocity (mph)')
ylabel('Fuel Efficiency (mpg)')
% Use spline funtion to compute fuel efficiency when velocity = 60 mph
splinefeat60 = spline(v,fe,60);
fprintf('The fuel efficiency of the vehicle at 60mph using cubic spline interpolation is %f mpg. \n',splinefeat60)

%% Problem 3(d)
% Compute relative error percentage between results of part b and c
relerror1 = ((fewhenveis60 - linearfeat60)/fewhenveis60)*100;
relerror2 = ((fewhenveis60 - splinefeat60)/fewhenveis60)*100;
fprintf('The relative error of the fuel efficiency predictions from \n part b and c are %f and %f percent. \n',relerror1,relerror2)

%% Problem 4(a)
% Set variables
t = [0.04 0.08 0.12 0.17 0.43 0.48 0.53 0.58 0.64 0.67 0.75 0.92];
y = [0.59 0.95 0.96 0.45 0.45 0.95 0.89 0.31 -0.59 -0.89 -0.71 0.95];
% Spline the data points from 0 to 1 with 1000 points and then plot the
% original points and new spline
x = linspace(0,1,1000);
r1 = spline(t,y,x);
figure(7)
plot(t,y,'o',x,r1)
title('Ambient Noise Signal')
legend('Original Data Points','Cubic Spline Interpolation')
xlabel('Time (seconds)')
ylabel('Displacement')

%% Problem 4(b)
% Use findpeaks to determine the displacement values of the peaks
peaks = findpeaks(r1);
% Use indexing to find out at which value of the time array two of the peaks are
% located 
[i,k] = min(abs(r1-1.0096));
firstpeaktime = x(k);
[n,g] = min(abs(r1-1.0046));
secondpeaktime = x(g);
% Compute the period by subtracting the two times
period = secondpeaktime - firstpeaktime;

%% Problem 4(c)
% Phase shift one of the graphs by adding half the period to the original
% data points and then spline it
t1 = t + period/2;
r2 = spline(t1,y,x);
% Graph the original date points, the spline, and the phase shift spline
% showing destructive interference
figure(8)
plot(t,y,'o',x,r1,x,r2)
title('Destructive Interference')
legend('Ambient Noise','Wave Form','Phase Shifted Wave')
xlabel('Time (seconds)')
ylabel('Displacement')