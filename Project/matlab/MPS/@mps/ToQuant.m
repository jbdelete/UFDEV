function quant = ToQuant(obj,ary)
    temp  = StructQuant;
    temp.x = ary(1);
    temp.y = ary(2);
    temp.z = ary(3);
    temp.w = ary(4);
    quant = temp;
end