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
function ret= GenBenchmarkAddPattern001(mp,RR,...
                                                        layer,...
                                                        xcell,...
                                                        ycell,...
                                                        zcell,...
                                                        numparts,...
                                                        totparts,...
                                                        pincell,...
                                                        cincell)

   
   
    lcount = -1;
    ret =0;
    cols = 0;
    for rows = 0:2:mp.pinrow
        %rows
        cols=0;
        for ii = 1:mp.pinrow
%%===========================================================================
           
            lcount = lcount+1;    
            if(mp.ptotcount > 28)
                1;
            end
            
            if(mp.ptotcount < mp.totparts)
                if(mp.pincellcount <= mp.pincell && lcount < mp.pinlayer)
                    if(mp.cincellcount < mp.cincell)
                        mp.num_collisions = mp.num_collisions+1;
                        %Colnum 8 3-9
                        xx = 0.5+2*mp.centerlen+(2*mp.centerlen*rows)+xcell;
                        yy = 0.5+mp.centerlen+(mp.centerlen*cols)+ycell;
                        zz = 0.5+mp.centerlen+(2*mp.centerlen*layer)+zcell;
                        pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
                        mp.cincellcount = mp.cincellcount+1;
                    else
                        xx = 0.5+mp.centerlen+(2*mp.centerlen*rows)+xcell;
                        yy = 0.5+mp.centerlen+(mp.centerlen*cols)+ycell;
                        zz = 0.5+mp.centerlen+(2*mp.centerlen*layer)+zcell;
                        pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He"); 
                        mp.p(pnum).color = [0.0,0.0,1.0];
                    end
                mp.pincellcount = mp.pincellcount+1;
                mp.ptotcount = mp.ptotcount + 1;
                else %total parts in layer exceeded
                     if(mp.pincellcount >= mp.pincell)
                        ret  = 1;
                    else
                        ret  = 0;
                    end
                    return;
                end
            else %% total parts exceeded
                    ret  = 1 ;
                    return;
            end

%%===========================================================================
            lcount = lcount+1;    
           
            if(mp.ptotcount < mp.totparts)
                if(mp.pincellcount <= mp.pincell && lcount < mp.pinlayer)
			        xx = 0.5+mp.centerlen+(2*mp.centerlen*(rows+1))+xcell;
                    yy = 0.5+mp.centerlen+(mp.centerlen*cols)+ycell;
			        zz = 0.5+mp.centerlen+(2*mp.centerlen*layer)+zcell;
			        pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                    mp.p(pnum).color = [0.0,1.0,0.0];
                    mp.pincellcount = mp.pincellcount+1;
                    mp.ptotcount = mp.ptotcount + 1;
                else %total parts in layer exceeded
                    if(mp.pincellcount >= mp.pincell)
                        ret  = 1;
                    else
                        ret  = 0;
                    end
                    %mp.pincellcount = 0;
                    return;
                end
            else %% total parts exceeded
                    ret  = 1 ;
                    return;
            end
        cols = cols+2;
        end


    end 
end