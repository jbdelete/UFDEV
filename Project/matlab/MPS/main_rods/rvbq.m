function vprime = rvbq(v, q)

    % Extract the vector part of the quaternion
    u = [q(2), q(3) q(4)];

    % Extract the scalar part of the quaternion
    s = q(1);

    % Do the math
    vprime = 2.0 * dot(u, v) * u + (s*s - dot(u, u)) * v + 2.0 * s * cross(u, v);
end