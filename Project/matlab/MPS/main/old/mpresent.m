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
% mtest001
% Test different collisions between two particles
% THORZXY
%   Horizontal collision along x-axis
% THORZYZ
%   Horizontal collision along z-axis
% THORVERT
%   Vertical collision along y-axis
% TDEG45
%   45 Degree angle collision in xy plane
% TREFLECT45
%   45 Degree reflection collision in xy plane
%-----Test type flags---
THORZXY         = 1;        % Horizontal X-Axis
THORZYZ         = 2;        % Horizontal Z Axis
TVERT           = 3;        % Verticle Yaxis
TDEG45          = 4;        % 45 Degree 
TDEG453         = 5;        % 45 Degree 3D
TREFLECT45      = 6;        % 45 degree reflection
TMULTI          = 7;        % Test multiple concurrent collisions
TSTATIC          = 8;        % Test multiple concurrent collisions
TPART           = 9;

TSType = TSTATIC;
%TSType = THORZXY;
%TSType = THORZYZ;
%TSType = TVERT;
%TSType = TDEG45;
%TSType = TDEG453;
%TSType = TREFLECT45;
%TSType = TMULTI;
%TSType =  TPART;

mp.SetTimeRange(1,1);
mp.SetTimeStep(0.0008);

mp.AddWalls(12.5,11.5,12.5,11.5,1.5,0.5);
if TSType == THORZXY
    mp.AddParticle(11.85,12,1,0.10,1.0,0.0,0.0,-0.5,0.0,"He");
    mp.AddParticle(12.15,12,1,0.10,-1.0,0.0,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];
end

if TSType == THORZYZ
    mp.AddParticle(12.0,12.0,1.2,0.10,0.0,0.0,-1.0,-0.5,0.0,"He");
    mp.AddParticle(12.0,12.0,0.8,0.10,0.0,0.0,1.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    % zy
   % mp.VViewAngle = [-90,0];
    % xz
    mp.VViewAngle = [-180,0];
    
end

if TSType == TVERT
    mp.AddParticle(12.0,11.9,1.0,0.10,0.0,1.0,0.0,-0.5,0.0,"He");
    mp.AddParticle(12.0,12.2,1.0,0.10,0.0,-1.0,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];

end

if TSType == TDEG45
    mp.AddParticle(12.1,12.1,1.0,0.10,-0.5,-0.5,0.0,-0.5,0.0,"He");
    mp.AddParticle(11.95,11.95,1.0,0.10,0.5,0.5,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];
end

if TSType == TDEG453
    mp.AddParticle(12.1,12.1,1.0,0.10,-0.5,-0.5,-0.5,-0.5,0.0,"He");
    mp.AddParticle(11.9,11.9,1.0,0.10,0.5,0.5,0.5,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [45.0,0];
end


if TSType == TREFLECT45
    mp.AddParticle(12.05,12.05,1.17,0.10,-0.5,-0.5,0.0,-0.25,0.0,"He");
    mp.AddParticle(11.95,11.95,1.0,0.10,0.5,0.5,0.0,-0.25,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [45.8813,2.8838];
end

if TSType == TMULTI
    mp.AddParticle(12.0,12.0,1.0,0.10,-0.1,-0.1,0.0,-0.5,0.0,"He"); %1
    mp.AddParticle(12.2,12.2,1.0,0.10,-0.5,-0.5,-0.0,-0.5,0.0,"He"); %2
    mp.AddParticle(11.8,11.8,1.0,0.10,0.5,0.5,0.0,-0.5,-0.5,"He"); % 3
    mp.AddParticle(12.2,11.8,1.0,0.10,-0.5,0.5,0.0,-0.5,-0.5,"He"); % 4
    mp.AddParticle(11.8,12.2,1.0,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He"); % 5
    mp.VPLType = mp.VPLTCUSTOM;
    % zy
    % mp.VViewAngle = [-90,0];
    % xz
    %mp.VViewAngle = [-180,0];
    %3d
    mp.VViewAngle = [25,25];
    %xy
    mp.VViewAngle = [90,90];
end


if TSType == TSTATIC
    mp.AddWalls(13.5,11.5,13.5,11.5,2.5,0.5);
    mp.SetTimeRange(1,1);
    mp.SetVoxelNum(4);
    % set time step dt
    mp.SetTimeStep(0.005);
    mp.AddParticle(12.5,12.5,1.5,0.20,-0.1,-0.1,0.0,-0.5,0.0,"He");
    mp.AddParticle(13.0,12.5,1.0,0.20,-0.5,-0.5,-0.0,-0.5,0.0,"He");
    mp.AddParticle(13.0,13.0,1.5,0.20,0.5,0.5,0.0,-0.5,-0.5,"He");
    mp.AddParticle(13.0,13.2,1.0,0.20,-0.5,0.5,0.0,-0.0,-0.5,"He");
   % mp.AddParticle(12,13,1,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
  %  mp.AddParticle(12,12,1,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
   % mp.AddParticle(12,12,2,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
   % mp.AddParticle(13,12,2,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
  %  mp.AddParticle(13,13,2,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
 %   mp.AddParticle(12,13,2,0.10,0.5,-0.5,0.0,-0.5,-0.5,"He");
 mp.VPLType = mp.VPLTCUSTOM;
    % zy
    %mp.VViewAngle = [-90,0];
    % xz
    %mp.VViewAngle = [-180,00];
    %3d
    mp.VViewAngle = [25,25];
    %xy
    %mp.VViewAngle = [90,90];
    mp.VViewAngle = [60,20];
   % mp.PlotSave('../../../Thesis/imgperm/VCUBE001.png')

end

if TSType == TPART
x1 = [0 1 1 0];
y1 = [0 0 1 1];
z1 = [0 0 0 0];
c1 = [1.0 1.0 1.0];
fill3(x1,y1,z1,c1)

  xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    axis 'padded';
    axis 'square';
ret = 1;
end