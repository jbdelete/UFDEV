function ovec = MultiplyVecScalar(obj,vec1,scal)

	tvec = struct;	
	if(isfield(vec1,'quant'))
        tvec = StructQuant;	
		tvec.x = vec1.x*scal;
        tvec.y = vec1.y*scal;
		tvec.z = vec1.z*scal;
		tvec.w = vec1.w*scal;
	end

	if(isfield(vec1,'vec3'))
        tvec = StructVec3;	
		tvec.x = vec1.x*scal;
        tvec.y = vec1.y*scal;
		tvec.z = vec1.z*scal;
	end
	ovec = tvec;
end