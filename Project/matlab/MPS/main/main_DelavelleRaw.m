clc
clear all
%close all
clf
addPathCD('matlab/MPS/main')

pipe_L = 64;
pipe_W = 20;
pipe_H = 20;
Center = 11.0;
Radius = pipe_W/2.0;
if 0
st = [];
ct = [];
cz = [];
figure
hold on
for z = 1:1:pipe_L
    Radius = GetDevalleRadius(z);
    for t = 0:pi/100:2*pi
        colx = Radius*cos(t)+Center;
        rowy = Radius*sin(t)+Center;
        cz(end+1) = z;
        st(end+1) = rowy;
        ct(end+1) = colx;
       
    end
    plot3(cz,st,ct);
    st = [];
    ct = [];
    cz = [];
end

hold off
end
%figure
clf
hold on
r = [];
for z = 1:1:pipe_L
    r(end+1) = GetDevalleRadius(z);
end

%Set up cylinder
[SX,SY,SZ] = cylinder(r);
SZ=SZ*pipe_L;
SX=SX+11;
SY=SY+11;

pointB = [];
pointMass = [];
whole_nozzle = 1;
%##### Set starting point and Angle
pos = [2.2,11,16.245];
norpos = pos(1:2)-Center
velvec = 10.0*[0.010,0.051,0.497];
angxy = atan2piPt([norpos(1),norpos(2)])
difanf = (angxy-0.426)*180.0/pi()

% Divisor for point B


%##### Set starting point and Angle

%# Set location of point A
Radius = GetDevalleRadius(pos(3));
pointA(1) = Radius*cos(angxy)+Center;
pointA(2) = Radius*sin(angxy)+Center;
pointA(3) = pos(3);
pointA
XX = [Center,pointA(1)];
YY = [Center,pointA(2)];
ZZ = [pointA(3),pointA(3)];
if whole_nozzle == 1
    plot3(XX,YY,ZZ,'-k','LineWidth',2)
end
plot3(pointA(1),pointA(2),pointA(3),'*k','MarkerSize',5)

%# Set location of point mass
LowZ = pointA(3)+5;
Radius = GetDevalleRadius(LowZ);
pointB(1) = Radius*cos(angxy)+Center;
pointB(2) = Radius*sin(angxy)+Center;
pointB(3) = LowZ;
pointB
XX = [Center,pointB(1)];
YY = [Center,pointB(2)];
ZZ = [pointB(3),pointB(3)];
if whole_nozzle == 1
    plot3(XX,YY,ZZ,'-b','LineWidth',2)
end
plot3(pointB(1),pointB(2),pointB(3),'*b','MarkerSize',5)


%# Set location of point mass
% Same radius as B but add pi()/64 to angle
pointC(1) = Radius*cos(angxy+pi()/64)+Center;
pointC(2) = Radius*sin(angxy+pi()/64)+Center;
pointC(3) = LowZ;
pointC
XX = [Center,pointC(1)];
YY = [Center,pointC(2)];
ZZ = [pointC(3),pointC(3)];
if whole_nozzle == 1
    plot3(XX,YY,ZZ,'-r','LineWidth',2)
end
plot3(pointC(1),pointC(2),pointC(3),'*r','MarkerSize',5)



XX = [Center,pos(1)];
YY = [Center,pos(2)];
ZZ = [Center,pos(3)];
if whole_nozzle == 1
    plot3(XX,YY,ZZ,'-m','LineWidth',2)
end
plot3(pos(1),pos(2),pos(3),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])

%Velocity
XX = [pos(1)-velvec(1),pos(1),];
YY = [pos(2)-velvec(2),pos(2),];
ZZ = [pos(3)-velvec(3),pos(3),];
plot3(XX,YY,ZZ,'-','Color',[0.0,1.0,0.0],'LineWidth',2)

% Get normal vector
[A,B,C,D] = GetPlaneNormal(pointA,pointB,pointC);

% Draw normal vector
normvec = [A,B,C]
XX = [pointA(1),normvec(1)+pointA(1)];
YY = [pointA(2),normvec(2)+pointA(2)];
ZZ = [pointA(3),normvec(3)+pointA(3)];
plot3(XX,YY,ZZ,':','Color',[127.0/255.0,0.0,1.0],'LineWidth',2)
plot3(XX(2),YY(2),ZZ(2),':*','Color',[127.0/255.0,0.0,1.0],'MarkerSize',5)

if 1
%Draw plane
x = [pointA(1) pointB(1) pointC(1)];  
y = [pointA(2) pointB(2) pointC(2)];
z = [pointA(3) pointB(3) pointC(3)];
xLim = [min(x)-2.0 max(x)+2.0];
zLim = [min(z)-2.0 max(z)+2.0];
[X,Z] = meshgrid(xLim,zLim);
Y = (A * X + C * Z + D)/ (-B);
reOrder = [1 2  4 3];
patch(X(reOrder),Y(reOrder),Z(reOrder),'b','LineWidth',2,'FaceAlpha',.5);
end

