function update(obj,P)
    obj.p(P).vecp = obj.p(P).vecp+obj.p(P).vecv*obj.dt;
    pos = obj.ToVec3(obj.p(P).vecp);
    vorient = [obj.p(P).orient];
    orient = obj.ToQuant(vorient);
    torient = vorient';
    positionCM = obj.GetCenterMassWS(P);
    cmToPos = obj.p(P).vecp-positionCM;
    positionCM = obj.ToVec3(positionCM);
    angularVelocity = obj.ToVec3(obj.p(P).omega);
    cmToPos = obj.ToVec3(cmToPos);
    morient = obj.ToRotateMat3(vorient);
    
    orientTranspose = obj.ToRotateMat3(torient);
    inertiaTensor = obj.ToStructMat3(obj.p(P).inertiaTensor');
    inertiaTensor01 = obj.MultiplyMat3(morient,inertiaTensor);
    inertiaTensor02 = obj.MultiplyMat3(inertiaTensor01,orientTranspose);
    alpha01 = obj.InverseMat3(inertiaTensor02);
    alpha02 = obj.MultiplyMatVec(inertiaTensor02,angularVelocity);
    alpha03 = obj.CrossVec3(angularVelocity,alpha02);
    alpha = obj.MultiplyMatVec(alpha01,alpha03);
    angularVelocity = obj.AddVec(angularVelocity,...
                        obj.MultiplyVecScalar(alpha,obj.dt));
    
    dAngle = obj.MultiplyVecScalar(angularVelocity,obj.dt);
    obj.p(P).phi = obj.ToAry(dAngle);
    mAngle = obj.VecMag(dAngle);
    dq = obj.ToAngleQuant(dAngle,mAngle);
    orient = obj.MultiplyQuant(dq,orient);
    orient = obj.VecNorm(orient);

    dqr = obj.RotatePoint(dq,cmToPos);
    pos = obj.AddVec(positionCM,dqr);
    obj.p(P).orient = obj.ToAry(orient);
    obj.p(P).vecp = obj.ToAry(pos);
    obj.p(P).omega = obj.ToAry(angularVelocity);
end