function N = DoCollisionImpulse(obj,...    
                             c0,... % Cube Struct
                             c1,... % Cube Struct.
                             hitPoint,... % 3 vector 
                             penetration,...
                             epsilon) % Coefficient of restitution

% Find the a vector between particles

nN = c0.vecp-c1.vecp;
% Normalize 
N = nN/(nN(1)^2+nN(2)^2+nN(3)^2)^(1/2);
vab = c0.vecv-c1.vecv;
vn = dot(vab,N);
J = dot(-(1+epsilon)*vab,N)/(dot(N,N*(1/c0.mass+1/c1.mass)));
c0dv = (J/c0.mass)*N;
c1dv = (J/c1.mass)*N;
c0.vecv = c0.vecv+(J/c0.mass)*N;
c1.vecv = c1.vecv-(J/c1.mass)*N;

if 0

c0.vecv = c0.vecv+c0.vecomega*c0.radius;
c1.vecv = c1.vecv+c1.vecomega*c1.radius;

I0_0 = (2/5)*c0.mass*(c0.radius^2);
I0 = I0_0*[1.0,0.0,0.0;0.0,1.0,0.0;0.0,0.0,1.0];

I1_0 = (2/5)*c1.mass*(c1.radius^2);
I1 = I1_0*[1.0,0.0,0.0;0.0,1.0,0.0;0.0,0.0,1.0];
c0.vecomega = [1.0,0.0,0.0];
c1.vecomega = [1.0,0.0,0.0];


J01 = dot(-(1+epsilon)*vab,N);
J02 = (dot(N,N*(1/c0.mass+1/c1.mass)));
J03 = inv(I0);
J04 = inv(I1);
end

%J03 = 


end