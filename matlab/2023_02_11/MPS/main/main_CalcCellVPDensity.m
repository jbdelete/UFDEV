clc
clear all
close all;
fclose all;
warning('off','all');
addPathCD('matlab/MPS/main')
mp      = mps();
start_side  = 23;
start_radius = 0.2;
num_part = 117649;

wx          = [];
wy          = [];
wz          = [];
dx          = [];
dy          = [];
dz          = [];
tot         = [];
sel         = '';
cols        = [];
collision   = [];
cdens       = [];
radius      = [];
vx          = [];
vy          = [];
vz          = [];
px          = [];
py          = [];
pz          = [];



lastsidelen = 0;
ii = 1;
for rr = 0.2:-0.0005:0.0001
    centerlen = rr*0.15+2*rr;
    pinrow = floor(0.55/centerlen);
    pinlayer = pinrow^2;
    pincell = pinrow^3;
    %parts_per_cell = parts_per_line^3
    sidelen = mp.CalcSideLen(pincell,num_part)+1;
    if(lastsidelen ~= sidelen)
        fprintf("Parts in Cell:%d, Radius = %0.4f, SideLen = %d\r\n",...
            pincell,rr,sidelen);

        wx(ii)          = 1;
        wy(ii)          = 8;
        wz(ii)          = 1;
        dx(ii)          = num_part+1;
        dy(ii)          = 1;
        dz(ii)          = 1;
        tot(ii)         = num_part;
        sel(ii)         = 's';
        cols(ii)        = pincell+5;
        collision(ii)   = 0;
        cdens(ii)       = 0.0;%0.25;
        radius(ii)      = rr;
        vx(ii)          = 0;
        vy(ii)          = 0;
        vz(ii)          = 0;
        px(ii)           = 0;
        py(ii)          = 0;
        pz(ii)          = 0;    
        ii = ii +1;
    end
    lastsidelen = sidelen;
end

LatexTable = table( wx',...
                    wy',...
                    wz',...
                    dx',...
                    dy',...
                    dz',...
                    tot',...
                    sel',...
                    cols',...
                    collision',...
                    cdens',...
                    radius',...
                    vx',...
                    vy',...
                    vz',...
                    px',...
                    py',...
                    pz');
LatexTable.Properties.VariableNames = {...
                    'wx',...
                    'wy',...
                    'wz',...
                    'dx',...
                    'dy',...
                    'dz',...
                    'tot',...
                    'sel',...
                    'cols',...
                    'collision',...
                    'cdens',...
                    'radius',...
                    'vx',...
                    'vy',...
                    'vz',...
                    'px',...
                    'py',...
                    'pz'};

outfile = "../../../RCCDData/perfdata/ParticleSelectionsCellVPart.csv";
if exist(outfile, 'file')==2
  delete(outfile);
end
writetable(LatexTable,outfile);