%%ENG6 Homework 1 Andrew Choi 

%%Problem 1
a=4.5;
b=6;
angle=35;    
c = sind(angle) * a;
area = .5 * a * c;
fprintf('Problem 1 : The area of the triangle is %f units cubed. \n', area)

%%Problem 2
pintsperliter = 1.76;
pintspergallon = 8;
vtank = (2 * pintspergallon / pintsperliter) + (4 / pintsperliter) ;
fprintf('Problem 2 : The volume of the tank is %f pints. \n',vtank)

%%Problem 3
% Part 1 a1 should equal b1
x  = pi / 9;
a1 = sin(4*x);
b1 = 4 * sin(x) * cos(x)- 8 * sin(x)^3 * cos(x);
fprintf('Problem 3.1 : The functions are identities since %f = %f. \n', a1, b1)
% Part 2 a2 should equal b2
a2 = cos(2*x);
b2 = 1 - 2* sin(x)^2;
fprintf('Problem 3.2 : The functions are identities since %f = %f. \n', a2, b2)

%%Problem 4
h = 9/12;
r = 1.5/12;
vCone = pi * r^2 * h/3;
vHemis = pi * r^3 * 2/3;
vTotal = vCone + vHemis;
gallons = vTotal / 6.5;
weight = gallons * 10;
fprintf ('Problem 4 : The ice cream will weigh %f pounds. \n', weight)

%%Problem 5
r1 = 90;
h1 = 1700;
r2 = 825;
h2 = 208.16;
density = 2900;
vHemis = pi * r1 ^3 * 2/3;
vCone1 = pi * r2 ^2 * (h1+h2)/3;
vCone2 = pi * r1 ^2 * h2/3;
vVolc = vCone1 - vCone2 - vHemis;
mVolc = density * vVolc;
fprintf ('Problem 5.1 : The volume of the volcano is %f meters cubed. \n', vVolc)
fprintf ('Problem 5.2 : The mass of the volcano is %f kilograms. \n', mVolc)