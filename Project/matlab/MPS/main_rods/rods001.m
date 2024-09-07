 rot = 0;
 mp.AddRod(  11.0,...    % X position
                    15.00,...   % Y Position
                    4.00,...    % Z Position
                    0.20,...    % Radius
                    0.00,...    % x vel
                    0.05,...    % y vel
                    0.00,...    % z vel
                    particleDistance,...   %Interpatricle distance
                    rot,...     % rotation around center particle
                    1,...       % Rod Number
                    5,...       % num particles per rod
                    1.0,...     % sequence Number
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");      % Substance  
rot = pi()/16.0;
mp.AddRod(  11.0,...    % X position
                    15.52,...   % Y Position
                    4.00,...    % Z Position
                    0.20,...    % Radius
                    0.00,...    % x vel
                    -0.05,...    % y vel
                    0.00,...    % z vel
                    particleDistance,...   %Interpatricle distance
                    rot,...     % rotation around center particle
                    2,...       % Rod Number
                    5,...       % num particles per rod
                    1.0,...     % sequence Number
                    0.0,...     % attraction coefficient
                    0.0,...     % repulsion coefficient
                    "He");      % Substance    
