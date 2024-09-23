function FillDiamond(obj)
    pts(1) = obj.ToVec3( [0.1, 0.0, -1]) ;
    pts(2) = obj.ToVec3( [1.0, 0.0, 0.0]) ;
    pts(3) = obj.ToVec3( [1.0, 0.0, 0.1]) ;
    pts(4) = obj.ToVec3( [0.4, 0.0, 0.4]) ;
    quantHalf = obj.ToAngleQuant([0.0,0.0,1.0],(2.0 * pi() * 0.125 * 0.5));
    pts(5) = obj.ToVec3( [0.8, 0.0, 0.3]);
    pts(5) = obj.RotatePoint(quantHalf,pts(5));
    pts(6) = obj.RotatePoint(quantHalf,pts(2));
    pts(7) = obj.RotatePoint(quantHalf,pts(3));
    %pts(8) = StructQuant;
    ToQuant([0.1,0.0,-1])
end