clc
clear all
close all


Name = 'defs';
latex_fl = sprintf('../rpt/%s.tex',Name);
ltx = fopen (latex_fl, "w", "ieee-le");
if(ltx<0)
	fprintf('Equation - Could Not Create File %s - Aboting\n',latex_fl)
	return
end

filelist = ["Abbrevs",...
            "nomenclature"];
fprintf(ltx,'%%!TeX root = main.tex\n');
fprintf(ltx,'\\begin{acronym}[TDMA]\n');
for kk = 1:length(filelist)
    opts = detectImportOptions(filelist(kk));
    %opts.PreserveVariableNames = true;
    T = readtable(filelist(kk),opts);
   % T.Properties.VariableNames =  {'Ref','Date'};
    tot = size(T,1);
    
    
    %fprintf(ltx,'\\singlespacing\n\\begin{tabular}{l p{5in}}\n');
    %fprintf(ltx,'\\begin{acronym}[TDMA]\n');
    for ii = 1:tot
        if mod(ii,22)  == 0
            %fprintf(ltx,'\\end{tabular}\n');
            %fprintf(ltx,'\\end{acronym}\n');
            
            fprintf(ltx,'\\newpage\n');
            %fprintf(ltx,'\\begin{acronym}[TDMA]\n');
            %fprintf(ltx,'\\singlespacing\n\\begin{tabular}{l p{5in}}\n');
            
        end
    
        if kk == 1
            fprintf(ltx,'\\acro{%s}{%s}\n',string(T{ii,1}),string(T{ii,2}));
        else
            fprintf(ltx,'\\acro{%s}[%s]{%s}\n',string(T{ii,3}),string(T{ii,1}),string(T{ii,2}));
        end

        
    end
    %fprintf(ltx,'\\end{tabular}\n');
    
    
end
fprintf(ltx,'\\end{acronym}\n');
%fprintf(ltx,'\\doublespacing\n');
fclose(ltx);

