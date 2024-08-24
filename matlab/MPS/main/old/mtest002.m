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
% Test different collisions between particles and walls
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

TSType          = 0;        % Test type flag
THORZXY         = 1;        % Horizontal X-Axis
THORZYZ         = 2;        % Horizontal Z Axis
TVERT           = 3;        % Verticle Yaxis
TDEG45          = 4;        % 45 Degree 
TDEG453         = 5;        % 45 Degree 3D
TREFLECT45      = 6;        % 45 degree reflection

TSType = THORZXY;
%TSType = THORZYZ;
%TSType = TVERT;
%TSType = TDEG45;
%TSType = TDEG453;
%TSType = TREFLECT45;

mp.endFrame = 100;
mp.SetTimeStep(0.005);

mp.AddWalls(12.5,11.5,12.5,11.5,1.5,0.5);
if TSType == THORZXY
    mp.AddParticle(11.7,12,1,0.10,-1.0,0.0,0.0,-0.5,0.0,"He");
    mp.AddParticle(12.3,12,1,0.10,1.0,0.0,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];
end

if TSType == THORZYZ
    mp.AddParticle(12.0,12.0,1.3,0.10,0.0,0.0,1.0,-0.5,0.0,"He");
    mp.AddParticle(12.0,12.0,0.7,0.10,0.0,0.0,-1.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    % zy
   % mp.VViewAngle = [-90,0];
    % xz
    mp.VViewAngle = [-180,0];
    
end

if TSType == TVERT
    mp.AddParticle(12.0,11.7,1.0,0.10,0.0,-1.0,0.0,-0.5,0.0,"He");
    mp.AddParticle(12.0,12.3,1.0,0.10,0.0,1.0,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [0,90];

end

if TSType == TDEG45
    mp.AddParticle(12.3,12.3,1.0,0.10,0.5,0.5,0.0,-0.5,0.0,"He");
    mp.AddParticle(11.7,11.7,1.0,0.10,-0.5,-0.5,0.0,-0.5,0.0,"He");
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
    mp.AddParticle(12.05,12.05,1.17,0.10,-0.5,-0.5,0.0,-0.5,0.0,"He");
    mp.AddParticle(11.95,11.95,1.0,0.10,0.5,0.5,0.0,-0.5,0.0,"He");
    mp.VPLType = mp.VPLTCUSTOM;
    mp.VViewAngle = [45.8813,2.8838];
end
