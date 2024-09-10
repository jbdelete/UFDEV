function [vprimex,vprimey,vprimez,vall] = rvbqa(v, ang)
    
    
    veca = [1.0,0.0,0.0];
    q = [cos(ang/2.0),...
         veca(1)*sin(ang(1)/2.0),...
         veca(2)*sin(ang(1)/2.0),...
         veca(3)*sin(ang(1)/2.0)];
    % Extract the vector part of the quaternion
    u = [q(2), q(3) q(4)];
    % Extract the scalar part of the quaternion
    s = q(1);
    % Do the math
    vprimex = 2.0 * dot(u, v) * u + (s*s - dot(u, u)) * v + 2.0 * s * cross(u, v);
    v = vprimex;

    veca = [0.0,1.0,0.0];
    q = [cos(ang/2.0),...
         veca(1)*sin(ang(2)/2.0),...
         veca(2)*sin(ang(2)/2.0),...
         veca(3)*sin(ang(2)/2.0)];
    % Extract the vector part of the quaternion
    u = [q(2), q(3) q(4)];
    % Extract the scalar part of the quaternion
    s = q(1);
    % Do the math
    vprimey = 2.0 * dot(u, v) * u + (s*s - dot(u, u)) * v + 2.0 * s * cross(u, v);

    v=vprimey;
    veca = [0.0,0.0,1.0];
    q = [cos(ang/2.0),...
         veca(1)*sin(ang(3)/2.0),...
         veca(2)*sin(ang(3)/2.0),...
         veca(3)*sin(ang(3)/2.0)];
    % Extract the vector part of the quaternion
    u = [q(2), q(3) q(4)];
    % Extract the scalar part of the quaternion
    s = q(1);
    % Do the math
    vprimez = 2.0 * dot(u, v) * u + (s*s - dot(u, u)) * v + 2.0 * s * cross(u, v);
    vall = vprimex+vprimey+vprimez;
end