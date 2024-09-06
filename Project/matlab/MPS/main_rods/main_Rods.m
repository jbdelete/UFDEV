clc
clear all
%close all
clf

plot_type = 1;
do_plot = true;

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
AsPoints = false;
particleDistance = 0.25;
dt = 0.1;
pause on
run('rods001.m')
for ii = 1:20
    [mcols,colAry,dsq,rsq] = mp.CountCollisions();
    mp.MoveRod(2,dt,mcols,colAry,dsq,rsq)
    clf
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
    axis([10,12,14.5,16]);
    view([0 90]);
    hold off
    pause(0.5)
end