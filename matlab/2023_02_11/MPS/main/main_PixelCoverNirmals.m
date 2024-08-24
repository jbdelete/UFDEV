clc
clear all
%close all
[pfxdrv,pfxdir] = addPathCD('matlab/MPS/main');
P = readtable("pixcover.csv");


for zz = 0:0
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

    cxary = P.rr(zstart:zend)-S;
    cyary = P.ss(zstart:zend)-T;
    xary = cxary/abs(cxary);
    yary = cyary/abs(cyary);
    hold on
    
    SS = S/S;
    TT = T/T;
    plot(SS,TT,'o','Color','black')
    t=text(SS,TT,...
           sprintf('<%0.4f,%0.4f>,<%0.4f,%0.4f>',...
            SS,TT,SS,TT),...
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
