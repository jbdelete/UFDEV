clc
clear all
%close all
ret = 0;
more off
%addpath('J:/sandboxR7/svnmatlab/Latex')
addpath('J:/sandboxR9/matlab/mps')
addpath('J:/sandboxR9/matlab/mps/common')
addpath('J:/sandboxR9/matlab/mps/main')
WIDTH = 100;
X = 30;
Y = 2;
Z = 10;

for ii =1:100
    for jj=1:100
        for kk=1:10%WIDTH
            index = Loc2index(ii,jj,kk,WIDTH);
            [X,Y,Z] = index2loc(index,WIDTH);
            if uint32(X)~= uint32(ii) ||... 
                uint32(Y) ~= uint32(jj) ||... 
                uint32(Z) ~= uint32(kk)
                fprintf( "Error at index = %d, [%0.1f,%0.1f,%0.1f]!=[%0.1f,%0.1f,%0.1f]\r\n",index,ii,jj,kk,X,Y,Z);
                return;
            end
        end
    end
end