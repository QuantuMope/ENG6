%% HW 7 Andrew Choi
%% P1 Task 1
x=(-5:0.05:5);
y1=x.*exp(-x.^2);
y2=1./(1+exp(x));
% Make x an array ranging from -5 to 5 with 0.05 as the interval size so
% that we have enough points to produce a smooth curve.
figure(1)
subplot(2,3,1)
plot(x,y1)
hold on
plot(x,y2,'--')
hold off
grid on
title('Task 1: Plotting on the Plane')
xlabel('X')
ylabel('Y')
legend('y=x*exp(-x^2)','y=1/(1+exp(x))')
% Plot both the functions versus x. Use hold to display both on same graph
% and turn the grid on. Add titles, axis labels, and a legend.

%% P1 Task 2(a)
theta=(0:0.05:2*pi);
r=(cos(5.*theta)).^2+sin(3.*theta)+0.3;
[x,y]=pol2cart(theta,r);
% Make theta a large array ranging from 0 to 2pi.
% Use the pol2cart function so that the polar coordinates are properly
% converted to cartesian ones [x,y].
subplot(2,3,2)
plot(x,y)
% Once plotted we can see that the polar graph has the shape of a butterfly
% hence the name, Butterfly Curve.
title('Task 2: Parametric and Polar Equations, Butterfly Curve')
xlabel('X')
ylabel('Y')
% Add a title and axis labels.

%% P1 Task 2(b)
a=2;
b=3;
wx=3;
wy=5;
deltax=0;
deltay=0;
% Assign all the variables given their values accordingly.
x=a.*cos(wx.*theta-deltax);
y=b.*sin(wy.*theta-deltay);
% Use theta from Task 2(a) for the parametric equations.
subplot(2,3,3)
plot(x,y)
% Plot the two parametric equations to produce the lissajous curves.
title('Task 2: Parametric and Polar Equations, Lissajous Curves')
xlabel('X')
ylabel('Y')
% Add a title and axis labels.

%% P1 Task 3
t=linspace(0,10*pi,1000);
x=t.*sin(5.*t);
y=t.*cos(5.*t);
z=t;
% Create all the variables necessary in order to graph a 3D spiral.
subplot(2,3,4)
plot3(x,y,z,'b')
hold on
plot3(x,y,-z,'b')
hold off
% Plot the first spiral using plot3. In order to get the second upside down
% spiral on the same graph use hold and make all values of z negative.
title('Task 3: 3D Line Plot')
xlabel('X')
ylabel('Y')
zlabel('Z')
% Add a title and axis labels.

%% P1 Task 4(a)
xrow=linspace(-2,2,50);
yrow=linspace(-2,2,50);
% Create large arrays ranging from -2 to 2.
[x,y]=meshgrid(xrow,yrow);
% Use meshgrid to create matrices x and y using the arrays from above. 
z=2.*x.^2+2.*y.^2-4;
subplot(2,3,5)
surf(x,y,z)
% Use surf to plot the surface defined by the parametric equation.
title('Task 4: Surface Plots, A')
xlabel('X')
ylabel('Y')
zlabel('Z')
% Add a title and axis labels.

%% P1 Task 4(b)
urow=linspace(0,6*pi,50);
vrow=linspace(0,2*pi,50);
% Create large arrays ranging from 0 to 6 pi and 0 to 2pi.
[u,v]=meshgrid(urow,vrow);
% Use meshgrid to create matrices u and v using tthe arrasy from above.
x=2.*(1-exp(u./(6.*pi))).*cos(u).*(cos(v./2)).^2;
y=2.*(-1+exp(u./(3.*pi))).*sin(u).*(cos(v./2)).^2;
z=1-exp(u./3.*pi)-sin(v)+exp(u./(6.*pi)).*sin(v);
subplot(2,3,6)
surf(x,y,z)
% Use surf to plot the surface defined by the parametric equations.
title('Task 4: Surface Plots, B')
xlabel('X')
ylabel('Y')
zlabel('Z')
% Add a title and axis labels.

