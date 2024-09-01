clc
clear all
close all
clf
%Instantiate massive particle system
mp      = mps();

%------------------ Start ignore for now.
mp.SetTimeStep(0.001);
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
mp.AddParticle( 1.0,... % real x position
                0.5,... % real y position
                0.5,... % real z position
                0.20,...% radius
                0.08,... %  x velocity
                0.0,... %  y velocity
                0.0,... %  z velocity
                0.0,... % Sequence (flow)
                0.0,... % repulsive acceleration
                0.0,... % attraction acceleration     
                "He") % Substance

mp.AddParticle(1.5,0.5,0.5,0.20,-0.08,0.0,0.0,0,0.0,0.0,"He")
mp.p(1).mass = 1.0;
mp.p(2).mass = 1.0;
% Accelration
acc = 0.1;
quit_flag = false;
for ii = 1:20
    ii
    clf
    hold on
    if 1
  
    [colCount,dsq,rsq] = mp.CountCollisions();
    mp.p(1).cflg = 0;
    mp.p(2).cflg = 0;
    if colCount > 0
        if 0
        % Do the collision impulse resolution
        N = mp.DoCollisionImpulse(mp.p(1),... % Cube Struct
                              mp.p(2),... % Cube Struct.
                              [0.0,0.0,0.0],... % 3 vector 
                              1.0,...
                              1.0); % 1 for purely elastic 0 for bonding
        end
        [velF,velT] = mp.CalcMomP(mp.p(1),... % Cube Struct
                                    mp.p(2),...
                                    dsq,...
                                    rsq);
        mp.p(1).vecv = velF;
        mp.p(2).vecv = velT;
        pt = 0.125*(dsq/rsq);
        mp.p(1).vecp = mp.p(1).vecp+velF.*pt;
        mp.p(2).vecp = mp.p(2).vecp+velT.*pt;
        quit_flag = true;
        dist = mp.p(1).vecp - mp.p(2).vecp
            
    else

        mp.p(1).vecp = mp.p(1).vecp+mp.p(1).vecv*(acc);
        mp.p(2).vecp = mp.p(2).vecp+mp.p(2).vecv*(acc);
    end
      % Plot as spheres
        for P = 1:mp.ptot-1
            mp.PlotParticleNum(P,true);
        end
    else
        % Plot as points
        mp.PlotParticlePoint();
    end

    
if 0 % if we need vectors
    % Draw the returned normal from particle 1 positon
    vectarrow([mp.p(1).rx,mp.p(1).ry,mp.p(1).rz],...
               [-N(1)+mp.p(1).rx,-N(2)+mp.p(1).ry,-N(3)+mp.p(1).rz]);

    % Draw the line of impact
    vectarrow([mp.p(1).rx,mp.p(1).ry,mp.p(1).rz],...
                [mp.p(2).rx,mp.p(2).ry,mp.p(2).rz]);
end    
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    axis ([0.0 3.0,0.0,3.0,0.0,3.0]);
    view([0 0]);
    hold off
    if (quit_flag == true)
        break;
    end
    pause(0.5)
end