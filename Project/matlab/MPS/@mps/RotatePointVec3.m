function rrow =  RotatePointVec3(obj,vec3)

    
    nvec = obj.VecNorm(vec3);
    nvec.x = -nvec.x;
    nvec.y = -nvec.y;
    nvec.z = -nvec.z;
    
    middle = obj.MultiplyQuant(srow,nquant);
    last = obj.MultiplyQuant(quant,middle);
    
    rrow = StructVec3;
    rrow.x = last.x;
    rrow.y = last.y;
    rrow.z = last.z;
    
   
end