function vel = RodColResponse(obj,colAry,dsq,rsq)
    
    [velF,velT] = obj.CalcMomP(obj.p(colAry(1)),... % Cube Struct
                                obj.p(colAry(2)),...
                                dsq,...
                                rsq);
    pt = 0.0625*(dsq/rsq);
    pnum = ((obj.p(colAry(1)).rnum-1)*5)+1;
    for ii = pnum:pnum+4
        obj.p(ii).cflg = 1;
        obj.p(ii).vecp = obj.p(ii).vecp+velF.*pt;
    end
    vel = velF;
end