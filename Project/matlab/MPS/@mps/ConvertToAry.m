function ConvertToAry(obj,P)

obj.p(P).vecv = [obj.p(P).h.vel.x,...
                 obj.p(P).h.vel.y,...
                 obj.p(P).h.vel.z];

obj.p(P).vecp = [obj.p(P).h.pos.x,...
                 obj.p(P).h.pos.y,...
                 obj.p(P).h.pos.z];

obj.p(P).orient = [obj.p(P).h.orient.x,...
                 obj.p(P).h.orient.y,...
                 obj.p(P).h.orient.z];

obj.p(P).omega = [obj.p(P).h.angvel.x,...
                 obj.p(P).h.angvel.y,...
                 obj.p(P).h.angvel.z];

end