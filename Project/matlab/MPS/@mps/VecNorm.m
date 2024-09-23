function nvec = VecNorm(obj,ivec)
ovec = struct;
if(isfield(ivec,'quant'))
    ovec = StructQuant;
    mag = 1.0/sqrt(ivec.x^2+ivec.y^2+ivec.z^2+ivec.w^2);
    ovec.x = ivec.x*mag;
    ovec.y = ivec.y*mag;
    ovec.z = ivec.z*mag;
    ovec.w = ivec.w*mag;
end

if(isfield(ivec,'vec3'))
    ovec = StructVec3;
    mag = 1.0/sqrt(ivec.x^2+ivec.y^2+ivec.z^2);
    ovec.x = ivec.x*mag;
    ovec.y = ivec.y*mag;
    ovec.z = ivec.z*mag;
end
nvec = ovec;




end