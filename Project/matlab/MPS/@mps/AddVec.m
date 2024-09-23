function ovec = AddVec(obj,vec1,vec2)

	tvec = struct;	
	if(isfield(vec1,'quant'))
        tvec = StructQuant;
		tvec.x = vec1.x+vec2.x;
		tvec.y = vec1.y+vec2.y;
        tvec.z = vec1.z+vec2.z;
		tvec.w = vec1.w+vec2.w;
	end

	if(isfield(vec1,'vec3'))
        tvec = StructVec3;
		tvec.x = vec1.x+vec2.x;
		tvec.y = vec1.y+vec2.y;
        tvec.z = vec1.z+vec2.z;
	end
	ovec = tvec;
end