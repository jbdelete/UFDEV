function scalar = DotVec3(obj,invec01,invec02)

    temp = ( invec01.x * invec02.x ) +... 
            ( invec01.y * invec02.y ) +...
            ( invec01.z * invec02.z );
    scalar = temp;

end