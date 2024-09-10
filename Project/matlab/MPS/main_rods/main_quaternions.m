clc
clear all
%close all
%figure(1)
radius = 1.0;
p = [radius/2.0,radius/2.0,radius/2.0];
pr4 = [0,p];
c = [2.0,2.0,2.0];
r = c+p;
ang = pi()/2;
vprimex = [];
vprimey = [];
vprimez = [];
for ii = 1:1
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
    

    vecx = [1.0,0.0,0.0];
    qx = [cos(ang/2.0),vecx(1)*sin(ang/2.0),vecx(2)*sin(ang/2.0),vecx(3)*sin(ang/2.0)];
    vprimex = rvbq(p, qx);

    vecx = [0.0,1.0,0.0];
    qy = [cos(ang/2.0),vecx(1)*sin(ang/2.0),vecx(2)*sin(ang/2.0),vecx(3)*sin(ang/2.0)];
    vprimey = rvbq(vprimex, qy);

    ang = -1*ang;
    vecx = [0.0,0.0,1.0];
    qz = [cos(ang/2.0),vecx(1)*sin(ang/2.0),vecx(2)*sin(ang/2.0),vecx(3)*sin(ang/2.0)];
    vprimez = rvbq(vprimey, qz);

    H = vectarrow(c,c+vprimex);
    pt = c+vprimex;
    H.LineWidth = 2.0;
    H.Color = [1.0,0.0,0.0];
    plot3(pt(1),pt(2),pt(3),'*r');

    H = vectarrow(c,c+vprimey);
    pt = c+vprimey;
    H.LineWidth = 2.0;
    H.Color = [1.0,0.0,0.0];
    plot3(pt(1),pt(2),pt(3),'*r');

    H = vectarrow(c,c+vprimez);
    pt = c+vprimez;
    H.LineWidth = 2.0;
    H.Color = [1.0,0.0,0.0];
    plot3(pt(1),pt(2),pt(3),'*r');

    vall = vprimex+vprimey+vprimez;

    H = vectarrow(c,c+vall);
    pt = c+vall;
    H.LineWidth = 2.0;
    H.Color = [1.0,0.0,1.0];
    plot3(pt(1),pt(2),pt(3),'*r');

    axis square
    axis([0.0,4.0,0.0,4.0,0.0,4.0]);
    view([45,45]);
    grid on
    hold off
    pause(1.0)
end