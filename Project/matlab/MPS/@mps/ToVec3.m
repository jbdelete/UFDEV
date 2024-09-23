function vec3 = ToVec3(obj,ary)
    temp  = StructVec3;
    temp.x = ary(1);
    temp.y = ary(2);
    temp.z = ary(3);
    
    vec3 = temp;

end