clc
clear all
%close all
clf
%Instantiate massive particle system
mp      = mps();

%------------------ Start ignore for now.
mp.SetTimeStep(0.1);
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
                0.05,... %  x velocity
                0.0,... %  y velocity
                0.0,... %  z velocity
                0.0,... % Sequence (flow)
                0.0,... % repulsive acceleration
                0.0,... % attraction acceleration     
                "He") % Substance

mp.AddParticle(1.45,0.5,0.5,0.20,-0.05,0.0,0.0,0,0.0,0.0,"He")

mp.p(1).omega = [2.0,0.0,0.0];
mp.p(2).omega = [2.0,0.0,0.0];
mp.p(1).phi = mp.p(1).vecp+[1,1,1]*mp.p(1).radius;
mp.p(2).phi = mp.p(2).vecp+[1,1,1]*mp.p(2).radius;


mp.p(1).mass = 1.0;
mp.p(2).mass = 1.0;
% Accelration
acc = 0.1;
quit_flag = false;
mp.hasOmega = true;
for ii = 1:5
    ii
    clf
    hold on
    
    [colCount,colAry,dsq,rsq] = mp.CountCollisions();
    vel1 = [];
    vel2 = [];
    if colCount > 0
    % Do the collision impulse resolution
        
    [vel1,vel2,omega1,omega2,pos1,pos2,N] =...
         mp.DoCollisionImpulse(  mp.p(1),... % Cube Struct
                                    mp.p(2),... % Cube Struct.
                                    dsq,... % 3 vector 
                                    rsq,...
                                    1.0); % 1 for purely elastic 0 for bonding
    mp.p(1).vecp = pos1;
    mp.p(2).vecp = pos2;
    mp.p(1).vecv  = vel1;
    mp.p(2).vecv  = vel2;
    mp.p(1).omega = omega1;
    mp.p(2).omega = omega2;
    end
   
   % mp.p(1).vecp = mp.p(1).vecp+mp.p(1).vecv*mp.dt;
    %mp.p(2).vecp = mp.p(2).vecp+mp.p(2).vecv*mp.dt;
    if 0
    [phi0,phi1] = mp.DoAngVel(mp.p(1),mp.p(2));
    mp.p(1).phi = phi0;
    mp.p(2).phi = phi1;
    fprintf('phi1:<%0.4f,%0.4f,%0.4f>phi2:<%0.4f,%0.4f,%0.4f>\r\n',...
            mp.p(1).phi(1),mp.p(1).phi(2),mp.p(1).phi(3),...
            mp.p(2).phi(1),mp.p(2).phi(2),mp.p(2).phi(3));
    mp.p(1).phi = mp.p(1).phi+mp.p(1).omega*mp.dt;
    mp.p(2).phi = mp.p(2).phi+mp.p(2).omega*mp.dt;
    fprintf('phi1:<%0.4f,%0.4f,%0.4f>phi2:<%0.4f,%0.4f,%0.4f>\r\n',...
            mp.p(1).phi(1),mp.p(1).phi(2),mp.p(1).phi(3),...
            mp.p(2).phi(1),mp.p(2).phi(2),mp.p(2).phi(3));
   
    end
    normp1 = 0.25;
    normp2 = 0.25;

    %mp.p(1).pltphi = mp.p(1).vecp+normp1*mp.p(1).radius;
   % mp.p(2).pltphi = mp.p(2).vecp+normp2*mp.p(2).radius;
    mp.p(1).pltphi = mp.p(1).phi;
    mp.p(2).pltphi = mp.p(2).phi;
    if 1
    fprintf('pphi1:<%0.4f,%0.4f,%0.4f>, pphi2:<%0.4f,%0.4f,%0.4f>\r\n',...
            mp.p(1).pltphi(1),mp.p(1).pltphi(2),mp.p(1).pltphi(3),...
            mp.p(2).pltphi(1),mp.p(2).pltphi(2),mp.p(2).pltphi(3));
    end
    
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
    axis ([0.0 3.0,0.0,1.0,0.0,1.0]);
    daspect([1,1,1]);
    %view([-0.0875,41.039516129032258]);
    %view([90,90]);
    view([43.308740359897186,37.359640102827768]);
    hold off
    if (quit_flag == true)
        break;
    end
    pause(0.5)
end