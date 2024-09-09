function [phi0,phi1] = DoAngVel(obj,c0,c1)

xang = c0.omega(1);
yang = c0.omega(2);
zang = c0.omega(3);

A = [cos(yang)*cos(zang),...
     cos(xang)*sin(yang)+sin(yang)*sin(zang)*cos(zang),...
     sin(yang)*sin(zang)-cos(xang)*sin(yang)*sin(zang);
     -cos(yang)*sin(zang),...
     cos(yang)*cos(zang)-sin(xang)*sin(yang)*sin(zang),...
     sin(xang)*cos(zang)+cos(xang)*sin(yang)*sin(zang);...
    sin(yang),-sin(xang)*cos(yang), cos(xang)*cos(yang)];

phi0 = c0.phi*A;
    
xang = c1.omega(1);
yang = c1.omega(2);
zang = c1.omega(3);
A = [cos(yang)*cos(zang),...
     cos(xang)*sin(yang)+sin(yang)*sin(zang)*cos(zang),...
     sin(yang)*sin(zang)-cos(xang)*sin(yang)*sin(zang);
     -cos(yang)*sin(zang),...
     cos(yang)*cos(zang)-sin(xang)*sin(yang)*sin(zang),...
     sin(xang)*cos(zang)+cos(xang)*sin(yang)*sin(zang);...
    sin(yang),-sin(xang)*cos(yang), cos(xang)*cos(yang)];


phi1 = c1.phi*A;





end