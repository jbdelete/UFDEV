function rrow =  RotatePoint(obj,quant,vec3)

    srow = StructQuant;
    srow.x =vec3.x;
    srow.y =vec3.y;
    srow.z =vec3.z;
    srow.w = 0.0;

    nquant = obj.VecNorm(quant);
    nquant.x = -nquant.x;
    nquant.y = -nquant.y;
    nquant.z = -nquant.z;
    
    middle = obj.MultiplyQuant(srow,nquant);
    last = obj.MultiplyQuant(quant,middle);
    
    rrow = StructVec3;
    rrow.x = last.x;
    rrow.y = last.y;
    rrow.z = last.z;
    
   
end