%% ENG6 HW2 Andrew Choi

%% Problem 1(a)
T = linspace(0,600,1001);
alpha = 4.73 * 10.^-4;
beta = 636;
E = 1.170 - ((alpha .* T .^2)./(T + beta));
figure(1)
plot(T,E)
title('Silicon Band Gap Energy (eV) Versus Temperature (K)')
xlabel('Temperature (K)')
ylabel('Band Gap Energy (eV)')
Eg = E(501);
fprintf('The band gap energy at 300K for silicon is %.3f eV. \n', Eg)

%% Problem 1(b)
T1 = linspace(300,600,501);
E1 = 1.170 - ((alpha .* T1 .^2)./(T1 + beta));
Egg = 1.205 - (2.8 .* 10.^-4) .*T1;
figure(2)
plot(T1,E1,'r',T1,Egg,'b')
xlabel('Temperature (K)')
ylabel('Band Gap Energy (eV)')
legend('Curve Function','Linear Function')
title('Curve and Linear Function Comparison')

%% Problem 2(a)
Rs = 4;
Rl = (0:50);
V = 50;
P = V.^2 .* (Rl./((Rl+Rs).^2));
figure(3)
plot(Rl,P)
title('Power Versus Rl with Rs=4')
xlabel('Load Resistance (ohms)')
ylabel('Power (amps)')

%% Problem 2(b)
Rs2 = 1;
Rs3 = 5;
Rs4 = 10;
P2 = V.^2 .* (Rl./((Rl+Rs2).^2));
P3 = V.^2 .* (Rl./((Rl+Rs3).^2));
P4 = V.^2 .* (Rl./((Rl+Rs4).^2));
%From the graphs it seems that the as the Rs value decreases the P value
%increases significantly intitally. As the three curves start advancing
%Rl=50 the P values start to equal regardless of different Rs values.
figure(4)
plot(Rl,P2,'r',Rl,P3,'b',Rl,P4,'g')
title('Power Versus Rl with Rs=[1,5,10]')
xlabel('Load Resistance (ohms)')
ylabel('Power (amps)')
legend('Rl=1','Rl=5','Rl=10')

%% Problem 3
Year = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
TeamA = [65, 72, 78, 87, 86, 69, 83, 76];
TeamB = [83, 72, 81, 78, 76, 69, 79, 82];
TeamAAheadLogic = [false, false, false, true, true, false, true, false];
TeamAAhead = Year(TeamAAheadLogic);
TeamBAheadLogic = [true, false, true, false, false, false, false, true];
TeamBAhead = Year(TeamBAheadLogic);
TiedYears = Year (xor(~TeamAAheadLogic , TeamBAheadLogic));
disp(TiedYears)

%% Prob4(a)
x = randn(1,1000);
y = rand(1,1000);

%% Prob4(b)
meanx = mean(x);
meany = mean(y);
stdx = std2(x);
stdy = std2(y);

%% Prob4(c)
figure(5)
histogram(x)
title('Histogram of X')
figure(6)
histogram(y)
title('Histogram of Y')
