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
addpath('J:/sandboxR9/svnmatlab/mps')
addpath('J:/sandboxR9/svnmatlab/mps/common')
addpath('J:/sandboxR9/svnmatlab/mps/main')

clc
clear all
close all
mp      = mps();
% add walls for 8 voxels
%mp.AddWalls(13.5,11.5,13.5,11.5,2.5,0.5);
% Set to true to record movie

% Run 63 particles in 8 voxels, 2 layers

    % Set up random
    rng(0,'twister');
    % random range between -1.0 and 1.0 velocity.
    %a = -0.25;
    %b = 0.5;
    a = 0;
    b = 2*pi();
    % Plot all 8 voxels
    mp.SetVoxelNum(8);
    mp.ParticleDataCreateBIN("J:\sandboxR7\svnvulcan\run\mps\data",'PlotData2x64');
   % mp.ParticleDataCreateBIN("J:\sandboxR7\svnvulcan\run\mps\data",'PlotData8');
   squr = 1.5;
    xstart = 0.9;
    xend = squr;
    ystart = 0.9;
    yend = squr;
    zstart = 0.9;
    zend = squr;

    margin = 0.20;
    count = 0;
    % Add particles with random velcoities and directions
    for xx = xstart:margin:xend
        for yy = ystart:margin:yend
          for zz = zstart:margin:zend
            count = count+1;
            ang_xy = (b-a).*rand(1,1) + a;
            ang_xz = (b-a).*rand(1,1) + a;
            xv = 0.5*cos(ang_xy);
            yv = 0.5*sin(ang_xy);
            zv = 0.5*sin(ang_xz);  
            
            pary = [   count,...
            xx,...
            yy,...
            zz,...
            0.10,...
            xv,...
            yv,...
            zv,...
            -1.9,...
            0.0,...
            ang_xy,...
            ang_xz...
            ];
            mp.ParticleDataWriteBIN(pary);
            
           end
        end
    end
    fprintf("Total count:%d\r\n",count)
    mp.ParticleDataCloseBIN();
  