% Euler's Method Is The Process Of Taking The Slope At A Given Point From
% An Equation And Using That Slope To Project Where The Line Will Be Going
% Next. To Do This, First You Take The Slope Of A Function At A Specific
% Starting Point. Then You (Having Decided How Much You Want To Increase
% Your X By At A Time, AKA How Far Out You Want To Project That Line Based
% On The Slope) Add The Step Value To The Current X Giving You Your Final X
% Coordinate. You Then Take This Step Value And Multiple It By The
% Derivative To Get Your Change In Y (Your Y Step). You Add This Y Step
% Onto Your Current Y Giving You Your Final Y Coordinate. You Then Plot
% These Points And Start The Process Over Again Till You Reach Your Desired
% Final X Coordinate.

fprintf("Welcome To The Euler's Method Solver For LA3\n");
fprintf("Open All Graphs In Full Screen\n");
GUI; %Gets Data From GUI 

while Stepper > UpB %Makes Sure Graph Is Possible By Checking That The UpB Is Less Than The Stepper  
    Stepper=input("You Entered A Step Size Greater Than Your Upper Bound, Please Enter A Different Step Size: ");
end

while Stepper2 > UpB2 %Makes Sure Graph Is Possible By Checking That The UpB2 Is Less Than The Stepper2
    Stepper2=input("You Entered A Step Size Greater Than Your Upper Bound, Please Enter A Different Step Size: ");
end

x = (0:Stepper:UpB); %Initializes X Vector As 'x'
n = numel(x); %Gets Size Of Vector As 'n'

y = (0:Stepper:UpB); %Initalizes Y Vector As 'y'
x(1) = 0; %Initializes First Values Of X As 0 and Y As 1
y(1) = 1; 

emx = (0:Stepper:UpB); %Initializes X And Y Vector For Mid-Point Method As 'emx' And 'emy'
emy = (0:Stepper:UpB);
emx(1) = 0; %Initializes First Values Of X As 0 And Y As 1
emy(1) = 1;


for i = 1:n-1 %Runs A Loop Through The Function To Get All Values Into Function1 Then Into Vector
    [x(i+1),y(i+1)]=LA3Function1(x(i),y(i),Stepper);
end

for em1 = 1:n-1 %Runs A Loop Through The Function To Get All Values Into EulersMid1 Then Into Vector 
    [emx(em1+1),emy(em1+1)]=EulersMid1(x(em1),y(em1),Stepper); 
end

figure(5) %Opens Up A New Figure For Plotting Of Mid-Point Method, Done In A Seperate Figure Because It Is Extra Credit  
subplot(2,1,1); %Divides Up Figure 
plot(emx,emy, "--r", 'LineWidth', 3); %Plots Graph, Labels Graph, Shows Grid, And Sets Range 
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Mid-Point Method Equation 1');
grid on;
sgtitle('Mid-Point Solution');
axis([0 UpB -inf inf]); 
set(gcf,'color','g'); %Sets Figure 4 Background Color As Green

figure(2); %Opens Up A New Figure For Plotting Of Various Methods 
subplot(3,2,1); %Divides The Plot Into Spaces For 3 Different Methods For 2 Equations 
plot(x,y,"--c", 'LineWidth', 2); %Plots Final Answer From My Calculations In Figure 1 
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Euler''s Method Solution');
grid on;
set(gca,'Color','k');
axis([0 UpB -inf inf]); %Sets The Boundaries 

figure(2);%Plots Given Correct Answer For Comparison 
z=0:Stepper:UpB; %Initalizes X Vector For Analytical Solution As 'z'
m = 1+.5*exp(-4.*z)-.5*exp(-2.*z); %Creates Y Vector For Analytical Solution As 'm'
subplot(3,2,3); %Specifies Postion On Figure And How To Plot Graph With Titles 
plot(z,m,"-.r", 'LineWidth', 2);
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Analytical Solution');
grid on;
set(gca,'Color','k');
axis([0 UpB -inf inf]);

figure(2);%Plots MatLabs Solution Via The Ode45 Function 
xspan = 0:Stepper:UpB;  %Initalizes X Vector As 'xspan'
initial_y = 1; %Initializes First Value To Past To Ode45 Function As 'initial_y' At The Value Of 1
[t,k] = ode45(@odefun, xspan, initial_y); %Passes Values To Ode45 Function And Returns X And Y Vectors As 't' And 'k'
subplot(3,2,5); %Specifies Position On Figure And Graphs It 
plot(t,k,":w", 'LineWidth', 2); 
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Ode45 Solution');
grid on;
set(gca,'Color','k');
axis([0 UpB -inf inf]);

figure(3); %Creates New Figure To Plot All Equations Together 
subplot(1,2,1); %Specifies Position On Figure And Graphs All Of Them 
plot(x,y,"--c",z,m,"-.r",t,k,":b", emx, emy, "--r");
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('All Plotted Together');
grid on;
legend({'Euler''s Method Solution','Analytical Solution','Ode45 Solution', 'Mid-Point Solution'}); %Creates Legend For Graph And Labels Equations 
axis([0 UpB -inf inf]);

figure(4); %Creates New Figure For 3D Plotting 
subplot(1,2,1); %Initalizes Z Vectors For Each Graph In Specific Position So Each Graph Can Be Contrasted Next To Each Other
zi = 1*ones(numel(x),1); %Creates Z = 1 Position For A Graph As The Vector 'zi'
zj = 2*ones(numel(x),1); %Creates Z = 2 Position For A Graph As The Vector 'zj'
zk = 3*ones(numel(x),1); %Creates Z = 3 Position For A Graph As The Vector 'zk'
zkk = 4*ones(numel(x),1); %Creates Z = 4 Position For A Graph As The Vector 'zkk'
plot3(x,y,zi,"--c",z,m,zj,"-.r",t,k,zk,":b", emx, emy, zkk, "--r"); %Plots The Graphs In 3D
zlabel('Z-Coordinate');
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('All Plotted Together'); %Titles Graph And Creates Legend 
grid on;
legend({'Euler''s Method Solution','Analytical Soltuion','Ode45 Solution', 'Mid-Point Solution'});
axis([0 UpB -inf inf -inf inf]);

