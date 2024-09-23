function omag = VecMag(obj,ivec)
    mag = 0.0;
    if(isfield(ivec,'quant'))

        mag = sqrt((ivec.x^2+ivec.y^2+ivec.z^2+ivec.w^2));
        
    end
    
    if(isfield(ivec,'vec3'))
        mag = sqrt((ivec.x^2+ivec.y^2+ivec.z^2));
    end
    omag = mag;
end