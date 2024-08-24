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
function GenBenchmarkData(mp,T,ii,typflg)
%close all


mp.SetTimeStep(0.01);
mp.SetSystemTemp(250);
mp.SetTempRangeLow(1);        % Base temerature low
mp.SetTempRangeHigh(400);        % Base temerature high
mp.AddSubstance("He",4.0026022,28,8.3145,-268.9+273.15);
mp.CalcSubstanceProperties();

wkx = T{ii,1};
wky = T{ii,2};
wkz = T{ii,3};
dkx = T{ii,4};
dky = T{ii,5};
dkz = T{ii,6};
totparts    = T{ii,7};
maxary = T{ii,9};
totcols     = 0;
mp.cdensity    = T{ii,11};
cincell     = 0;
%Any less than 1.0 needs to be fixed
pdensity    = 1.0;
sidelen     = 0;
sidetot     = 0;
num_cells   = 0;
pradius     = T{ii,12};
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
%cdensity = 0.5*cdensity;
%cincell = floor(pincell*cdensity);
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
if 0
       %ary = [24,23,29,30];
        ary = [30,22,20,32,26,29,32,21,25,26,23,24,5];
        %ary = [16,17,25,26];
    else
        ary=1;
    end
if 1

    mcols = mp.CountCollisions();
    %clf
   
    mp.VPLType = mp.VPLTCUSTOM;
    %mp.VViewAngle = [0,90];
    mp.VViewAngle = [-39.997172236503850,19.636503856041131]; %ANGLE
    [H,sidelenc] = mp.plotVoxelSideFT(false,false,false,mp.SideLen,ary,mp.ptot-1);
end
fprintf("Calulated Collisions:%d, Actual Collisions:%d\r\n",2*cincell,objcol); 
if typflg == 0
    flnm = sprintf("%04dCollisionDataSet%dX%dX%d",ii,totparts,objcol,sidelen);
    dirFile = "J:/VCUBEData/perfdataT";
    mp.ParticleDataCreateBIN(dirFile,flnm);
    latex_fl = sprintf('%s/%s_matlab.log',dirFile,flnm);
else
    ddd = int32(100*2*cdensity);
    flnm = sprintf("%04dDCollisionDataSet%dX%dX%d",ii,totparts,objcol,sidelen,ddd);
    dirFile = "J:/VCUBEData/perfdataT";
    mp.ParticleDataCreateBIN(dirFile,flnm);
      
    latex_fl = sprintf('%s/%s_matlab.log',dirFile,flnm);
end
fprintf("Writing %s/%s\r\n",dirFile,flnm);


for ii=1:mp.ptot-1
    pary = [ii,mp.p(ii).rx,...
            mp.p(ii).ry,...
            mp.p(ii).rz,...
            pradius,mp.p(ii).vx,mp.p(ii).vy,mp.p(ii).vz,-1.9,0.0,mp.p(ii).molar_matter,0.0];
    mp.ParticleDataWriteBIN(pary);    
end


WriteConfigData(ii,totparts,...
                   wkx,wky,wkz,...
                   dkx,dky,dkz,...
                   objcol,mp.cdensity,pdensity,...
                   maxary,flnm,dirFile);

mp.ParticleDataCloseBIN();


ptx = fopen (latex_fl, "w", "ieee-le");
if(ptx<0)
    fprintf('Failed to create matlab log\r\n',latex_fl);
    return
end
fprintf(ptx,"Total Particles %d, Part per Cell %d Collsion per Cell %d\r\n",...
totparts,pincell,cincell); 
fprintf(ptx,"Total Particles %d, Total Collisions %d\r\n",mp.ptot-1); 
fprintf(ptx,"Calulated Collisions:%d, Actual Collisions:%d\r\n",2*cincell,objcol); 

fclose(ptx);

end


