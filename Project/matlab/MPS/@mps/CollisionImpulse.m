function CollisionImpulse(obj,F,T)

%https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/
% Collision manifold - pint,line, or 2d area shared between two objects.
% Relative postion vector - line of impact.

% Normal vector is the direction of collisions
p_ab = obj.p(T).vecp - obj.p(F).vecp;
p_ab = obj.ToVec3(p_ab);
posA = obj.ToVec3(obj.p(F).vecp);
posB = obj.ToVec3(obj.p(T).vecp);
% Normal vector is the direction of collisions
N = obj.VecNorm(p_ab);
endptOnA = obj.MultiplyVecScalar(N,obj.p(F).radius);
endptOnB = obj.MultiplyVecScalar(N,obj.p(T).radius);
ptOnA = obj.AddVec(posA,endptOnA);
ptOnB = obj.SubtractVec(posB,endptOnB);

invMassA = obj.p(F).invmass;
invMassB = obj.p(T).invmass;

elasA = obj.p(F).elas;
elasB = obj.p(T).elas;
elasticity = elasA*elasB;

invWorldInertiaA = obj.GetInverseInertiaTensorWorldSpace(F);
invWorldInertiaB = obj.GetInverseInertiaTensorWorldSpace(T);

ra = obj.SubtractVec(ptOnA,posA);
rb = obj.SubtractVec(ptOnB,posB);
angularJA01 = obj.CrossVec3(ra,N);
angularJA02 = obj.MultiplyMatVec(invWorldInertiaA,angularJA01);
angularJA = obj.CrossVec3(angularJA02,ra);

angularJB01 = obj.CrossVec3(rb,N);
angularJB02 = obj.MultiplyMatVec(invWorldInertiaB,angularJB01);
angularJB = obj.CrossVec3(angularJB02,rb);
angularFactor01 = obj.AddVec(angularJA,angularJB);

angularFactor = obj.DotVec3(angularFactor01,N);

m_angularVelocityA = obj.ToVec3(obj.p(F).omega);
m_angularVelocityB = obj.ToVec3(obj.p(T).omega);

angularJA01 = obj.CrossVec3(m_angularVelocityA,ra);
linearVelocityA = obj.ToVec3(obj.p(F).vecv);
velA = obj.AddVec(linearVelocityA,angularJA01);

angularJB01 = obj.CrossVec3(m_angularVelocityB,rb);
linearVelocityB = obj.ToVec3(obj.p(T).vecv);
velB = obj.AddVec(linearVelocityB,angularJB01);

vab  = obj.SubtractVec(velA,velB);

ImpulseJ=( (1.0+elasticity)*obj.DotVec3(vab,N) ) /( (invMassA+invMassB+angularFactor) );

vectorImpulseJ=obj.MultiplyVecScalar(N,ImpulseJ);
vectorImpulseJB = obj.MultiplyVecScalar(vectorImpulseJ,1.0);
vectorImpulseJA = obj.MultiplyVecScalar(vectorImpulseJ,-1.0);
obj.ApplyImpulse(F,ptOnA,vectorImpulseJA)
obj.ApplyImpulse(T,ptOnB,vectorImpulseJB)

tA=invMassA/(invMassA+invMassB);
tB=invMassB/(invMassA+invMassB);

ds=obj.SubtractVec(ptOnA,ptOnB);
ds = obj.ToAry(ds);
obj.p(F).vecp=obj.p(F).vecp+ds*tA;
obj.p(T).vecp=obj.p(T).vecp+ds*tB;
end