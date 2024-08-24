%******************************************************************
%***      m PROPRIETARY SOURCE FILE IDENTIFICATION               ***
%*******************************************************************
% $Author: jb $
%
% $Date: 2023-03-14 17:48:38 -0400 (Tue, 14 Mar 2023) $
% $HeadURL: https://jbworkstation/svn/svnrootr5/svnmatlab/FieldParticle/@Scene/AddParticle.m $
% $Id: AddParticle.m 5 2023-03-14 21:48:38Z jb $
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
%@normal
%********************************************************************
%***                     SVN CHANGE RECORD                       ***
%*******************************************************************
%*$Revision: 5 $
%*
%*
%******************************************************************/
function P = AddParticleRod(obj,X,Y,Z,R,vx,vy,vz,seq,N,RN,accr,acca,substance)
% AddParticle(obj,X,Y,Z,R,vxy,vyz,Subs)
%   X     = xlocation of particle
%   Y     = ylocation of particle
%   Z     = zlocation of particle
%   R     = radius of particle
%   vx    = x velocity
%   vy    = y velocity
%   vz    = z velocity
%   accr  = rejection force
%   acca  = attractin force
%   substance  = structure containing temp velocity, attraction and 
%            rejection forces (NOT incorporated yet these are hardcoded).
% Returns
%   P     = Particle number.

    % Assign new element to particle structure
    obj.p(obj.ptot)             = StructParticle();
    
    % Set particle number.
    obj.p(obj.ptot).pnum        = obj.ptot;
    P                           = obj.ptot;
    obj.p(P).rnum = N;
    obj.p(P).inrnum = RN;
    % Assign positon
    obj.p(P).rx                 = X;
    obj.p(P).ry                 = Y;
    obj.p(P).rz                 = Z;
    obj.p(P).seq                = seq;
    % Assign whole number locations
    obj.p(P).xpos               = uint32(X);
    obj.p(P).ypos               = uint32(Y);
    obj.p(P).zpos               = uint32(Z);

    
    % Assign radius.
    obj.p(P).radius             = R;

    % Set velocity components. (Actually set in configuration file
    % 'mtestXXX.m'.
    
    obj.p(P).vx                 = vx;
    obj.p(P).vy                 = vy;
    obj.p(P).vz                 = vz;
    obj.p(P).ptype              = 0;
   
    
    obj.p(P).acc_r              = accr;
    obj.p(P).zlink             = zeros(8,4);
    
    

    obj.p(P).vtemp = norm([vx,vy,vz]);

        for ii = 1:obj.tot_subst
            if strcmp(substance,obj.sl(ii).name)
                obj.p(P).sln = ii;
                break;
            end
        end
%##################################################
%$#$##############################################
        if 0
        if obj.p(P).sln == 0
            fprintf('Substance %s, not found particle not added\r\n',...
                substance);
        end
        end
   
if 0
    fprintf('Added Particle #%d %s at x=%0.4f, y=%0.4f, z=%0.4f, R=%0.4f,vx=%0.4f, vy=%0.4f, vz=%0.4f,accr=%0.4f,acca=%0.4f. \r\n',...
    obj.ptot,...
    Subs,...
    obj.p(P).rx,...
    obj.p(P).rx,...
    obj.p(P).rz,...
    obj.p(P).radius,...
    obj.p(P).vx,...
    obj.p(P).vy,...
    obj.p(P).vz,...
    obj.p(P).acc_r,...
    obj.p(P).acc_a);
    
end
    obj.ptot = 1 + obj.ptot;
end