%% P2 Task 1
load 'parrotImage';
% Load the parrot mat file.
grayred=parrotImage;
grayred(:,:,2:3)=[];
figure(2)
subplot(2,2,1)
imshow(grayred)
% To get the grayscale image of the red intensity remove the second and
% third layers from parrotImage so that only the red intensity remains.
% Do the same for green and blue intensity by removing the respective
% layers.
title('Red Intensity')
graygreen=parrotImage;
graygreen(:,:,[1 3])=[];
subplot(2,2,2)
imshow(graygreen)
title('Green Intensity')
grayblue=parrotImage;
grayblue(:,:,1:2)=[];
subplot(2,2,3)
imshow(grayblue)
title('Blue Intensity')
subplot(2,2,4)
imshow(parrotImage)
title('RGB Image')
% Use subplot and imshow to get all the images on one figure. Add
% appropriate titles to each image.

%% P2 Task 2
redparrot=uint8(zeros(size(parrotImage)));
% Make a matrix full of zeros that is the same size as parrotImage.
redparrot(:,:,1)=parrotImage(:,:,1);
% Copy the red layer from parrotImage onto the matrix of zeros.
figure(3)
subplot(2,2,1)
imshow(redparrot)
% Plot this red layer to get the false red image of the parrot. Do the
% above procedure for the green and blue layer as well.
title('Red Intensity')
greenparrot=uint8(zeros(size(parrotImage)));
greenparrot(:,:,2)=parrotImage(:,:,2);
subplot(2,2,2)
imshow(greenparrot)
title('Green Intensity')
blueparrot=uint8(zeros(size(parrotImage)));
blueparrot(:,:,3)=parrotImage(:,:,3);
subplot(2,2,3)
imshow(blueparrot)
title('Blue Intensity')
subplot(2,2,4)
imshow(parrotImage)
title('RGB Image')
% Use subplot and imshow to get all the images on one figure. Add
% appropriate titles to each image.

%% P2 Task 3
figure(4)
subplot(2,2,1)
imshow(parrotImage)
title('Original')
rgparrot=parrotImage;
% Make a copy of parrotImage and then switch the second layer with the
% first layer and the first with the second. Essentially switching the
% green and red colors. Do this for red/blue and green/blue as well.
rgparrot(:,:,2)=redparrot(:,:,1);
rgparrot(:,:,1)=greenparrot(:,:,2);
subplot(2,2,2)
imshow(rgparrot)
title('Red/Green Swapped')
rbparrot=parrotImage;
rbparrot(:,:,1)=blueparrot(:,:,3);
rbparrot(:,:,3)=redparrot(:,:,1);
subplot(2,2,3)
imshow(rbparrot)
title('Red/Blue Swapped')
gbparrot=parrotImage;
gbparrot(:,:,2)=blueparrot(:,:,3);
gbparrot(:,:,3)=greenparrot(:,:,2);
subplot(2,2,4)
imshow(gbparrot)
title('Green/Blue Swapped')
% Use subplot and imshow to get all the images on one figure. Add
% appropriate titles to each image.

%% P3 Task 1
load clown
clownImage=X;
clownColorMap=map;
% Load clown.jpg and assign variables as told on assignment.
colormapimage=zeros(9,9);
% Make a 9x9 matrix of zeros.
colormapimage(1:81)=1:81;
% Assign each indice a consecutive value from 1 to 81.
figure(5)
imagesc(colormapimage)
title('Clown Image Colormap')
colormap(clownColorMap)
% Use imagesc to graph pixelated 9x9 image. Then using the colormap
% function will change the pixel colors to ones pertaining to the original
% clown image. Add an appropriate title.


%% P3 Task 2
figure(6)
imshow(clownImage,gray)
% Use imshow on clownImage along with the matlab colormap gray to get a
% grayscale image off the clown.
title('Clown Image Grayscale')

%% P3 Task 3
customcolormap=rand(81,3);
% In order to generate a custom color map use the rand function to compute
% 81x3 numbers from 0 to 1. This ensures us we will get at least 81 unique
% colors. x3 because it is RGB.
custommap=zeros(9,9);
custommap(1:81)=1:81;
% Make a 9x9 matrix of zeros and assign values as before.
figure(7)
imagesc(custommap)
title('Custom ColorMap')
colormap(customcolormap)
% Use imagesc on the matrix while using the colormap function on the custom
% color map to produce the 9x9 pixelated image.
figure(8)
imshow(clownImage,customcolormap)
% Use imshow on clownImage and by setting the custom map as the map to
% display the clown image with colors from our custom map.
title('Image')







