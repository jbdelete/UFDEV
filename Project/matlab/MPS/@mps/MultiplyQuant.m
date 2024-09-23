function temp = MultiplyQuant(obj,q,rhs)
    temp = StructQuant;
    temp.w = ( q.w * rhs.w ) - ( q.x * rhs.x ) - ( q.y * rhs.y ) - ( q.z * rhs.z );
    temp.x = ( q.x * rhs.w ) + ( q.w * rhs.x ) + ( q.y * rhs.z ) - ( q.z * rhs.y );
    temp.y = ( q.y * rhs.w ) + ( q.w * rhs.y ) + ( q.z * rhs.x ) - ( q.x * rhs.z );
    temp.z = ( q.z * rhs.w ) + ( q.w * rhs.z ) + ( q.x * rhs.y ) - ( q.y * rhs.x );

end