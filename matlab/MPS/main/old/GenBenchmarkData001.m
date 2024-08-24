%******************************************************************
%***      m PROPRIETARY SOURCE FILE IDENTIFICATION               ***
%*******************************************************************
% $Author: jb $
%
% $Date:  $
% $HeadURL:  $
% $Id:  $
%*******************************************************************
%***                         DESCRIPTION                         ***
%*******************************************************************
%@doc
%@module
%			@author: Jackie Michael Bell
%			COPYRIGHT <cp> Jackie Michael Bell
%			Property of Jackie Michael Bell<rtm>. All Rights Reserved.
%			This source code file contains proprietary
%			and confidential information.
%
%
%@head3 		Description. | 
%               
%@normal
%********************************************************************
%***                     SVN CHANGE RECORD                       ***
%*******************************************************************
%*$Revision:  $
%*
%*
%******************************************************************/

%close all
quit_app    = 1;
pcnt_col    = 0.0;
num_cols    = 0;
num_parts   = 0;
pradius     = 0.09;
pdensity    = 1.0;
pincell     = 0;
sidelen     = 0;
sidetot     = 0;
mcols       = 0;
mp          = mps();
mp.num_collisions = 0;
outpts = [];
mp.SetTimeStep(0.01);
mp.SetSystemTemp(250);
% Set the range over which particle properties
% will be calxualted
mp.SetTempRangeLow(1);        % Base temerature low
mp.SetTempRangeHigh(400);        % Base temerature high
% Add the substances.
mp.AddSubstance("He",4.0026022,28,8.3145,-268.9+273.15);
mp.AddSubstance("He",4.0026022,28,8.3145,-268.9+273.15);

% Calulates substance properties like unit accel, and vel.
mp.CalcSubstanceProperties();


if 0
while(quit_app)
    clc
    num_cols = round(num_parts*pcnt_col);
    pincell = floor(30*pdensity);
    sidetot = floor(num_parts/pincell);
    sidelen = floor(sidetot^(1/2));
    fprintf("===================================================\r\n");
    fprintf("Number of particles to generate:%d\r\n",num_parts);   
    fprintf("Cell density:%0.2f pcnt, %d tot\r\n",pdensity,pincell);  
    fprintf("Max density:%d\r\n",10^2);   
    fprintf("Radius:%0.3f\r\n",pradius);
    fprintf("Percentage of collisions:%0.2f\r\n",pcnt_col);
    fprintf("Total collisions:%d\r\n",num_cols);
    fprintf("Side Length:%d tot %d\r\n",sidelen,sidetot);
    fprintf("===================================================\r\n");
    fprintf("1. Set Particle Count.\r\n");
    fprintf("2. Set Collision Proportion.\r\n");
    fprintf("3. Set Particle Density.\r\n");
    fprintf("4. Generate Data Set.\r\n");

    

    fprintf("10. Quit.\r\n");
    num = input("Enter Menu Item#:");
    switch num
        case 1
            totparts = GenBenchmarkPart();
        case 2
            pcnt_col = GenBenchmarkProp();
        case 3
            pdensity = GenBenchmarkDensity();
        case 4
            quit_app = 0;    
        case 10
            quit_app = 0;
    end
end
end   
typflg = 0;
mnu = 2;
 switch mnu
        case 1
            ret = 3;
        case 2
            ret = 64;
        case 3
            ret = 256;
        case 4
            ret = 1024;
        case 5
            ret = 32768;
        case 6
            %131072;
            ret = 512*16*16;
        case 7
            262144;
            ret = 1024*16*16;
        case 8
            %524288
            ret = 2048*16*16;
        case 9
            %1048576
            ret = 1024*32*32;
        case 10
            %2097152
            ret = 1024*64*32;
        case 11
            %4194304
            ret = 2048*64*32;
        case 12
            % 8388608
            ret = 2048*128*32;
        case 13
            %16777216
            ret = 10005504;
        case 14
            ret = 15002624;
        case 15
            ret = 20009984;
        case 16
            ret = 30004224;
        case 17
            ret = 40008704;
        case 18
            ret = 50002944;
        otherwise
            fprintf("Not a valid response.\r\n");
            return
    end
totparts    = ret;
totcols     = 0;
                                              cdensity    = 0.5;

cincell     = 0;
%Any less than 1.0 needs to be fixed
pdensity    = 1.0;
sidelen     = 0;
sidetot     = 0;
num_cells   = 0;
pradius     = 0.09;
% parts per cell based on pattern which has 30 particles per cell
pincell = floor(30*pdensity);
% Totlal parts divided by parts in cell = number of cells reuired
totcells = ceil(totparts/pincell);
% Side lenght is total cells = sidelength^3
sidelen = ceil(totcells^(1/3));
%num_cells = 
% Total collisions is 
%cdensity = 0.5*cdensity
% Collisions per cell is part in  cell times coll density.
cdensity = 0.5*cdensity;
cincell = floor(pincell*cdensity);
% total collisons are 
totcols = cincell*totcells;

fprintf("Total Particles %d, Part per Cell %d Collsion per Cell %d\r\n",...
totparts,pincell,cincell); 

% parts per cell is total parts minus collision parts
totCparts = totparts-totcols;    

GenBenchmarkUnit(mp,pradius,sidelen,pincell,cincell,totparts);

fprintf("Total Particles %d, Total Collisions %d\r\n",mp.ptot-1); 
objcol = 2*mp.num_collisions;

if 0
    ary = [20,26];
else
    ary=1;
end
sidelen = sidelen+1;
if 1
    mcols = mp.CountCollisions();
    clf
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];
    [H,sidelenc] = mp.plotVoxelSideFT(0,false,sidelen,ary,totparts);
end
fprintf("Calulated Collisions:%d, Actual Collisions:%d\r\n",2*cincell,objcol); 
if typflg == 0
    flnm = sprintf("CollisionDataSet%dx%dx%d",totparts,objcol,sidelen);
    mp.ParticleDataCreateBIN("J:\VCUBEData\perfdataP",flnm);
    latex_fl = sprintf('J:/VCUBEData/perfdataP/%s_matlab.log',flnm);
else
    ddd = int32(100*cdensity);
    flnm = sprintf("DCollisionDataSet%dx%dx%dx%d",totparts,objcol,sidelen,ddd);
    mp.ParticleDataCreateBIN("J:\VCUBEData\perfdataD",flnm);
    latex_fl = sprintf('J:/VCUBEData/perfdataD/%s_matlab.log',flnm);
end
fprintf("Writing %s\r\n",flnm);


for ii=1:totparts
    pary = [ii,mp.p(ii).rx,...
            mp.p(ii).ry,...
            mp.p(ii).rz,...
            pradius,mp.p(ii).vx,mp.p(ii).vy,mp.p(ii).vz,-1.9,0.0,mp.p(ii).molar_matter,0.0];
    mp.ParticleDataWriteBIN(pary);    
end

mp.ParticleDataCloseBIN();


ptx = fopen (latex_fl, "w", "ieee-le");
if(ptx<0)
    fprintf('Failed to create matlab log\r\n',latex_fl);
    return
end
fprintf(ptx,"Total Particles %d, Part per Cell %d Collsion per Cell %d\r\n",...
totparts,pincell,cincell); 
fprintf(ptx,"Total Particles %d, Total Collisions %d\r\n",mp.ptot-1); 
fprintf(ptx,"Calulated Collisions:%d, Actual Collisions:%d\r\n",2*cincell,mcols); 

fclose(ptx);


