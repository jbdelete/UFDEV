addpath('J:/sandboxR9/matlab/mps')
addpath('J:/sandboxR9/matlab/mps/common')
addpath('J:/sandboxR9/matlab/mps/main')

clc
clear all;
close all;
fclose all;
PERF_TEST = 0;
DEN_TEST = 1;
typflg = PERF_TEST;

if 1
if(typflg == PERF_TEST)
    delfiles("J:\VCUBEData\perfdataT",'*.bin');
    delfiles("J:\VCUBEData\perfdataT",'*.csv');
    delfiles("J:\VCUBEData\perfdataT",'*.log');
else
    delfiles("J:\VCUBEData\perfdataD",'*.bin');
    delfiles("J:\VCUBEData\perfdataD",'*.csv');
    delfiles("J:\VCUBEData\perfdataD",'*.log');
end
end
T = readtable("J:\VCUBEData\perfdata\ParticleBMPattern002.csv");
typflg  =0;
mp          = mps();
CalcCellOccupancy(0.1);
for ii=1:size(T,1)
    if(strcmp(T{ii,8},"s"))
        GenBenchmarkData(mp,T,ii,typflg);
    end
end
fclose all;

