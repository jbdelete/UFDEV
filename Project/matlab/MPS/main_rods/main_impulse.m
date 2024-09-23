clc
clear all
%close all
clf
%Instantiate massive particle system
mp      = mps();
%mp.FillDiamond();
%------------------ Start ignore for now.
mp.SetTimeStep(0.008);
mp.SetSystemTemp(250);
% Set the range over which particle properties
% will be calxualted
mp.SetTempRangeLow(1);        % Base temerature low
mp.SetTempRangeHigh(400);        % Base temerature high
% Add the substances.
mp.AddSubstance("He",4.0026022,28,8.3145,-268.9+273.15);
mp.AddSubstance("He2",2*4.0026022,28,8.3145,-268.9+273.15);
%--------------------------SEnd ignore for now.

% Add particle
mp.AddParticle( 0.0,... % real x position
                0.0,... % real y position
                4.01,... % real z position
                1.0,...% radius
                0.0,... %  x velocity
                0.0,... %  y velocity
                0.0,... %  z velocity
                0.0,... % Sequence (flow)
                0.0,... % repulsive acceleration
                0.0,... % attraction acceleration     
                "He"); % Substance

mp.AddParticle(0.0,0.0,0.0,1.0,0.0,0.0,0.0,0,0.0,0.0,"He");

mp.p(1).omega   = [1.0,0.0,0.0];
mp.p(2).omega   = [0.0,0.0,0.0];
mp.p(1).phi     = [0.0,0.0,0.0];
mp.p(2).phi     = [0.0,0.0,0.0];
mp.p(1).elas    = 1.0;
mp.p(2).elas    = 1.0;
mp.p(1).h = StructHandler();
mp.p(2).h = StructHandler();
mp.p(1).vecg    = [0.0,0.0,-10.0];
mp.p(2).vecg    = [0.0,0.0,0.0];
mp.p(1).orient = [0.0, 0.0, 0.0, 1.0];
mp.p(2).orient = [0.0, 0.0, 0.0, 1.0];
mp.p(1).inertiaTensor = (2.0/5.0)*[1.0,0.0,0.0;0.0,1.0,0.0;0.0,0.0,1.0]';
mp.p(2).inertiaTensor = (2.0/5.0)*[1.0,0.0,0.0;0.0,1.0,0.0;0.0,0.0,1.0]';
mp.p(1).philoc = [mp.p(1).radius/2.0,0.0,0.0];
mp.p(2).philoc = [mp.p(2).radius/2.0,0.0,0.0];
mp.p(1).mass = 1.0;
mp.p(2).mass = 0.0;
mp.p(1).invmass = 1.0/mp.p(1).mass;
if(isinf(mp.p(1).invmass))
    mp.p(1).invmass = 0.0;
end
if(isinf(mp.p(2).invmass))
    mp.p(2).invmass = 0.0;
end



% Accelration
acc         = 0.1;
quit_flag   = false;
mp.hasOmega = true;
ang         = [0.0,0.0,0.0];
colcount    = 0;
endcnt      = 20;

mp.movie_dir    = 'J:\RCCDData\movie';
mp.movie_name   = 'impulse';
mp.movie_flg    = false;
mp.MovieStartPlot();

for ii = 1:endcnt
    ii
    clf
    hold on

    % apply gravity acceleration
    impulse = mp.p(1).vecg*mp.p(1).mass*mp.dt;
    mp.ApplyImpulseLinear(1,impulse)

    impulse = mp.p(2).vecg*mp.p(2).mass*mp.dt;
    mp.ApplyImpulseLinear(2,impulse)

    [colCount,colAry,dsq,rsq] = mp.CountCollisions();
    if(colcount < 1 && colCount > 0)
        colcount = colcount+1;    
        % Do the collision impulse resolution
        mp.CollisionImpulse(1,2);
    end
    
   mp.update(1)
   %mp.update(2)
   fprintf('Orientation P1:<%0.5f,%0.5f,%0.5f>\r\n',...
            mp.p(1).orient(1),mp.p(1).orient(2),mp.p(1).orient(3));
    
    mp.hasOmega = true;
    if 1
        % Plot as spheres
        for P = 1:mp.ptot-1
            mp.PlotParticleNum(P,true);
        end
    else
        % Plot as points
        mp.PlotParticlePoint();
    end
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    axis square
    %axis ([0.0 3.0,0.0,1.0,0.0,1.0]);
    axis ([-2.0 2.0,-2.0,2.0,-1.0,7.0]);
    daspect([1,1,1]);
    %view([-0.0875,41.039516129032258]);
    %view([0,90]); %YX
    view([0,0]); %xz
    %view([43.308740359897186,37.359640102827768]);
    %view([56.0654,11.4362]);
    hold off
    mp.MovieSavePlot();
    if (quit_flag == true)
        break;
    end
   
    pause(0.5)
end
mp.MovieClosePlot();
