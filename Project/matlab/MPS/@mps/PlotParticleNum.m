%******************************************************************
%***      m PROPRIETARY SOURCE FILE IDENTIFICATION               ***
%*******************************************************************
% $Author: jb $
%
% $Date: 2023-03-14 17:48:38 -0400 (Tue, 14 Mar 2023) $
% $HeadURL: https://jbworkstation/svn/svnrootr5/svnmatlab/FieldParticle/@Scene/PlotParticles.m $
% $Id: PlotParticles.m 5 2023-03-14 21:48:38Z jb $
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
function PlotParticleNum(obj,P,PrintNum)
% CalcAccel(obj,P)
% P =   Particle number
    
    % Make unit sphere
    [x,y,z] = sphere;
    % Scale to desire radius.
    radius = obj.p(P).radius;
    x = x * radius;
    y = y * radius;
    z = z * radius;
    % Translate sphere to new location.
    cllr = obj.p(P).color;
    if  obj.p(P).cflg > 0 
        cllr = [1.0,1.0,1.0];
    end
if 0
    if (find([41,34,32,26,24,18,17]==P) )
        cllr = [1.0,1.0,0.0];
    end
end
    obj.p(P).rx=obj.p(P).vecp(1);
    obj.p(P).ry=obj.p(P).vecp(2);
    obj.p(P).rz=obj.p(P).vecp(3);

    if(obj.hasOmega == true)
        
        %angvec = obj.p(P).vecp+obj.p(P).radius*obj.p(P).phi;
        H = vectarrow([obj.p(P).rx,obj.p(P).ry,obj.p(P).rz],...
            [obj.p(P).pltphi(1),obj.p(P).pltphi(2),obj.p(P).pltphi(3)]);
        H.LineWidth = 2.0;
        plot3(obj.p(P).pltphi(1),obj.p(P).pltphi(2),obj.p(P).pltphi(3),'*r');
    end


  
   h = surf(x+obj.p(P).rx,y+obj.p(P).ry,z+obj.p(P).rz,...
        'FaceColor',cllr,'FaceAlpha',0.40) ;
    if PrintNum == true
        t=text(obj.p(P).rx+0.03, obj.p(P).ry+obj.p(P).radius+0.40,...
             obj.p(P).rz+obj.p(P).radius+0.10,sprintf('%d',P),'Color','black');
        t.FontSize = 18;
    end 

end
