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


clc
clear all
close all
fclose all

addpath('J:/sandboxR8/svnmatlab/mps')
addpath('J:/sandboxR8/svnmatlab/mps/common')
addpath('J:/sandboxR8/svnmatlab/mps/main')
addpath 'J:\sandboxR8\svnmatlab\Latex'
mp      = mps();

FILESELECT = 4;

filelist = ["J:/VCUBEData/analysis/ParticleFrameRenderPassStore.csv",...
            "J:/VCUBEData/analysis/ParticleFramevkCmdDraw.csv",...
            "J:/VCUBEData/analysis/ParticleFrameRenderPassClear.csv",...
            "J:/VCUBEData/analysis/ParticleFramevkCmdDispatch.csv"];
opts = detectImportOptions(filelist(FILESELECT));
opts.DataLines = 3;
opts.VariableNamesLine = 1;
T = readtable(filelist(FILESELECT),opts);
mp.ptot = size(T,1);
 for P = 1:mp.ptot
     % Assign new element to particle structure
    mp.p(P)             = StructParticle();
    mp.p(P).pnum        = P;
    if(P==70)
        1;
    end
    
    % Set particle number.
    
    

    % Assign positon
    mp.p(P).rx                 = T{P,2};
    mp.p(P).ry                 = T{P,3};
    mp.p(P).rz                 = T{P,4};

    % Assign radius.
    mp.p(P).radius             = T{P,5};

    span = 4;
    for jj = 1:8
        next = span*(jj-1);
        mp.p(P).zlink(jj,1)    = T{P,18+next};
        mp.p(P).zlink(jj,2)    = T{P,19+next};
        mp.p(P).zlink(jj,3)    = T{P,20+next};
        mp.p(P).zlink(jj,4)    = T{P,21+next};
        
    end
    %mp.DeDup(P);
 end


    
    %colret = mp.CountCollisions();
    for P = 1:mp.ptot
        mp.LinkList(P);
    end

    fprintf('%d collisions, %d particles\r\n',length(mp.colary),mp.ptot);
