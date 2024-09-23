function  GetContactPointWorldSpace(obj,F,T,Normal)

    obj.p(F).contactPtWS = obj.p(F).vecp+obj.p(F).radius*Normal;
    obj.p(T).contactPtWS = obj.p(T).vecp-obj.p(T).radius*Normal;

end