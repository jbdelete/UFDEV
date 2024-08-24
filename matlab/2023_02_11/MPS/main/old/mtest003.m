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


    % Set frame range from start to end
    mp.SetTimeRange(1,1);
    % set time step dt
    mp.SetTimeStep(0.005);
    mp.SetVoxelNum(8);
    %mp.readParticleData("../data",'staticData',10);
    mp.ParticleDataReadBIN("J:\VCUBEData\perfdata",'CollisionDataSet2x27x14');
    
    
 % Set various view types
    mp.VPLType = mp.VPLTCUSTOM;
    % zy
    % mp.VViewAngle = [-90,0];
    % xz
    mp.VViewAngle = [-180,0];
    %3d
    mp.VViewAngle = [25,25];
    %xy
    %mp.VViewAngle = [90,90];