%############### CALC RESULT VELOCITY
I = [1.0,1.0,1.0];
nvec = normvec/norm(normvec)
reflected = velvec - 2.0*(dot(velvec,nvec)*nvec);
%reflected = cross(normvec,velvec);
rvelvec = reflected
% Draw reflected velocity vector
XX = [pos(1),rvelvec(1)+pos(1)];
YY = [pos(2),rvelvec(2)+pos(2)];
ZZ = [pos(3),rvelvec(3)+pos(3)];
plot3(XX,YY,ZZ,'-*','Color',[1.0,1.0,0.0],'LineWidth',2)

%##############BIGIF
if 0



% Plot slope vector black
slopevec = pointA-pointB;
XX = [pointA(1),pointB(1)];
YY = [pointA(2),pointB(2)];
ZZ = [pointA(3),pointB(3)];
plot3(XX,YY,ZZ,'-','Color',[0.0,0.0,0.0],'LineWidth',2)
plot3(pointMass(1),pointMass(2),pointMass(3),'o',...
    'Color',[0.0,0.0,0.0],'MarkerSize',5)


res = dot(slopevec,normvec);
if(res > 1E-10)
    fprintf('Dot Product failed:%d\r\n',res);
else
    fprintf('Dot Product Correct:%d\r\n',res);
end



%Calc angle of incedence
u = slopevec;
v = velvec;
angi = atan2(norm(cross(u,v)),dot(u,v))

%Angle of reflection
v = slopevec;
u = rvelvec;
angr = atan2(norm(cross(u,v)),dot(u,v))




end


if whole_nozzle == 1
    hm = surf(SX,SY,SZ);
    %rotate(hm, [0 0 1], 90)
    set ( gca, 'xdir', 'reverse' )
    %axis([pos(1)-2,pos(1)+2,pos(2)-2,pos(2)+2,pos(3)-2,pos(3)+2]);
    axis([0,22,0,22,0,64]);
    view([124.075,-58.7244]);
else

    view([-3.0625,-45.172])
    axis([1.5,3,6,18,10,30]);
    set ( gca, 'xdir', 'reverse' )
    %axis([0,22,0,22,0,64]);
end
%view([0 0]); %+Z-X
%view([-180 -90]); %+Y-X

xlabel("X")
ylabel("Y")
zlabel("Z")
grid on
%daspect([2 2 1])
%camup([0 1 0]);
hold off


if whole_nozzle == 1

 if 1
    FigureData.Caption = 'A converging-diverging nozzle showing a boundary collision points tangent plane and vectors.';
    FigureData.FigData =  {  'Name','RCCDBoundaryWhole',...
                                    'Scale',0.45,...
                                    'FontSize',9,...
                                    'Title', 'A 2x2 Cell array with various particles.',...
                                    'Directory','J:/RCCDJournalDynamic/images',...
                                    'float',false,...
                                    'placement','H';
                                    };
    %FigureData.ImagesNames = [ 'Linearity','Performance'];
    FigureData.ImageHandles = [ gca];
    FigureR9(FigureData);
    %close(H);
    end


else
caption = strcat("A plane tangent to a converging-diverging nozzle showing a boundary collision points, tangent plane and vectors. ",...
                 "The black asterisk represents point A ($P_a$), at the same angle and depth as the particle, ",...
                 "but at the radius of the boundary. The blue point B ($P_b$), represents a point at the same angle as the particle, ",...
                 "but down the length of the nozzle at a lower radius. The red point C ($P_c$), represents a point at the same ",...
                 "radius as point B but at a slightly different angle and therefore parallel to it. ",...
                 "These three points constitute independent vectors terminating on a plane tangent to the slope of the nozzle at that point. From these points the ",...
                 "normal of the tangent plane is calculated, $\vec{N}$, which is the mauve dotted line.",...
                 " The green vector is the incoming velocity ($V_{in}$), which is reflected around the normal to produce the ",...
                 " output velocity ($V_{out}$) represented by the yellow line.");
 FigureData.Caption = caption;
    FigureData.FigData =  {  'Name','RCCDBoundaryCPoint',...
                                    'Scale',0.45,...
                                    'FontSize',9,...
                                    'Title', 'A 2x2 Cell array with various particles.',...
                                    'Directory','J:/RCCDJournalDynamic/images',...
                                    'float',false,...
                                    'placement','H';
                                    };
    %FigureData.ImagesNames = [ 'Linearity','Performance'];
    FigureData.ImageHandles = [ gca];
    FigureR9(FigureData);
    %close(H);


end
