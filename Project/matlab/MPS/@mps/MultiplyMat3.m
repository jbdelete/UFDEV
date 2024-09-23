function mat3 = MultiplyMat3(obj,rows,rhs)
   tmp(1) = StructVec3();
   tmp(2) = StructVec3();
   tmp(3) = StructVec3();  
   for ii = 1:3
   	    tmp( ii ).x = rows( ii ).x * rhs( 1 ).x + rows( ii ).y * rhs( 2 ).x + rows( ii ).z * rhs( 3 ).x;
	    tmp( ii ).y = rows( ii ).x * rhs( 1 ).y + rows( ii ).y * rhs( 2 ).y + rows( ii ).z * rhs( 3 ).y;
	    tmp( ii ).z = rows( ii ).x * rhs( 1 ).z + rows( ii ).y * rhs( 2 ).z + rows( ii ).z * rhs( 3 ).z;
   end
   mat3 = tmp; 
end