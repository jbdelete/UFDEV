function ConvertToStruct(obj,P)

obj.p(P).h.vel = obj.ToVec3(obj.p(P).vecv);
obj.p(P).h.pos = obj.ToVec3(obj.p(P).vecp);
obj.p(P).h.orient = obj.ToVec3(obj.p(P).orient);
obj.p(P).h.angvel = obj.ToVec3(obj.p(P).omega);


end