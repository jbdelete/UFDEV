clc
clear all
%close all
%figure(1)
diameter = 1.0;
p = [diameter/2.0,0.0,0.0];

pr4 = [0,p];
c = [2.0,2.0,2.0];
r = c+p;
%ang = [pi()/32,pi()/32,pi()/32];
ang1 = [0.0,0.0,0.0];
ang = [0.0,0.0,0.0];
vprimex = [0.0,0.0,0.0];
vprimey = [0.0,0.0,0.0];
vprimez = [0.0,0.0,0.0];

for ii = 1:10
    fprintf('%d\r\n',ii);
    clf
    hold on
  % Make unit sphere
    [x,y,z] = sphere;
    % Scale to desire diameter.
    x = x * diameter;
    y = y * diameter;
    z = z * diameter;
    h = surf(x+c(1),y+c(2),z+c(3),...
        'FaceColor',[0.0,0.0,1.0],'FaceAlpha',0.40) ;
    H = vectarrow(c,c+p);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r(1),r(2),r(3),'*b');
    pltFlg = true;
    [vprimex,vprimey,vprimez,vall,h]...
         = rvbqa(p,c,diameter,ang,pltFlg);
  
    axis square
    axis([0.0,4.0,0.0,4.0,0.0,4.0]);
    view([45,45]);
    view([95.907,10.0828]);
    grid on
    hold off
    pause(1.0)
    ang = ang + [0.0,0.0,pi()/32];
end