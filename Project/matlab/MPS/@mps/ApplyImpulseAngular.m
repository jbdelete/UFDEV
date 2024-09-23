function ApplyImpulseAngular(obj,P,impulse)

    angularVelocity = obj.ToVec3(obj.p(P).omega);
    invIT = obj.GetInverseInertiaTensorWorldSpace(P);     
    angularVelocity01 = obj.MultiplyMatVec(invIT,impulse);
    angularVelocity = obj.AddVec(angularVelocity,angularVelocity01);
    obj.p(P).omega = obj.ToAry(angularVelocity);    
    
end