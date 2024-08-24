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
function num_parts = GenBenchmarkAddP(mp,RR,cell_numx,cell_numy,cell_numz,num_parts,totparts,pincell,cincell)
    count = 0;
    pcount = 0;
    pnum=0;
    pcell = pincell;


        %(3) Center layer z=1.0
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 8 3-9
                xx = 1.25+cell_numx;
                yy = 1.15+cell_numy;
                zz = 1.0+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
               
            else
                xx = 1.25+cell_numx;
                yy = 1.0+cell_numy;
                zz = 1.0+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 1.25+cell_numx;
				yy = 1.25+cell_numy;
				zz = 1.0+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(4) Center layer z=1.0
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 3 4-10
                xx = 0.75+cell_numx;
                yy = 1.15+cell_numy;
                zz =1.0+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 0.75+cell_numx;
                yy = 1.0+cell_numy;
                zz = 1.0+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 0.75+cell_numx;
				yy = 1.25+cell_numy;
				zz = 1.0+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(5) Center layer z=1.0
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 9 5-7
                xx = 1.15+cell_numx;
                yy = 0.75+cell_numy;
                zz = 1.0+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.0+cell_numx;
                yy = 0.75+cell_numy;
                zz = 1.0+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 1.25+cell_numx;
				yy = 0.75+cell_numy;
				zz = 1.0+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(6) Center layer z=1.0
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 1 6-2
                xx = 1.0+cell_numx;
                yy = 1.40+cell_numy;
                zz = 1.0+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.0+cell_numx;
                yy = 1.25+cell_numy;
                zz = 1.0+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;           
				xx = 1.0+cell_numx;
				yy = 1.5+cell_numy;
				zz = 1.0+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end
        %(8) Center layer z=1.0
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 14 8-27
                xx = 1.10+cell_numx;
                yy = 0.85+cell_numy;
                zz = 1.40+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 0.75+cell_numx;
                yy = 0.75+cell_numy;
                zz = 1.0+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He"); 
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 1.1+cell_numx;
				yy = 0.9+cell_numy;
				zz = 1.4+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end
   
        %(11) Upper layer z = 1.25
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 10 11-17
                xx = 1.25+cell_numx;
                yy = 1.15+cell_numy;
                zz = 1.25+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.25+cell_numx;
                yy = 1.0+cell_numy;
                zz = 1.25+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
                count = count+1;
				xx = 1.25+cell_numx;
				yy = 1.25+cell_numy;
				zz = 1.25+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(12) Upper layer z = 1.25
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 5 12-18
                xx = 0.75+cell_numx;
                yy = 1.15+cell_numy;
                zz = 1.25+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 0.75+cell_numx;
                yy = 1.0+cell_numy;
                zz = 1.25+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 0.75+cell_numx;
				yy = 1.25+cell_numy;
				zz = 1.25+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(14) Upper layer z = 1.25
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 7 14-13
                xx = 1.0+cell_numx;
                yy = 0.85+cell_numy;
                zz = 1.25+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.0+cell_numx;
                yy = 1.25+cell_numy;
                zz = 1.25+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 1.0+cell_numx;
				yy = 0.75+cell_numy;
				zz = 1.25+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
   
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(15) Upper layer z = 1.25
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 11 15-16
                xx = 0.75+cell_numx;
                yy = 0.65+cell_numy;
                zz = 1.25+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.25+cell_numx;
                yy = 0.75+cell_numy;
                zz = 1.25+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 0.75+cell_numx;
				yy = 0.75+cell_numy;
				zz = 1.25+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He"); 
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end
		
        %(19) Bottom layer z = 0.75
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 6 19-25
                xx = 1.25+cell_numx;
                yy = 1.35+cell_numy;
                zz = 0.75+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.25+cell_numx;
                yy = 1.0+cell_numy;
                zz = 0.75+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
                count = count+1;			
				xx = 1.25+cell_numx;
				yy = 1.25+cell_numy;
				zz =  0.75+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(20) Bottom layer z = 0.75
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 4 20-26
                xx = 0.75+cell_numx;
                yy = 1.15+cell_numy;
                zz = 0.75+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 0.75+cell_numx;
                yy = 1.0+cell_numy;
                zz = 0.75+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end 
                num_parts =num_parts + 1;
				count = count+1;
				xx = 0.75+cell_numx;
				yy = 1.25+cell_numy;
				zz = 0.75+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(22) Bottom layer z = 0.75
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 6 22-21
                xx = 1.0+cell_numx;
                yy = 0.85+cell_numy;
                zz = 0.75+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.0+cell_numx;
                yy = 1.25+cell_numy;
                zz = 0.75+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
                num_parts =num_parts + 1;
				count = count +1;
				xx = 1.0+cell_numx;
				yy = 0.75+cell_numy;
				zz = 0.75+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(23) Bottom layer z = 0.75
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 12 23-24
                xx = 0.75+cell_numx;
                yy = 0.60+cell_numy;
                zz = 0.75+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.25+cell_numx;
                yy = 0.75+cell_numy;
                zz = 0.75+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
            end
            num_parts =num_parts + 1;
			count = count +1;
			xx = 0.75+cell_numx;
            yy = 0.75+cell_numy;
            zz =  0.75+cell_numz;
            mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He"); 
    
        end
        if(count == pincell ||num_parts > totparts )
            return;
        end

        %(28) Bottom layer z = 0.75
        count = count+1;
        num_parts=num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 2 28-1
                xx = 1.45+cell_numx;
                yy = 1.45+cell_numy;
                zz = 1.4+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");  
                mp.p(pnum).cflg = 1.0;
            else
                xx = 0.9+cell_numx;
                yy = 1.1+cell_numy;
                zz = 1.4+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
            end
                num_parts =num_parts + 1;
				count = count+1;
				xx = 1.5+cell_numx;
				yy = 1.5+cell_numy;
				zz = 1.5+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
        end

        %29
        count = count+1;
        num_parts =num_parts + 1;
        if(count <= pcell)
            if(pcount < cincell)
                pcount = pcount+1;
                mp.num_collisions = mp.num_collisions+1;
                %Colnum 13 29-30
                xx = 0.85+cell_numx;
                yy = 1.15+cell_numy;
                zz = 0.60+cell_numz;
                pnum=mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");                   
                mp.p(pnum).cflg = 1.0;
            else
                xx = 1.1+cell_numx;
                yy = 0.9+cell_numy;
                zz = 0.6+cell_numz;
                mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
            end
                num_parts =num_parts + 1;
			    count = count+1;
				xx = 0.9+cell_numx;
				yy = 1.1+cell_numy;
				zz = 0.6+cell_numz;
				mp.AddParticleData(xx,yy,zz,RR,[0.0,0.0,0.0],-1.9,0.0,"He");
            if(count == pincell || num_parts > totparts )
                return 
            end
        end
end