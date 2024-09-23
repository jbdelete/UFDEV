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
function outstruct = StructHandler()

	
                hstruct           = struct(... 
                'vel',               struct,...
			    'pos',			     struct,...   % Particle number.
                'orient',         	 struct,...   % Rod Number
				'angvel',			 StructVec3,....
                'hstruct',	 0	); 
				hstruct.vel = StructVec3;
				hstruct.pos = StructVec3;
				hstruct.orient = StructVec3;
				
				
				outstruct = hstruct;

end