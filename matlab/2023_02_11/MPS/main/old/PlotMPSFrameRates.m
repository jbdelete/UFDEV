%******************************************************************
%***      m PROPRIETARY SOURCE FILE IDENTIFICATION               ***
%*******************************************************************
% $Author: jb $
%
% $Date:  $
% $HeadURL:  $
% $Id:  $
%*******************************************************************
%***                         DESCRIPTION                         ***
%*******************************************************************
%@doc
%@module
%			@author: Jackie Michael Bell
%			COPYRIGHT <cp> Jackie Michael Bell
%			Property of Jackie Michael Bell<rtm>. All Rights Reserved.
%			This source code file contains proprietary
%			and confidential information.
%
%
%@head3 		Description. | 
%               
%@normal
%********************************************************************
%***                     SVN CHANGE RECORD                       ***
%*******************************************************************
%*$Revision:  $
%*
%*
%******************************************************************/

clc
clear all
close all
fclose all
warning('off','all')
addpath('J:/sandboxR9/matlab/mps')
addpath('J:/sandboxR9/matlab/mps/common')
addpath('J:/sandboxR9/matlab/mps/main')
addpath 'J:/sandboxR9/matlab/Latex'

sideLen     = [];
numParts    = [];
fps         = [];
fpsc        = [];
cols        = [];
colsr       = [];
acols       = [];
stime       = [];
dens        = [];
spf         = [];
quanup      = [];
quandown    = [];
minquan     = [];
maxcquan    = [];
filelist = ["J:/VCUBEData/perfdata/mmrr.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet4x343x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet9x4096x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet19x32768x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet29x117649x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet39x287496x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet49x551368x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet59x970299x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet69x1560896x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet79x2299968x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet89x3307949x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet99x4574296x0.csv",...
            "J:/VCUBEData/perfdata/CollisionDataSet129x10077696x0.csv"];
T = readtable(filelist(2));

mmrr = T{61,2};
for ii=2:length(filelist)
    filelist(ii)
    T = readtable(filelist(ii));
    quanup(ii-1)    = quantile(T{:,2},0.75,"all")';
    quandown(ii-1)  = quantile(T{:,2},0.25,"all")';
    minquan(ii-1)   = min(T{:,2})';
    maxcquan(ii-1)  = max(T{:,2})';
    sideLen(ii-1)   = T{1,6}';
    numParts(ii-1)  = T{1,4}';
    fps(ii-1)       = T{61,2}';
    fpsc(ii-1,:)    = T{1:61,2}';
    cols(ii-1)      = T{1,5}';
    acols(ii-1)     = T{1,8}';
    stime(ii-1)     = T{1,9}';
    dens(ii-1)      = T{1,7}';
    spf(ii-1)       = T{1,3}';
    colsr(ii-1)     = cols(ii-1)/numParts(ii-1)';
end

LatexTable = table(numParts,fps,cols,acols,dens,numParts./cols,stime./numParts);
LatexTable.Properties.Description = 'Frame rate verses number of particles and collisions';
LatexTable.Properties.VariableNames =  {'Particles', 'Frame rate (fps)', 'Collisions', 'Actual Collisons','Density', 'CPP','linearity'};
LatexTable.Properties.VariableUnits = {'%0.0d','%0.0d','%0.0d','%0.0d','%0.4f','%0.4f','%0.6f'};
LatexTable.Properties.UserData = {  'Name','V-Cube Performance Data',...
                                    'Height',1.3,...
                                    'FontSize',9,...
                                    'VertSpacing',10,...
                                    'CapWidth', 1,...
                                    'LeftMargin',0,...
                                    'Title', 'V-Cube Performance Data',...
                                    'Directory','J:/sandboxR9/Thesis',...
                                    'Alignment','| m{2.5in} | m{2in}| m{1.5in}| ',...
                                    'HorzLine','true',...
                                    'RowStart',startcnt,...
                                    'RowEnd',endcnt;
                                    };
LatexTable.Properties;

MatlabTableIEEE(LatexTable);
fpsc = fpsc';






if 0
%sideLen =  [   2,     4,   10,  15,  20,  30,   50,    60,    75,    100];
%numParts = [  27,   64,   1331,4096,9261,29791,132651,226981,438976,1030310];
%fps =      [ 1000, 850, 800, 750,  700,   650,   600,   550, 500 , 400];
fpsr = fps/mmrr;
fms = 1./fps;
len_sideLen = length(sideLen)
len_numParts = length(numParts)
len_fps = length(fps)

datax = numParts/1E6;
xextent = max(datax+0.2)

format default

hold on
%plot([0.0,xextent],[1.0,1.0],"-b");

plot(log10(datax),fpsr,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(log10(datax),colsr,'oy',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])

for ii=1:length(filelist)-1
    xx = log10(datax(ii));
    y1 = colsr(ii);
    y2 = fpsr(ii);
    plot([xx,xx],[y1,y2],'-k',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','r',...
        'MarkerFaceColor',[0.5,0.5,0.5])

end
mmrrtxt = sprintf("Application render rate ratio.");
legend(mmrrtxt,"Ratio of collisions to number of particles.");
for ii=1:len_numParts
    text(log10(datax(ii)),fpsr(ii)-0.04,sprintf("%0.0f fps",fps(ii)));
    text(log10(datax(ii)),colsr(ii)+0.04,sprintf("%0.0f",cols(ii)));
end
xlabel("Number of particles (log10(#))",'FontSize',18, 'FontWeight','bold','FontName','Arial Black')
ylabel("Ratio",'FontSize',18, 'FontWeight','bold','FontName','Arial Black')
%xticks(log10([0:0.1:1.2]*1E3));
%xtickformat('%0.1f')

grid on
axis([-3.6 1.6 -0.1 1.0])
box on
end





