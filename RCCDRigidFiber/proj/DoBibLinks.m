clc
clear all;
fclose all;
close all;

batdir = "J:\RCCDJournalDynamic\rpt";
fileNam = "References";
for jj = 1:1
   CreateDOILinks(fileNam);
end
batcmd = sprintf("start /MAX %s/make_xelatex_bib.bat",batdir);
system(batcmd);
%launch_a_bat_file("../rpt_thesis","make_xelatex_bib.bat")
fprintf("Done.\r\n");