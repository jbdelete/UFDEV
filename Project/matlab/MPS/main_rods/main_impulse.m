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
                "He"); % Substance

mp.AddParticle(1.45,0.5,0.5,0.20,-0.05,0.0,0.0,0,0.0,0.0,"He");

mp.p(1).omega = [0.0,0.0,1.5];
mp.p(2).omega = [0.0,0.0,-1.5];
mp.p(1).phi = [0.0,0.0,0.0];
mp.p(2).phi = [0.0,0.0,0.0];

mp.p(1).philoc = [mp.p(1).radius/2.0,0.0,0.0];
mp.p(2).philoc = [mp.p(2).radius/2.0,0.0,0.0];


mp.p(1).mass = 1.0;
mp.p(2).mass = 1.0;
% Accelration
acc = 0.1;
quit_flag = false;
mp.hasOmega = true;
ang = [0.0,0.0,0.0];
colcount = 0;
for ii = 1:20
    ii;
    clf
    hold on
    
    [colCount,colAry,dsq,rsq] = mp.CountCollisions();
    vel1 = [];
    vel2 = [];
    if colCount > 0
        colcount = colcount+1;
        if(colcount > 1)
            break;
        end
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
        fprintf('omega1:<%0.4f,%0.4f,%0.4f>\r\nomega2:<%0.4f,%0.4f,%0.4f>\r\n',...
            omega1(1),omega1(2),omega1(3),...
            omega2(2),omega2(2),omega2(3));
        mp.p(1).omega = omega1;
        mp.p(2).omega = omega2;

    end
    
    
    
    % Do chnage in postion
    mp.p(1).vecp = mp.p(1).vecp+mp.p(1).vecv*mp.dt;
    mp.p(2).vecp = mp.p(2).vecp+mp.p(2).vecv*mp.dt;
    if 0
    fprintf('phi1:<%0.4f,%0.4f,%0.4f>phi2:<%0.4f,%0.4f,%0.4f>\r\n',...
            mp.p(1).phi(1),mp.p(1).phi(2),mp.p(1).phi(3),...
            mp.p(2).phi(1),mp.p(2).phi(2),mp.p(2).phi(3));
    end
    philoc1 = mp.p(1).phi;
    philoc2 = mp.p(2).phi;
    mp.p(1).phi = mp.p(1).phi+mp.p(1).omega*mp.dt;
    mp.p(2).phi = mp.p(2).phi+mp.p(2).omega*mp.dt;
    
    dphi1 = philoc1 - mp.p(1).phi;
    dphi2 = philoc2 - mp.p(2).phi;

    pltFlg = true;
    r1 = mp.p(1).vecp+mp.p(1).philoc;
    H = vectarrow(mp.p(1).vecp,r1);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r1(1),r1(2),r1(3),'*b');

    r2 = mp.p(2).vecp+mp.p(2).philoc;
    H = vectarrow(mp.p(2).vecp,r2);
    H.LineWidth = 2.0;
    H.Color = [0.0,0.0,1.0];
    plot3(r2(1),r2(2),r2(3),'*b');
    
   
    [vprimex,vprimey,vprimez,vall,H] = ... 
        rvbqa(mp.p(1).philoc,mp.p(1).vecp,mp.p(1).radius,mp.p(1).phi,pltFlg);
    
    if 0
    fprintf('phi1:<%0.4f,%0.4f,%0.4f> phi2:<%0.4f,%0.4f,%0.4f>\r\n',...
            mp.p(1).phi(1),mp.p(1).phi(2),mp.p(1).phi(3),...
            mp.p(2).phi(1),mp.p(2).phi(2),mp.p(2).phi(3));
    end
    if 1
    fprintf('%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f\r\n',...
            mp.p(1).phi(1),mp.p(1).phi(2),mp.p(1).phi(3),...
            mp.p(2).phi(1),mp.p(2).phi(2),mp.p(2).phi(3));
    end    
    if 0
    fprintf('%0.6f,%0.6f,%0.6f,\r\ndphi2:<%0.6f,%0.6f,%0.6f>\r\n',...
            dphi1,dphi2);
    end
    p = [mp.p(2).radius/2.0,mp.p(2).radius/2.0,mp.p(2).radius/2.0];
    [vprimex,vprimey,vprimez,vall,H] = ... 
        rvbqa(mp.p(2).philoc,mp.p(2).vecp,mp.p(2).radius,mp.p(2).phi,pltFlg);
    
    normp1 = 0.25;
    normp2 = 0.25;

    mp.hasOmega = false;
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
    axis ([0.8 1.8,0.3,0.7,0.3,0.7]);
    daspect([1,1,1]);
    %view([-0.0875,41.039516129032258]);
    %view([90,90]);
    view([43.308740359897186,37.359640102827768]);
    view([56.0654,11.4362]);
    hold off
    if (quit_flag == true)
        break;
    end
   
    pause(0.5)
end