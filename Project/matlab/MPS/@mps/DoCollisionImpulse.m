function [vel0,vel1,omega0,omega1,pos0,pos1,N] = DoCollisionImpulse(obj,...    
                             c0,... % Cube Struct
                             c1,... % Cube Struct.
                             dsq,... % 3 vector 
                             rsq,...
                             epsilon) % Coefficient of restitution

p_ab = c0.vecp - c1.vecp;
v_ab = c0.vecv - c1.vecv;
N = p_ab/norm(p_ab);

r_norm0 = c0.radius*c0.vecp-c0.vecp;
r_norm1 = cross(N,r_norm0);
r0_norm = cross(-N,r_norm1);


r_norm0 = c1.radius*c1.vecp-c1.vecp;
r_norm1 = cross(N,r_norm0);
r1_norm = cross(-N,r_norm1);


I0 = (2/5)*c0.mass*c0.radius^2;
I1 = (2/5)*c1.mass*c1.radius^2;


J01 = dot((-(1+epsilon)*v_ab),N);
J02 = dot(N,(N*(1/c0.mass+1/c1.mass)));
J03 = (dot(r0_norm,N)/I0)^2;
J04 = (dot(r1_norm,N)/I1)^2;
J = J01/(J02+J03+J04);


vel0 = c0.vecv + (J/c0.mass)*N;
vel1 = c1.vecv - (J/c1.mass)*N;
pt = 0.0625*(dsq/rsq);
pos0 = c0.vecp+vel0.*pt;
pos1 = c1.vecp+vel1.*pt;

omega0 = c0.omega+dot(r0_norm,J*N)/I0;
omega1 = c1.omega+dot(r1_norm,J*N)/I1;

xang = omega0(1);
yang = omega0(2);
zang = omega0(3);

A = [cos(yang)*cos(zang),...
     cos(xang)*sin(yang)+sin(yang)*sin(zang)*cos(zang),...
     sin(yang)*sin(zang)-cos(xang)*sin(yang)*sin(zang);
     -cos(yang)*sin(zang),...
     cos(yang)*cos(zang)-sin(xang)*sin(yang)*sin(zang),...
     sin(xang)*cos(zang)+cos(xang)*sin(yang)*sin(zang);...
    sin(yang),-sin(xang)*cos(yang), cos(xang)*cos(yang)];
    
oldPhi0 = c0.phi;    


oldPhi1 = c0.phi;


end