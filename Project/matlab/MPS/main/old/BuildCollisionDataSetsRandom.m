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
addpath('J:/sandboxR9/matlab/mps')
addpath('J:/sandboxR9/matlab/mps/common')
addpath('J:/sandboxR9/matlab/mps/main')

clc
clear all
close all

mp      = mps();

    %saveParts = true;
    saveParts = false;
    
    rng(0,'twister');
    run('CollisionDataset4x27x2.m');
    flnm = sprintf("CollisionDataSet%dx%dx%d",0,0,0);
    fprintf("Writing %s\r\n",flnm);
    mp.ParticleDataCreateBIN("J:\sandboxR7Data\perfdata",flnm);

    % Add particles with random velcoities and directions
    for xx = xstart:margin:xend
        for yy = ystart:margin:yend
          for zz = zstart:margin:zend
            count = count+1;
            ang_xy = 0.0;
            ang_xz =0.0;
            xv = 0.0;
            yv = 0.0;
            zv = 0.0;  
             test = (bb-aa)*rand(1,1);
            xxt = (bb-aa)*rand(1,1) + xstart;
            yyt = (bb-aa)*rand(1,1) + ystart;
            zzt = (bb-aa)*rand(1,1) + zstart;
            %xxt = xx;
            %yyt = yy;
            %zzt = zz;
            ii= count;
           pary = [ ii,xxt,yyt,zzt,RR,0.0,0.0,0.0,-1.9,0.0,0.0,0.0];
           mp.AddParticle(xxt,yyt,zzt,RR,0.0,0.0,0.0,-1.9,0.0,"HE");  
            if (xxt > sideleng)
                 sideleng = xxt;
            end
        
            if (yyt > sideleng)
                 sideleng = yyt;
            end
        
            if (zzt > sideleng)
                 sideleng = zzt;
            end

             mp.ParticleDataWriteBIN(pary);
             if mod(ii,10000) == 0
                        
                fprintf("Count: %d \r\n",count);
             end
           end
        end
    end
  
    %mp.PlotParticlePoint();
   % mp.plotVoxelSide(0);
    if 1
    colret = mp.CountCollisions();
    fprintf("Collision count:%d\r\n",colret)
    else
    colret = 0;
    end
    sideleng = round(sideleng);
    density = count/sideleng^3;

    fprintf("Total count:%d Side Length %d density %0.3f\r\n",count,sideleng,density)
    fprintf("SideLen:%d,ParticleCount:%d,CollisioCount:%d\r\n", sideleng,count,colret);
    %flnm = sprintf("CollisionDataSet%dx%dx%d",sideleng,count,colret);
    %flnm = sprintf("CollisionDataSettest");
    
    %for ii = 1:count
   %     pary = [ ii,mp.p(ii).rx,mp.p(ii).ry,mp.p(ii).rz,RR,0.0,0.0,0.0,-1.9,0.0,0.0,0.0];
   %     mp.ParticleDataWriteBIN(pary);
  % end
    mp.ParticleDataCloseBIN();
    
    