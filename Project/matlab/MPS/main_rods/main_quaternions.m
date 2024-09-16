clc
clear all
%close all
%figure(1)
diameter = 1.0;
c = [2.0,2.0,2.0];
p = [diameter/2.0,diameter/2.0,diameter/2.0];
r = c+p;
vprimex = [];
vprimey = [];
vprimez = [];
combine = true;
ang = [pi()/32,pi()/32,pi()/32];
for ii = 1:10
   fprintf('%d\r\n',ii);
    clf
    hold on
  % Make unit sphere
    [x,y,z] = sphere;
    % Scale to desire radius.
    x = x * diameter;
    y = y * diameter;
    z = z * diameter;
    h = surf(x+c(1),y+c(2),z+c(3),...
        'FaceColor',[0.0,0.0,1.0],'FaceAlpha',0.40) ;
    H = vectarrow(c,c+p);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r(1),r(2),r(3),'*b');
%----------------------------- X ----------------------
    veca = [1.0,0.0,0.0];
    vprimex = rvbq(p, ang(1), veca);
    H = vectarrow(c,c+vprimex);
    ptX = c+vprimex;
    H.LineWidth = 2.0;
    H.Color = [1.0,0.0,0.0];
    plot3(ptX(1),ptX(2),ptX(3),'*r');
%----------------------------- Y ----------------------
    veca = [0.0,1.0,0.0];
    if (combine == true)    
        vprimey = rvbq(vprimex, ang(2), veca);
    else
        vprimey = rvbq(p, ang(2), veca);
    end
    H = vectarrow(c,c+vprimey);
    ptY = c+vprimey;
    H.LineWidth = 2.0;
    H.Color = [0.0,1.0,0.0];
    plot3(ptY(1),ptY(2),ptY(3),'*','Color',H.Color);
    
%----------------------------- Z ----------------------

    veca = [0.0,0.0,1.0];
    if (combine == true)    
        vprimez = rvbq(vprimey, ang(3), veca);
    else
        vprimez = rvbq(p, ang(3), veca);
    end
    H = vectarrow(c,c+vprimez);
    ptZ = c+vprimez;
    H.LineWidth = 2.0;
    H.Color = [0.0,1.0,1.0];
    plot3(ptZ(1),ptZ(2),ptZ(3),'*','Color',H.Color);

%----------------------------- XYZ ----------------------
if 1
    vall = vprimex+vprimey+vprimez;
    ptXYZn = vall%/norm(vall);
    ptXYZ = c+(diameter/2.0)*ptXYZn;
    H = vectarrow(c,ptXYZ); 
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,0.0];
    plot3(ptXYZ(1),ptXYZ(2),ptXYZ(3),'*','Color',H.Color);
end

    axis square
    axis([0.0,4.0,0.0,4.0,0.0,4.0]);
    view([45,45]);
    %view([90,0]);
    grid on
    hold off
    pause(1.0)
    ang = ang+ [pi()/32,pi()/32,pi()/32];
end