%Work For Second Problem Starts Here

x2 = (0:Stepper2:UpB2); %Initalizes X Vector As 'x2'
n2 = numel(x2); %Gets Size Of Vector As 'n2'

y2 = (0:Stepper2:UpB2); %Initalizes Y Vector As 'y2'
x2(1) = 0; %Initializes First Values Of 'x2' As 0 And 'y2' As 0
y2(1) = 0; 

emx2 = (0:Stepper2:UpB2); %Initalizes X Vector For Mid-Point Method As 'emx2'
emy2 = (0:Stepper2:UpB2); %Initalizes Y Vector For Mid-Point Method As 'emy2'
emx2(1) = 0; %Initalizes First Values Of 'emx2' As 0 And 'emy2' As 0
emy2(1) = 0;

for j = 1:n2-1 %Runs A Loop Through The Function To Get All Values Into Vector Through Equation And Back Into Vector 
    [x2(j+1),y2(j+1)]=LA3Function2(x2(j),y2(j),Stepper2);
end

for em2 = 1:n2-1 %Runs A Loop Through The Function To Get All Values Into Vector Through Equation And Back Into Vector 
    [emx2(em2+1),emy2(em2+1)]=EulersMid2(x2(em2),y2(em2),Stepper2);
end

figure(5)
subplot(2,1,2) %Plots Mid-Point Formula On Seperate Figure 
plot(emx2,emy2,"--r", 'LineWidth', 3);
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Mid-Point Method Equation 2');
grid on;
axis([0 UpB2 -inf inf]);

figure(2); %Plots Final Answer From My Calculations 
subplot(3,2,2);
plot(x2,y2,"--g", 'LineWidth', 2); 
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Euler''s Method Solution');
grid on;
set(gca,'Color','k');
axis([0 UpB2 -inf inf]);

figure(2);
z=0:Stepper2:UpB2; %Plots Given Analytical Solution For Comparison 
f = exp(z./2).*sin(5.*z);
subplot(3,2,4);
plot(z,f,"-m", 'LineWidth', 2);
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Given Answer');
grid on;
set(gca,'Color','k');
axis([0 UpB2 -inf inf]);
sgtitle('First Equation                    Second Equation'); %Sets Title For Whole Figure 

figure(2);
xspan2 = 0:Stepper2:UpB2;  %Initalizes X Domain For Ode45 Solver As 'xspan2'
initial_y2 = 0; %Initalizes First Value Of Y For Ode45 Solver, Creating 'initial_y2' As 0
[t2,k2] = ode45(@odefun2, xspan2, initial_y2); %Passes Values To Ode45 And Returns Values 't2' As X Vector And 'k2' As Y Vector 
subplot(3,2,6); %Plots MatLabs Solution Via The Ode45 function
plot(t2,k2,":b", 'LineWidth', 2);
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('Ode45 Solution');
grid on;
set(gca,'Color','k');
axis([0 UpB2 -inf inf]);

figure(3); %Plots All Graphs Together 
subplot(1,2,2);
plot(t2,k2,":r",z,f,"-m",x2,y2,"--b", emx2, emy2,"--r");
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('All Plotted Together'); %Labels Graph And Creates Legend 
grid on;
legend({'Euler''s Method','Given Answer','Ode45 Solution', 'Mid-Point Method'});
sgtitle('First Equation                    Second Equation'); %Creates Label For Whole Figure 
axis([0 UpB2 -inf inf]);

figure(4);
subplot(1,2,2);%Initalizes Z Vectors For Each Graph In Specific Position So Each Graph Can Be Contrasted Next To Each Other 
z2i = 1*ones(numel(x2),1); %Creates Z = 1 Position For A Graph As The Vector 'z2i'
z2j = 2*ones(numel(x2),1); %Creates Z = 2 Position For A Graph As The Vector 'z2j'
z2k = 3*ones(numel(x2),1); %Creates Z = 3 Position For A Graph As The Vector 'z2k'
z2z = 4*ones(numel(x2),1); %Creates Z = 4 Position For A Graph As The Vector 'z2z'
plot3(t2,k2,z2i,":r",z,f,z2j,"-m",x2,y2,z2k,"--b", emx2, emy2,z2z, "--r"); %Plots Each Graph 
zlabel('Z-Coordinate');
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
title('All Plotted Together');
grid on;
legend({'Euler''s Method Solution','Analytical Solution','Ode45 Solution', 'Mid-Point Solution'});
axis([0 UpB2 -inf inf -inf inf]);
sgtitle('First Equation          3D            Second Equation'); %Labels Whole Figure 

fprintf("Congragulations, You Just Used Euler's Method!\n"); %Fun End Message 

function dydt = odefun(xspan,initial_y) %Creates Function For Ode45 Solver To Use Called 'odefun'
dydt = 2 - exp(-4.*xspan) - 2.*initial_y;
end

function dydt = odefun2(xspan2,initial_y2) %Creates Function For Ode45 Solver To Use Called 'odefun2'
dydt= initial_y2 - .5*exp(xspan2./2)*sin(5.*xspan2) + 5*exp(xspan2./2)*cos(5.*xspan2);
end
