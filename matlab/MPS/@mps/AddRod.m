function AddRod(obj,...
                x,... %x pos
                y,... %y pos
                z,... %z pos
                R,... %Radius
                D,... %Interpatricle distance
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
                    0.0,...     % x velocity
                    0.0,...     % y velocity
                    0.0,...     % z velocity
                    seq,...     %seq
                    N,...       % Rod Number
                    0,...      % In rod number    
                    acca,...     % attraction coefficient
                    accr,...     % repulsion coefficient
                    substance);    % Substance    
prev_x = x;
% add even to the right
for ii = 2:2:P
    X = prev_x+D;
    obj.AddParticleRod(  X,...    % X position
                    y,...     % Y Position
                    z,...     % Z Position
                    R,...    % Radius
                    0.0,...     % x velocity
                    0.0,...     % y velocity
                    0.0,...     % z velocity
                    1.0,...     %seq
                    N,...
                    ii,...
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
    prev_x = X;

end
prev_x = x;
for ii = 1:2:P-1
    X = prev_x-D;
    obj.AddParticleRod(  X,...    % X position
                    y,...     % Y Position
                    z,...     % Z Position
                    R,...    % Radius
                    0.0,...     % x velocity
                    0.0,...     % y velocity
                    0.0,...     % z velocity
                    1.0,...     %seq
                    N,...
                    ii,...
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");    % Substance    
    prev_x = X;

end

end
                