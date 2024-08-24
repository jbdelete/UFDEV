clc
clear all
close all
addPathCD('matlab/MPS/main')

outdir = "../../../RCCDData/perfdataV/0000CollisionDataSet32X16X3";
    mp      = mps();
    %newname = extractBefore(files(ii).name,".bin");
    [ret ] = mp.ParticleDataReadBIN("",outdir,1,64);
   

    if 0
       %ary = [24,23,29,30];
        ary = [30,22,20,32,26,29,32,21,25,26,23,24,5];
        %ary = [16,17,25,26];
    else
        ary=1;
    end
    mcols = 0;


if 1
    mcols = mp.CountCollisions();
end
if 1
    clf
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90]; %XY
    mp.VViewAngle = [-39.997172236503850,19.636503856041131]; %ANGLE
    sidelength = 3;%mp.CalcSideLen(30,mp.ptot-1);
    [H,sidelenc] = mp.plotVoxelSideFT(false,... % As points
                                      false,... % plot bopinding box
                                      false,... % Plot axis in cell 1
                                      true,...  % plot cells   
                                      sidelength,... 
                                      ary,...
                                      mp.ptot-1);
    
end
    
    fprintf('Total particles:%d, Total Collsions %d, Sidelength %d\r\n',mp.ptot-1,mcols,sidelength)
    
fclose all;
