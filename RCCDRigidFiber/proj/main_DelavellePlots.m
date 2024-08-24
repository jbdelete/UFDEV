clc
clear all
%close all
clf
run('addPath.m');
plot_type = 2;
ary=1;
mcols = 0;
R = 0.20;
mp      = mps();
mp.SetTimeStep(0.001);
mp.SetSystemTemp(250);
% Set the range over which particle properties
% will be calxualted
mp.SetTempRangeLow(1);        % Base temerature low
mp.SetTempRangeHigh(400);        % Base temerature high
% Add the substances.
mp.AddSubstance("He",4.0026022,28,8.3145,-268.9+273.15);
mp.AddSubstance("He2",2*4.0026022,28,8.3145,-268.9+273.15);

pipe_L = 64;
pipe_W = 20;
pipe_H = 20;
Center = 11.0;
Radius = pipe_W/2.0;

st = [];
ct = [];
cz = [];
close all
H = figure(1);
clf
hold on
old_col = 0;
old_row = 0;
plend = 1;
if plot_type == 1
    plend = 1;
end
if plot_type == 2
    plend = 64;
end
for z = 1:1:plend
    old_col = round((pipe_W/2.0)*cos(0)+10);
    old_row = round((pipe_H/2.0)*sin(0)+10);
    Radius = GetDevalleRadius(z);
    for t = 0:pi/100:2*pi-pi/100
        colx = Radius*cos(t)+Center;
        rowy = Radius*sin(t)+Center;
        layer = z;
        if(z == 1)
            st(end+1) = rowy;
            ct(end+1) = colx;
            cz(end+1) = z;
        end
        col = round(colx);
        row = round(rowy);
        
        if(col ~= old_col || row ~= old_row)
            mp.AddParticleBoundary(col,row,layer,...
                                   R,...
                                   round(col),round(row),round(layer));
            old_col = col;
            old_row = row;
        end
    end
    if(z == 1)
        plot3(ct,st,cz,'LineWidth',3,'Color',[0.0,0.0,0.0]);
    end
    ct=[];
    st=[];
    cz=[];
end
mp.ClearBoundaryDups();

totbparts = mp.ptot-1;
%#####################################################
%########################################################################
if plot_type == 0
if 0

   mp.AddParticle(  11.0,...    % X position
                    19.00,...     % Y Position
                    20.00,...     % Z Position
                    0.20,...    % Radius
                    0.0,...     % x velocity
                    0.0,...     % y velocity
                    0.5,...     % z velocity
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
                    
    
    mp.AddParticle( 1.0,...    % X position
                    11.00,...     % Y Position
                    11.00,...     % Z Position
                    0.20,...    % Radius
                    0.000,...     % x velocity
                    0.000,...     % y velocity
                    0.000,...     % z velocity
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
if 0
    mp.AddParticle( 12.85,...    % X position
                    13.00,...     % Y Position
                    12.00,...     % Z Position
                    0.20,...    % Radius
                    0.000,...     % x velocity
                    0.000,...     % y velocity
                    0.000,...     % z velocity
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    

end
else
 seq = 0.0;
 a = 0.01; b = -0.01;
    quitFlag = false;
    divpi = 55.0;
    radius = Radius-1;
    
    for z = 1:1:1
        if(quitFlag == true)
            break;
        end
        divpi = 55.0;
        for radius = Radius-1:-0.42:0
        %for radius = Radius-1:Radius-1 
            if(quitFlag == true)
                break;
            end
            for t = 0:pi()/divpi:2*pi()-pi()/divpi
            %for t = pi()/2.0 : pi()/divpi : pi()/2.0+5*pi()/divpi
                colx = radius*cos(t)+Center;
                rowy = radius*sin(t)+Center;
                vx = 0.0;
                vy = 0.0;
                if 0
                vy =  a + (b-a) .* rand(1,1);
                vx =  a + (b-a) .* rand(1,1);
                end
                if 0
                if(mod(Radius,2)==0)
                    vx = -0.5;
                    vy = 0.5;
                elseif(mod(Radius,3)==0)
                    vx = 0.5;
                    vy = -0.5;
                else
                    vx = 0.5;
                    vy = 0.5;
                end
                end
                vz = 0.5;
                P = mp.AddParticle(colx,...
                        rowy,1,0.20,...
                        vx,vy,vz,...
                        seq,...
                        0.0,0.0,"He");
                if(P == 5797)
                  quitFlag = false;
                   break;
                end
            end
            divpi = divpi-(1.6)^2;
        end
    seq = seq+150;
    end
end
end
%#########################################################################
if plot_type == 1
    mp.VPLType = mp.VPLTXY;
else
if plot_type == 2
    mp.VViewAngle = [34.641902313624669,23.542673521850901]; %XY
end
%mp.VPLType = mp.VPLTCUSTOM;
%mp.VViewAngle = [0,90]; %XY

end
%mp.VPLType = mp.VPLTYZ;
%mp.VViewAngle = [-39.997172236503850,19.636503856041131]; %ANGLE
pfrm = 1;%[876,940];
pto = mp.ptot-1;

mp.plotVoxelSideFTOBoundary(  true,... % As points
                                false,... % number particles
                                            [pipe_W+1,pipe_H+1,pipe_L],... % Cell array boundary
                                            [0.5,0.5,0.5],... %orign
                                            [pipe_W+1,pipe_H+1,0],... %individual cells to draw    
                                            pfrm,...     % array of particles to drae 
                                            pto); % number of paeticle to draw
if plot_type == 1
    axis([0.5,21.5,0.5,21.5,1,2]);
end
hold off
fprintf('Total All particles:%d, Total Boundary parts %d, Total non boundary %d,Sidelength %d\r\n',...
mp.ptot-1,totbparts,mp.ptot-1-totbparts,64)

dirFile = "J:/RCCDData/perfdataM";
flnm = "CDNozBoundaryTest";
mp.SaveDataWTSTV2(dirFile,... % directory
                flnm,... % file name without suffix
                pipe_W,...
                pipe_H,...
                pipe_L,...
                Center,...
                Radius,...
                8,...
                mp.ptot-1); 

fclose all;
if plot_type == 1
    caption = strcat( "A slice of the CD nozzle showing the boundary ",...
                      "passing through cells. A boundary particle, in red, occupioes ",...
                      " each cell containing the boundary.");    

  FigureData.Caption = caption;
    FigureData.FigData =  {  'Name','CDNozBoundaryCellSlice',...
                                    'Scale',0.45,...
                                    'FontSize',9,...
                                    'Title', 'A 2x2 Cell array with various particles.',...
                                    'Directory','J:/RCCDJournalDynamic/images',...
                                    'float',false,...
                                    'placement','H';
                                    };
    %FigureData.ImagesNames = [ 'Linearity','Performance'];
    FigureData.ImageHandles = [ gca];
    FigureR9(FigureData);
    %close(H);
end
if plot_type == 2
    caption = strcat( "The CDN showing all boundary particles.");    

  FigureData.Caption = caption;
    FigureData.FigData =  {  'Name','CDNozBoundaryAll',...
                                    'Scale',0.7,...
                                    'FontSize',9,...
                                    'Title', 'A 2x2 Cell array with various particles.',...
                                    'Directory','J:/RCCDJournalDynamic/images',...
                                    'float',false,...
                                    'placement','H';
                                    };
    %FigureData.ImagesNames = [ 'Linearity','Performance'];
    FigureData.ImageHandles = [ gca];
    FigureR9(FigureData);
    %close(H);
end