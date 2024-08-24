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
    addpath('J:/sandboxR7/svnmatlab/mps')
    addpath('J:/sandboxR7/svnmatlab/mps/common')
    addpath('J:/sandboxR7/svnmatlab/mps/main')

    clc
    clear all
    close all
    mp      = mps();
    
    
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
    
   

    colret = mp.CountCollisions();
    
    
    sideleng = mp.plotVoxelSide(0);
    fprintf("SideLen:%d,ParticleCount:%d,CollisioCount:%d\r\n", sideleng,count,colret);
    flnm = sprintf("CollisionDataSet%dx%dx%d",sideleng,count,colret);
    fprintf("Writing %s\r\n",flnm);
    mp.ParticleDataCreateBIN("J:\sandboxR7\svnvulcan\run\mps\data",flnm);

    for ii = 1:count
        pary = [ ii,mp.p(ii).rx,mp.p(ii).ry,mp.p(ii).rz,RR,0.0,0.0,0.0,-1.9,0.0,0.0,0.0];
        mp.ParticleDataWriteBIN(pary);
    end
    mp.ParticleDataCloseBIN();
