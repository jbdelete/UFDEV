function quant = ToAngleQuant(obj,vec3,angleRadians)
    temp  = StructQuant;
    halfAngleRadians = 0.5 * angleRadians;
    temp.w = cos(halfAngleRadians);
    halfSine = sin( halfAngleRadians );
    vec3 = obj.VecNorm(vec3);
    
    
    temp.x = vec3.x*halfSine;
    temp.y = vec3.y*halfSine;
    temp.z = vec3.z*halfSine;
    
    quant = temp;
end