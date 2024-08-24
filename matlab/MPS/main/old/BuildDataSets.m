clc
clear all
close all

addpath('J:/sandboxR9/matlab/mps')
addpath('J:/sandboxR9/matlab/mps/common')
addpath('J:/sandboxR9/matlab/mps/main')

Set_CollisionPercent = 0.25;
mp      = mps();
margin  = 0.17;
Prange  = 0.5;
StartX  = 0.5;
StartY  = 0.5;
StartZ  = 0.5;
Dens    = 40;
Fit     = 2.0/Dens;
R       = .15;
D       = 2*R;

possCol = Dens;

ActCol  = ceil(possCol*Set_CollisionPercent);
brkout  = false;
xxt = StartX+R;
yyt = StartY+R;
zzt = StartZ+R;
rang = ceil(Dens/3);
colcount = 0;
for ii = 1:rang
    mp.AddParticle(xxt,yyt,zzt,R,0.0,0.0,0.0,-1.9,0.0,"HE");  
    
    if(colcount < ActCol)
        xxt = xxt+R;
        mp.AddParticle(xxt,yyt,zzt,R,0.0,0.0,0.0,-1.9,0.0,"HE");  
        colcount = colcount+1;
        xxt = xxt+R+margin;
    else
        xxt = xxt+R+margin;
    end
    


    if (xxt > 1.5-R)
        xxt = StartX+R;
         yyt = yyt+R+margin;
    end
    if (yyt > 1.5-R)
         yyt = StartX+R;
         zzt = zzt+R+margin;
    end
    if (zzt > 1.5-R)
         zzt = StartX+R;
    end
end

mp.ptot
mp.plotVoxelSide(0,false);
