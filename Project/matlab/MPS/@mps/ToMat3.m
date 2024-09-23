function omat = ToMat3(obj,mat3in)

pts(1) = obj.ToVec3( mat3in(1,:)) ;
pts(2) = obj.ToVec3( mat3in(2,:)) ;
pts(3) = obj.ToVec3( mat3in(3,:)) ;

omat = pts;
end