function [vel0,vel1,omega0,omega1,pos0,pos1,N] = DoCollisionImpulse(obj,...    
                             c0,... % Cube Struct
                             c1,... % Cube Struct.
                             dsq,... % 3 vector 
                             rsq,...
                             epsilon) % Coefficient of restitution

ddist = dsq^(1/2);
rdist = rsq^(1/2);
pent  = rdis-ddist;


% Relative postion vector - line of impact.
p_ab = c0.vecp - c1.vecp;
% Normal vector is the direction of collisions
N = p_ab/norm(p_ab);

% Relative velocity vector.
v_ab = c0.vecv - c1.vecv;

% CollisionPoint 1
r_ccp = c0.radius*c0.vecp-c0.vecp;
rccp1 = cross(N,r_ccp);
rcp0 = cross(-N,rccp1);


r_ccp = c1.radius*c1.vecp-c1.vecp;
rccp2 = cross(N,r_ccp);
rcp1 = cross(-N,rccp2);


I0 = (2/5)*c0.mass*c0.radius^2;
I1 = (2/5)*c1.mass*c1.radius^2;

if 1
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = cross(cross(c1.radius,N),c1.radius)/I0;
J04 = cross(cross(c0.radius,N),c0.radius)/I1;
J05 = dot(J03+J04);

J = J01/(J02+J05);
end
if 0
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = (dot(rcp0,N)/I0)^2;
J04 = (dot(rcp1,N)/I1)^2;
J = J01/(J02+J03+J04);
end

if 0
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = cross(cross(rcp0,N),rcp0)/I0;
J04 = cross(cross(rcp1,N),rcp1)/I1;
J05 = dot( (J03+J04),N);
J = J01/(J02+J05);
end
vel0 = c0.vecv + (J/c0.mass)*N;
vel1 = c1.vecv - (J/c1.mass)*N;

pt = 0.0625*(dsq/rsq);
pos0 = c0.vecp+vel0.*pt;
pos1 = c1.vecp+vel1.*pt;

omega0 = c0.omega+cross(rcp0,J*N)/I0;
omega1 = c1.omega+cross(rcp1,J*N)/I1;





end