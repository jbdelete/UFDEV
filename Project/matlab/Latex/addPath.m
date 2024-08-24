function [rccddrv,prefxdir] = addPath()

rccddrv = getenv('RCCDDRIVE');
rccdver = getenv('RCCDVER');
prefxdir = sprintf('/RCCD%s/',rccdver);

end