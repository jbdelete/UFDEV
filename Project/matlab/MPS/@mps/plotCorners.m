function plotCorners(obj,X,Y,Z,c,p)
    
    
    
    axlen = 0.003;
    axspan = 0.02;
    xax = [X-axlen,X+axlen];
    yax = [Y-axlen,Y+axlen];
    zax = [Z-axlen,Z+axlen];
    plot3(xax,[Y,Y],[Z,Z],'linewidth',2,'color',[1.0,0.0,0.0])
    plot3([X,X],yax,[Z,Z],'linewidth',2,'color',[1.0,0.0,0.0])
    plot3([X,X],[Y,Y],zax,'linewidth',2,'color',[1.0,0.0,0.0])
    text(X+p(1),Y+p(2),Z+p(3),sprintf('%s',c),'FontSize',18);
end