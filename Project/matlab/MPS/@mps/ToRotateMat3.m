function omat = ToRotateMat3(obj,vec3in)

vec3 = obj.ToQuant(vec3in) ;
pts(1) = obj.ToVec3( [1.0, 0.0, 0.0]) ;
pts(2) = obj.ToVec3( [0.0, 1.0, 0.0]) ;
pts(3) = obj.ToVec3( [0.0, 0.0, 1.0]) ;

pts(1) = obj.RotatePoint(vec3,pts(1));
pts(2) = obj.RotatePoint(vec3,pts(2));
pts(3) = obj.RotatePoint(vec3,pts(3));
omat = pts;
end