function N = GetContactNorm(obj,F,T)

ca = obj.p(F);
cb = obj.p(T);
p_ab = obj.p(T).vecp - obj.p(F).vecp;
% Normal vector is the direction of collisions
obj.p(F).colNorm = p_ab/norm(p_ab);
obj.p(T).colNorm = p_ab/norm(p_ab);
end