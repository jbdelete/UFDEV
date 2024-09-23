function ApplyImpulseLinear(obj,P,impulse)

    
    obj.p(P).vecv = obj.p(P).vecv+impulse*obj.p(P).invmass;



end