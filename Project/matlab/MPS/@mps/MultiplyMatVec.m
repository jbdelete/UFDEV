function vec3 = MultiplyMatVec(obj,rows,rhs)
    tmp = obj.ToVec3([0.0,0.0,0.0]);
    tmp.x = obj.DotVec3(rows(1),rhs);
    tmp.y = obj.DotVec3(rows(2),rhs);
    tmp.z = obj.DotVec3(rows(3),rhs);
    
    vec3 = tmp; 
end