

clc
clear all
close all

addpath('J:/sandboxR7/svnmatlab/mps')
addpath('J:/sandboxR7/svnmatlab/mps/common')
addpath('J:/sandboxR7/svnmatlab/mps/main')
mp      = mps();

mp.ParticleDataReadBIN("J:\sandboxR7\svnvulcan\run\mps\data",'PlotData2x8',1,0);
fprintf('Total particles:%d\r\n',mp.ptot)
hold on
sideleng = 0;
for ii = 1:mp.ptot-1
    plot3(mp.p(ii).rx,mp.p(ii).ry,mp.p(ii).rz,".")
    if (mp.p(ii).rx > sideleng)
         sideleng = mp.p(ii).rx;
    end

    if (mp.p(ii).ry > sideleng)
         sideleng = mp.p(ii).ry;
    end

    if (mp.p(ii).rz > sideleng)
         sideleng = mp.p(ii).rz;
    end
end
sideleng = ceil(sideleng);
axis([0,sideleng,0,sideleng,0,sideleng])
xlabel("X")
ylabel("Y")
zlabel("Z")
hold off
