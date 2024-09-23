function nary = ToAry(obj,ivec)

	ovec = [];	
	if(isfield(ivec,'quant'))
		ovec = [ivec.x,ivec.y,ivec.z,ivec.w];
	end

	if(isfield(ivec,'vec3'))
		ovec = [ivec.x,ivec.y,ivec.z];
	end
	nary = ovec;
end