function retmat3 = InverseMat3(obj,Mat3)

mat3 = zeros(3,3);
mat3(1,:) = [Mat3(1).x,Mat3(1).y,Mat3(1).z];
mat3(2,:) = [Mat3(2).x,Mat3(2).y,Mat3(2).z];
mat3(3,:) = [Mat3(3).x,Mat3(3).y,Mat3(3).z];

invmat3 = inv(mat3);

retmat3(1) = obj.ToVec3(invmat3(1,:));
retmat3(2) = obj.ToVec3(invmat3(2,:));
retmat3(3) = obj.ToVec3(invmat3(3,:));


end