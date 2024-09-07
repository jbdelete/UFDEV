function MoveRod(obj,N,dt,vel)

   
    pnum = ((N-1)*5)+1;
    for ii = pnum:pnum+4
        if (obj.p(ii).cflg > 0)
            obj.p(ii).vecv = vel;
        end
        obj.p(ii).vecp = obj.p(ii).vecp+obj.p(ii).vecv*dt;
        obj.p(ii).cflg = 0;
    end

end