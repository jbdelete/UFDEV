function mat3 = TransposeMat3(obj,rows)
    orows(1) = StructVec3;
    orows(1) = StructVec3;
    orows(1) = StructVec3;
    tmp = zeros(3,3);
    ary = zeros(3,3);
    ary(1,:) = [rows(1).x,rows(1).y,rows(1).z];
    ary(2,:) = [rows(2).x,rows(2).y,rows(2).z];
    ary(3,:) = [rows(3).x,rows(3).y,rows(3).z];
    for ii = 1:3
	    for jj = 1:3
		    tmp(ii,jj)  = ary(jj, ii);
	    end
    end
    orows(1) = obj.ToVec3(tmp(1,:));
    orows(2) = obj.ToVec3(tmp(2,:));
    orows(3) = obj.ToVec3(tmp(3,:));
    mat3 = orows;
end