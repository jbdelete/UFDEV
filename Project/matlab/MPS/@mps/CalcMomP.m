function [velF,velT] = CalcMomP(obj,P1,P2,dsq,rsq)

    
    
    x = P1.vecp-P2.vecp;
    x = x/norm(x);
    v1 = P1.vecv;
    x1 = dot(x,v1);
    v1x = x * x1;
    v1y = v1 - v1x;
    

    x = x*-1;
    v2 = P2.vecv;
    x2 = dot(x,v2);
    v2x = x * x2;
    v2y = v2 - v2x;
    m1 = P1.mass;
    m2 = P2.mass;

    velF = v1x*(m1-m2)/(m1+m2) + v2x*(2*m2)/(m1+m2) + v1y;
    velT = v2x*(m2-m1)/(m1+m2) + v1x*(2*m1)/(m1+m2) + v2y;

  
    

end