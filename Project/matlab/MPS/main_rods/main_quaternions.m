clc
clear all
%close all
%figure(1)
radius = 1.0;
p = [radius/2.0,0.0,0.0];
pr4 = [0,p];
c = [2.0,2.0,2.0];
r = c+p;

ROTX = 1;
ROTY = 2;
ROTZ = 3;
ROTALL = 4;
rotflg = ROTALL;
comflg = 0;
vprimex = [];
vprimey = [];
vprimez = [];

ang = [pi()/32,0.0,0.0];
for ii = 1:10
    clf
    hold on
  % Make unit sphere
    [x,y,z] = sphere;
    % Scale to desire radius.
    x = x * radius;
    y = y * radius;
    z = z * radius;
    h = surf(x+c(1),y+c(2),z+c(3),...
        'FaceColor',[0.0,0.0,1.0],'FaceAlpha',0.40) ;
    H = vectarrow(c,r);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r(1),r(2),r(3),'*b');
    [vprimex,vprimey,vprimez,vall] = rvbq(p, ang);
    
    %X
    if comflg > 0
        plot3([c(1)-1.0,c(1)+1.0],[2.0,2.0],[2.0,2.0],'-r')
        H = vectarrow(c,c+vprimex);
        pt = c+vprimex;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,0.0];
        plot3(pt(1),pt(2),pt(3),'*r');
    
        %Y
        plot3([2.0,2.0],[c(1)-1.0,c(1)+1.0],[2.0,2.0],'-m')
        H = vectarrow(c,c+vprimey);
        pt = c+vprimey;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,1.0];
        plot3(pt(1),pt(2),pt(3),'*m');
    
        %Z    
        plot3([2.0,2.0],[2.0,2.0],[c(1)-1.0,c(1)+1.0],'-y')
        H = vectarrow(c,c+vprimez);
        pt = c+vprimez;
        H.LineWidth = 2.0;
        H.Color = [1.0,1.0,0.0];
        plot3(pt(1),pt(2),pt(3),'*y');
    end
    %XYZ
    H = vectarrow(c,vprimex);
    pt = c+vprimex;
    H.LineWidth = 2.0;
    H.Color = [0.0,1.0,1.0];
    plot3(pt(1),pt(2),pt(3),'*c');
    
    p = vall;
    ang = ang*1.01;
    axis square
    axis([0.0,4.0,0.0,4.0,0.0,4.0]);
    view([45,45]);
    view([0,0]);
    grid on
    hold off
    pause(1.0)
end