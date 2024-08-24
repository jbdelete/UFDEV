clc
clear all
%close all
[pfxdrv,pfxdir] = addPathCD('matlab/MPS/main');
P = readtable("pixcover.csv");
cclr = [];
for zz = 0:2
    figure(zz+1)
    clf
    cclr = [1.0,0.0,0.0];
    zstart = 10+zz*9;
    zend =  zstart+8;
    S = (P.s(zstart+1));
    T = (P.r(zstart+1));

    X = round(S)-S;
    Y = round(T)-T;
    if(X < 0)
        S = round(S)+0.5;
    else
        S = round(S)-0.5;
    end

    if(Y < 0)
        T = round(T)+0.5;
    else
        T = round(T)-0.5;
    end

    xary = P.rr(zstart:zend);
    yary = P.ss(zstart:zend);
    hold on

    plot(S,T,'o','Color','black')
    t=text(S,T,...
           sprintf('<%0.4f,%0.4f>,<%0.4f,%0.4f>',...
            P.s(zstart+1),P.r(zstart+1),S,T),...
           'Color','black');
    t.FontSize = 12;

    plot(xary,yary,'*','Color',cclr)
    for ii = 1:length(xary)
        t=text(xary(ii),yary(ii),...
               sprintf('%d<%0.4f,%0.4f>',ii,...
                xary(ii),yary(ii)),...
               'Color','red');
        t.FontSize = 12;
    end
    grid on
    %axis([-1.5,1.5,-1.5,1.5]);
    hold off
end


viewport.x = 0;
viewport.y = 0;
viewport.w = 1000;
viewport.h = 1000;
gl_Position.x = -0.333333;
gl_Position.y = -0.166667;
gl_Position.w = 1;
gl_FrageCoord.x = viewport.x + viewport.w * (1 + gl_Position.x / gl_Position.w)/2
gl_FrageCoord.x = viewport.y + viewport.h * (1 + gl_Position.y / gl_Position.w)/2



if 0
figure(2)
clf
hold on 
diff = 0;
xary = P.pcoordx(1:9);
yary = P.pcoordy(1:9);

cclr = [1.0,0.0,0.0];
plot(xary,yary,'*','Color','black')
xary = P.pcoordx(10:18);
yary = P.pcoordy(10:18);
plot(xary,yary,'*','Color',cclr)
for ii = 1:length(xary)
t=text(xary(ii),yary(ii),...
           sprintf('%d<%0.4f,%0.4f|<%0.4f,%0.4f>',ii,...
            xary(ii),yary(ii),xary(ii)+P.tt(ii),yary(ii)+P.ww(ii)),...
           'Color','black');
    t.FontSize = 12;
end
grid on
axis([0.0,1.0,0.0,1.0]);
hold off


figure(3)
clf
hold on 
diff = 0;
xary = P.pcoordx(1:9);
yary = P.pcoordy(1:9);

cclr = [1.0,0.0,0.0];
plot(xary,yary,'*','Color','black')
xary = P.pcoordx(19:27);
yary = P.pcoordy(19:27);
plot(xary,yary,'*','Color',cclr)
for ii = 1:length(xary)
t=text(xary(ii),yary(ii),...
           sprintf('%d<%0.4f,%0.4f|<%0.4f,%0.4f>',ii,...
            xary(ii),yary(ii),xary(ii)+P.t(ii),yary(ii)+P.w(ii)),...
           'Color','black');
t.FontSize = 12;
end
grid on
axis([0.0,1.0,0.0,1.0]);
hold off
end