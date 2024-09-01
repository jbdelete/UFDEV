%******************************************************************
%***      m PROPRIETARY SOURCE FILE IDENTIFICATION               ***
%*******************************************************************
% $Author: jb $
%
% $Date: 2023-03-14 17:48:38 -0400 (Tue, 14 Mar 2023) $
% $HeadURL: https://jbworkstation/svn/svnrootr5/svnmatlab/FieldParticle/common/StructParticle.m $
% $Id: StructParticle.m 5 2023-03-14 21:48:38Z jb $
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
function outstruct = StructCube()

                cubestruct           = struct(... 
                'pos',                 0.0,...
			    'awake',			    0,...   % Particle number.
                'invInertia',         0,...   % Rod Number
                'c',                  0,...   % in Rod number
				'linVelocity',       0,...   % float x position
                'angVelocity',        0,...   % float y Position
                'mass',               0,...   % Particle mass
                'strend',		        0); 
				
				outstruct = cubestruct;

end