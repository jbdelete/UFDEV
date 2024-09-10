clc
clear all
%close all
%figure(1)
radius = 1.0;
p = [radius,radius/2.0,radius/2.0];
p = [radius,0.0,0.0];
pr4 = [0,p];
c = [2.0,2.0,2.0];
r = c+p;
ang = [pi()/32,pi()/32,pi()/32];
ROTX = 1;
ROTY = 2;
ROTZ = 3;
ROTALL = 4;
rotflg = ROTZ;
comflg = 0;
vprimex = [0.0,0.0,0.0];
vprimey = [0.0,0.0,0.0];
vprimez = [0.0,0.0,0.0];
for ii = 1:35
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
    H = vectarrow(c,...
            c+p);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r(1),r(2),r(3),'*b');
    
    if rotflg==ROTX || rotflg==ROTALL
        p = [0.0,0.0,radius];
        plot3([c(1)-1.0,c(1)+1.0],[2.0,2.0],[2.0,2.0],'-r')
        veca = [1.0,0.0,0.0];
        vprimex = rvbq(p, ang(1), veca);
        H = vectarrow(c,c+vprimex);
        pt = c+vprimex;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,0.0];
        plot3(pt(1),pt(2),pt(3),'*r');
        view([-90,0]);
    end
    % Rotate around y-axis mean vector rotates around x axis
    if rotflg==ROTY || rotflg==ROTALL
        p = [radius,0.0,0.0];
        plot3([2.0,2.0],[c(1)-1.0,c(1)+1.0],[2.0,2.0],'-m')
        veca = [0.0,1.0,0.0];
        if comflg == 0
            vprimey = rvbq(p,ang(2),veca);
        else
            vprimey = rvbq(vprimex,ang(2),veca);
        end
        H = vectarrow(c,c+vprimey);
        pt = c+vprimey;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,1.0];
        plot3(pt(1),pt(2),pt(3),'*m');
        view([180,0]);
    end
    % rotating around the z axis rotates a vector around the y axis
    if rotflg==ROTZ|| rotflg==ROTALL
        p = [0.0,radius,0.0];
        plot3([2.0,2.0],[2.0,2.0],[c(1)-1.0,c(1)+1.0],'-y')
        veca = [0.0,0.0,1.0];
        if comflg == 0
            vprimez = rvbq(p, ang(3),veca);
        else
            vprimez = rvbq(vprimey, ang(3),veca);
        end
        H = vectarrow(c,c+vprimez);
        pt = c+vprimez;
        H.LineWidth = 2.0;
        H.Color = [1.0,1.0,0.0];
        plot3(pt(1),pt(2),pt(3),'*y');
        view([180,90]);
    end

    if comflg == 1
        vall = vprimex+vprimey+vprimez;
        H = vectarrow(c,c+vall);
        pt = c+vall;
        H.LineWidth = 2.0;
        H.Color = [0.0,1.0,1.0];
        plot3(pt(1),pt(2),pt(3),'*c');
    end
    ang = ang+pi()/32.0;
    axis square
    axis([0.0,4.0,0.0,4.0,0.0,4.0]);
    %Around x axis
    
    grid on
    hold off
    pause(1.0)
end