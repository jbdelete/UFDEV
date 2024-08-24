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

TSType = TSTATIC;
%TSType = THORZXY;
%TSType = THORZYZ;
%TSType = TVERT;
%TSType = TDEG45;
%TSType = TDEG453;
%TSType = TREFLECT45;
%TSType = TMULTI;

mp.SetTimeRange(1,1);
mp.SetTimeStep(0.0);
mp.SetVoxelNum(2);
mp.AddWalls(5.5,4.5, 6.5,5.5, 2.5,1.5);



  RR = 0.10;
    count = 0;
    count = count+1;
    xx = 1.0;
    yy = 1.0;
    zz = 1.0;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    
    
    count = count+1;
    xx = 1.1;
    yy = 1.1;
    zz = 1.1;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    
    
    count = count+1;
    xx = 1.2;
    yy = 1.2;
    zz = 1.2;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    
    
    count = count+1;
    xx = 1.3;
    yy = 1.3;
    zz = 1.3;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    

    count = count+1;
    xx = 1.4;
    yy = 1.4;
    zz = 1.4;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    

     count = count+1;
    xx = 1.5;
    yy = 1.5;
    zz = 1.5;
    
    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    

    count = count+1;
    xx = 1.60;
    yy = 1.60;
    zz = 1.60;

    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    

    count = count+1;
    xx = 1.70;
    yy = 1.70;
    zz = 1.70;

    mp.AddParticle(xx,yy,zz,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
    

