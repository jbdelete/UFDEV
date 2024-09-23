function invInertiaTensor = GetInverseInertiaTensorWorldSpace(obj,P)
    inertiaTensor = obj.p(P).inertiaTensor;
    invInertiaTensor=inv(inertiaTensor)*obj.p(P).invmass;
    invInertiaTensor = obj.ToMat3(invInertiaTensor);
    orient = obj.ToRotateMat3(obj.p(P).orient);
    torient = obj.TransposeMat3(orient);
    invInertiaTensor01 = obj.MultiplyMat3(orient,invInertiaTensor);
    invInertiaTensor = obj.MultiplyMat3(torient,invInertiaTensor01);
   
end