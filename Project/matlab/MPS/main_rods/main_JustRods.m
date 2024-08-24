
clc
clear all
close all
clf
AsPoints = false;

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


 mp.AddRod(  11.0,...    % X position
                    15.00,...   % Y Position
                    4.00,...    % Z Position
                    0.20,...    % Radius
                    0.405,...   %Interpatricle distance
                    1,...       % Rod Number
                    5,...       % num particles per rod
                    1.0,...     % sequence Number
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");      % Substance    
hold on
for P = 1:mp.ptot-1

    if(AsPoints == false)
        mp.PlotParticleNumRod(P,true);
    else
        mp.PlotParticlePoint(P);
    end
end
xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    axis equal;
  view([0 0]);
hold off
pdir = '../../../../RCCDRigidFiber/images/';
 if 1
    FigureData.Caption = 'A single rod showing the structure';
    FigureData.FigData =  {  'Name','RodStructure',...
                                    'Scale',0.40,...
                                    'FontSize',9,...
                                    'Title', 'Single Ros.',...
                                    'Directory',pdir,...
                                    'float',false,...
                                    'placement','H';
                                    };
    %FigureData.ImagesNames = [ 'Linearity','Performance'];
    FigureData.ImageHandles = [ gca];
    FigureR9(FigureData);
    %close(H);
end

