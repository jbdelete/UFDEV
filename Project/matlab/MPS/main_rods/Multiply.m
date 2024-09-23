function quat = Multiply(obj, rhs)
vec4 = [0.0,0.0,0.0,0.0];
temp.w = ( w * rhs.w ) - ( x * rhs.x ) - ( y * rhs.y ) - ( z * rhs.z );
temp.x = ( x * rhs.w ) + ( w * rhs.x ) + ( y * rhs.z ) - ( z * rhs.y );
temp.y = ( y * rhs.w ) + ( w * rhs.y ) + ( z * rhs.x ) - ( x * rhs.z );
temp.z = ( z * rhs.w ) + ( w * rhs.z ) + ( x * rhs.y ) - ( y * rhs.x );
return temp;



end