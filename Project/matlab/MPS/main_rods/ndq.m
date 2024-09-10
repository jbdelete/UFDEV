angle = pi()/4;
qr.x=0.0;
qr.y=0.0;
qr.z=0.0;    
qr.w=0.0;
norm = sqrt(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
q.x =  q.x / norm;
q.y =  q.y / norm;
q.z =  q.z / norm;
q.w =  q.w / norm;
half_angle = angle/2;
q.x = axis.x * sin(half_angle);
q.y = axis.y * sin(half_angle);
q.z = axis.z * sin(half_angle);
q.w = cos(half_angle);


