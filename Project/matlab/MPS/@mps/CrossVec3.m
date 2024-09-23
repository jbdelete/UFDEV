function ovec3 = CrossVec3(obj,vec3,rhs)
    temp = StructVec3;
    temp.x = ( vec3.y * rhs.z ) - ( rhs.y *  vec3.z );
    temp.y = ( rhs.x * vec3.z ) - (  vec3.x * rhs.z );
    temp.z = ( vec3.x * rhs.y ) - ( rhs.x *  vec3.y );
    ovec3 = temp;

end