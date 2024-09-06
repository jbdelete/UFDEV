function AddRod(obj,...
                x,... %x pos
                y,... %y pos
                z,... %z pos
                R,... %Radius
                xv,...    % x vel
                yv,...    % y vel
                zv,...    % z vel
                D,... %Interpatricle distance
                rot,... % rotation around center particle
                N,... % Rod Number
                P,... % num particles per rod
                seq,... % sequence Number
                accr,...
                acca,...
                substance) % Number of particles in rod


% Add center first
obj.AddParticleRod(  x,...    % X position
                    y,...     % Y Position
                    z,...     % Z Position
                    R,...    % Radius
                    xv,...     % x velocity
                    yv,...     % y velocity
                    zv,...     % z velocity
                    seq,...     %seq
                    N,...       % Rod Number
                    0,...      % In rod number    
                    acca,...     % attraction coefficient
                    accr,...     % repulsion coefficient
                    substance);    % Substance    
prev_x = x;
prev_y = y;
% add even to the right
for ii = 2:2:P
    
    
    X = prev_x+D;
    Y = prev_y-D*sin(rot);
    prev_y = Y;
    obj.AddParticleRod(  X,...    % X position
                    Y,...     % Y Position
                    z,...     % Z Position
                    R,...    % Radius
                    xv,...     % x velocity
                    yv,...     % y velocity
                    zv,...     % z velocity
                    1.0,...     %seq
                    N,...
                    ii,...
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
    prev_x = X;

end
prev_x = x;
prev_y = y;
for ii = 1:2:P-1
    X = prev_x-D;
    Y = prev_y+D*sin(rot);
    prev_y = Y;
    obj.AddParticleRod(  X,...    % X position
                    Y,...     % Y Position
                    z,...     % Z Position
                    R,...    % Radius
                    xv,...     % x velocity
                    yv,...     % y velocity
                    zv,...     % z velocity
                    1.0,...     %seq
                    N,...
                    ii,...
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
    prev_x = X;

end

end
                