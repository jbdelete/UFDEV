function omat = ToStructMat3(obj,mat3)

pts(1) = obj.ToVec3( mat3(1,:)) ;
pts(2) = obj.ToVec3( mat3(2,:)) ;
pts(3) = obj.ToVec3( mat3(3,:)) ;

omat = pts;
end