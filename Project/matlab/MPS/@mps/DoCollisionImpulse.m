function [vela,velb,omegaa,omegab,posa,posb,N] = DoCollisionImpulse(obj,...    
                             ca,... % Cube Struct
                             cb,... % Cube Struct.
                             dsq,... % 3 vector 
                             rsq,...
                             epsilon) % Coefficient of restitution

%https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/
% Collision manifold - pint,line, or 2d area shared between two objects.
% Relative postion vector - line of impact.

p_ab = ca.vecp - cb.vecp;
% Normal vector is the direction of collisions
N = p_ab/norm(p_ab);

% It looks like the postion with the negative in p_ab
% is added to the normal while the postive is subtracted.
r_ccpa = ca.vecp-ca.radius*N;
vectarrow(ca.vecp,r_ccpa);
rccpa = cross(N,r_ccpa);
rcpa = cross(-N,rccpa);

r_ccpb = cb.vecp+cb.radius*N;
vectarrow(cb.vecp,r_ccpb);
rccpb = cross(N,r_ccpb);
rcpb = cross(-N,rccpb);


% Relative velocity vector.
v_ab = ca.vecv - cb.vecv;
if 0
% Hit point 

% CollisionPoint 1
%r_ccp = c0.radius*c0.vecp+c0.vecp;
%plot3(r_ccp(1),r_ccp(2),r_ccp(3),'or');
rccp1 = cross(N,r_ccp);
rcp0 = cross(-N,rccp1);


%r_ccp = c1.radius*c1.vecp+c1.vecp;
%plot3(r_ccp(1),r_ccp(2),r_ccp(3),'ro');
rccp2 = cross(N,r_ccp);
rcp1 = cross(-N,rccp2);
end

Ia = (2/5)*ca.mass*ca.radius^2;
Ib = (2/5)*cb.mass*cb.radius^2;

%https://www.euclideanspace.com/physics/dynamics/collision/threed/index.htm
if 0
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = (dot(rcp0,N)/I0)^2;
J04 = (dot(rcp1,N)/I1)^2;
J = J01/(J02+J03+J04);
end
%Velocity only
if 0
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/ca.mass+1/cb.mass)));
J = J01/J02;
end

if 0
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/ca.mass+1/cb.mass)));
J03 = cross(cross(r_ccpa,N)/Ia,r_ccpa);
J04 = cross(cross(r_ccpb,N)/Ib,r_ccpb);
J05 = dot((J03+J04),N);
J = J01/(J02+J05);
end
ra = ca.radius;
rb = cb.radius;
if 1
J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/ca.mass+1/cb.mass)));
J03 = cross(cross(r_ccpa,N)/Ia,r_ccpa);
J04 = cross(cross(r_ccpb,N)/Ib,r_ccpb);
J05 = dot((J03+J04),N);
J = J01/(J02+J05);
end
vela = ca.vecv + (J/ca.mass)*N;
velb = cb.vecv - (J/cb.mass)*N;

pt = 0.0125*(dsq/rsq);
posa = ca.vecp+vela.*pt;
posb = cb.vecp+velb.*pt;
Oj1 = cross(r_ccpa,J*N)/Ia;
Oj2 = cross(r_ccpb,J*N)/Ib;
if 0

omegaa = ca.omega+Oj1;
omegab = cb.omega+Oj2;
end
omegaa = ca.omega;
omegab = cb.omega;



end