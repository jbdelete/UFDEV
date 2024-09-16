function [vprimex,vprimey,vprimez,vall,H] = rvbqa(p,center,diameter,ang,pltFlg)

    pltFlg = false;
    vprimex = [];
    vprimey = [];
    vprimez = [];
    H = 0;
    veca = [1.0,0.0,0.0];
    vprimex = rvbq(p, ang(1), veca);
    if 1
    if(pltFlg == true)
        H = vectarrow(center,center+vprimex);
        ptX = center+vprimex;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,0.0];
        plot3(ptX(1),ptX(2),ptX(3),'*r');
    end
    end

    veca = [0.0,1.0,0.0];
    vprimey = rvbq(vprimex, ang(2), veca);
    if 1
    if(pltFlg == true)
        H = vectarrow(center,center+vprimey);
        ptY = center+vprimey;
        H.LineWidth = 2.0;
        H.Color = [0.0,1.0,0.0];
        plot3(ptY(1),ptY(2),ptY(3),'*','Color',H.Color);
    end
    end

    veca = [0.0,0.0,1.0];
    vprimez = rvbq(vprimey, ang(3), veca);
    if 1
    if(pltFlg == true)
        H = vectarrow(center,center+vprimez);
        ptZ = center+vprimez;
        H.LineWidth = 2.0;
        H.Color = [1.0,0.0,1.0];
        plot3(ptZ(1),ptZ(2),ptZ(3),'*','Color',H.Color);
    end
    end
    vall = vprimex+vprimey+vprimez;
    
    if(pltFlg == true)
        ptXYZ = vall;
        ptXYZ = center+(3.0*diameter)*ptXYZ;
        H = vectarrow(center,ptXYZ); 
        H.LineWidth = 2.0;
        H.Color = [0.0,0.0,0.0];
        plot3(ptXYZ(1),ptXYZ(2),ptXYZ(3),'*','Color',H.Color);
    end
end