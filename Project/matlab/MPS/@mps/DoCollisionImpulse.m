function [vel0,vel1,omega0,omega1,pos0,pos1,N] = DoCollisionImpulse(obj,...    
                             c0,... % Cube Struct
                             c1,... % Cube Struct.
                             dsq,... % 3 vector 
                             rsq,...
                             epsilon) % Coefficient of restitution

%https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/
% Collision manifold - pint,line, or 2d area shared between two objects.
% Relative postion vector - line of impact.

p_ab = c0.vecp - c1.vecp;
% Normal vector is the direction of collisions
N = p_ab/norm(p_ab);

% It looks like the postion with the negative in p_ab
% is added to the normal while the postive is subtracted.
r_ccp0 = c0.vecp-c0.radius*N;
H = vectarrow(c0.vecp,r_ccp0);

r_ccp1 = c1.vecp+c1.radius*N;
H = vectarrow(c1.vecp,r_ccp1);


% Relative velocity vector.
v_ab = c0.vecv - c1.vecv;

% Hit point 

% CollisionPoint 1
r_ccp = c0.radius*c0.vecp+c0.vecp;
plot3(r_ccp(1),r_ccp(2),r_ccp(3),'or');
rccp1 = cross(N,r_ccp);
rcp0 = cross(-N,rccp1);


r_ccp = c1.radius*c1.vecp+c1.vecp;
plot3(r_ccp(1),r_ccp(2),r_ccp(3),'ro');
rccp2 = cross(N,r_ccp);
rcp1 = cross(-N,rccp2);


I0 = (2/5)*c0.mass*c0.radius^2;
I1 = (2/5)*c1.mass*c1.radius^2;

%https://www.euclideanspace.com/physics/dynamics/collision/threed/index.htm

J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = (dot(rcp0,N)/I0)^2;
J04 = (dot(rcp1,N)/I1)^2;
J = J01/(J02+J03+J04);

vel0 = c0.vecv + (J/c0.mass)*N;
vel1 = c1.vecv - (J/c1.mass)*N;

pt = 0.0625*(dsq/rsq);
pos0 = c0.vecp+vel0.*pt;
pos1 = c1.vecp+vel1.*pt;

omega0 = c0.omega+cross(rcp0,J*N)/I0;
omega1 = c1.omega+cross(rcp1,J*N)/I1;





end