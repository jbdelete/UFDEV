function AddCollisionImpulse(obj,...    
                             c0,... % Cube Struct
                             c1,... % Cube Struct.
                             hitPoint,... % 3 vector 
                             normal,...   % 3 Vector
                             penetration,...
                             e) % Coefficient of restitution
invMass0= 0.0;
invMass1= 0.0;
if c0.m_mass>1000.0
    invMass0 = 0.0;
else
 invMass0 = 1.0/c0.m_mass;
end

if c1.m_mass>1000.0
    invMass1 = 0.0;
else
    invMass1 = 1.0/c1.m_mass;

if c0.m_awake == false
     invMass0 = 0.0;
else
     invMass0 = invMass0;
end

if c1.m_awake == false
     invMass1 = 0.0;
else
     invMass1 = invMass1;
end

worldInvInertia0 = c0.m_invInertia;
worldInvInertia1 = c1.m_invInertia;

% Both objects are non movable
if (invMass0+invMass1)== 0.0 
    return;
end

r0 = hitPoint - c0.m_c;
r1 = hitPoint - c1.m_c;
v0 = c0.m_linVelocity + cross(c0.m_angVelocity, r0);
v1 = c1.m_linVelocity + cross(c1.m_angVelocity, r1);

%Relative Velocity
dv = v0 - v1;
% If the objects are moving away from each other
% we dont need to apply an impulse
relativeMovement = -dot(dv, normal);

if (relativeMovement < -0.01)
    return
end
normDivB = (invMass0 + invMass1)...
         + dot( normal, cross( Transform( cross(r0, normal), worldInvInertia0), r0)...
            +  cross( transform( cross(r1, normal), worldInvInertia1), r1));
normDiv = dot(normal, normal) * normDivB;

jn = -1*(1+e)*dot(dv, normal) / normDiv;
 
jn = jn + (penetration*1.5);
c0.m_linVelocity = c0.m_linVelocity+ invMass0 * normal * jn;
c0.m_angVelocity = c0.m_angVelocity+ Transform(Cross(r0, normal * jn),...
		worldInvInertia0);

c1.m_linVelocity = c1.m_linVelocity- invMass1 * normal * jn;
c1.m_angVelocity = c1.m_angVelocity- Transform(Cross(r1, normal * jn),... 
		worldInvInertia1);




end