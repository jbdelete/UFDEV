function vprime = rvbq(p,ang,vecax)
    
    
    
    q = [cos(ang/2.0),...
         vecax(1)*sin(ang/2.0),...
         vecax(2)*sin(ang/2.0),...
         vecax(3)*sin(ang/2.0)];
    %np = sqrt(q(1)^2+q(2)^2+q(3)^2+q(4)^2);
    % Extract the vector part of the quaternion
    u = [q(2), q(3) q(4)];
    % Extract the scalar part of the quaternion
    s = q(1);
    % Do the math
    vprime = 2.0 * dot(u, p) * u + (s*s - dot(u, u)) * p + 2.0 * s * cross(u, p);
    
    
end


