function ApplyImpulse(obj,P,impulsePoint,impulse)

    aryimpulse = obj.ToAry(impulse);
    obj.ApplyImpulseLinear(P,aryimpulse);
    position = obj.ToVec3(obj.GetCenterMassWS(P));
    r=obj.SubtractVec(impulsePoint,position);
    dL = obj.CrossVec3(r,impulse);
    obj.ApplyImpulseAngular(P,dL);
   
end