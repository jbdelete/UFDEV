function CreateDOILinks(Filename)

temps = table()

s = struct('date',1900,'text','empty');
 
latex_fl = sprintf('%s.bib',Filename);
ptx = fopen (latex_fl, "r", "ieee-le");
if(ptx<0)
    fprintf('Failed to Open BIB file\r\n',latex_fl);
    return
end
if 1
csv_fl = sprintf('%sdoi.bib',Filename);
csvhndl = fopen (csv_fl, "w", "ieee-le");
if(csvhndl<0)
	fprintf('MatlabTableIEEE - Failed to open pre.tex - aborting\r\n',latex_fl);
	return;
end
end
count = 0;
holdKey = "";
justCopy = 0;
global hasDOI;
global doiStr;
doiStr = "";
global newhld;
newhld = "";
hasDOI = 0;
hasURL = 0;
global titlestr;
titlestr = 0;
txthld = "";
lineNumber = 0;
exitLast = 0;
while(1)
    tline = fgetl(ptx);
    if(feof(ptx))
        exitLast = 1;
        tline = "@";
        fprintf("End of File\n")
    end
    
    %if(contains(tline,'@'))
    %    holdKey = extractAfter(tline,"@");
     %   holdKey = extractAfter(holdKey,"{");
     %   if(contains(holdKey,"zou2017",'IgnoreCase',true))
     %       1;
    %    end
    %end
     if(contains(tline, '  title'))
        ttlStr = extractAfter(tline,"title = {");
        %ttlStr = erase(ttlStr,"{");
        %ttlStr = erase(ttlStr,"}");
        if justCopy == 0
            ttlStr = erase(ttlStr,",");
        end
        %ttlStr = erase(ttlStr,"\n");
        txthld = strcat(txthld,"  title = {");
        notitle = ttlStr;
        titlestr = 1;
        count = count+1;
    end
    if(contains(tline,'@') ==1)
        if(lineNumber ~= 0)
            if (hasDOI == 1)
                if justCopy == 0
                    doiStr = sprintf("\\href{https://doi.org/%s}{%s},\n",doiStr,ttlStr);
                    %doiStr = sprintf("{%s},\n",ttlStr);
                else
                    doiStr = sprintf("%s\n",ttlStr);
                end
                txthld = insertAfter(txthld," title = {",doiStr);
                hasDOI = 0;
                hasURL = 0;
                doiStr = "";
           elseif (hasURL == 1 && hasDOI == 0)
                if justCopy == 0
                    urlStr = sprintf("\\href{%s}{%s},\n",urlStr,ttlStr);
                    %doiStr = sprintf("{%s},\n",ttlStr);
                else
                    urlStr = sprintf("%s\n",ttlStr);
                end
                txthld = insertAfter(txthld," title = {",urlStr);
                hasURL = 0;
                doiStr = "";
            else
                notitle = sprintf("%s,\n",notitle);
                txthld = insertAfter(txthld," title = {",notitle);
            end
            
            s(count).text = txthld;
            fprintf(csvhndl,'%s',txthld);
            txthld = "";
        else
            lineNumber = 1;
        end
        tline = strcat(tline,sprintf("\n"));
        txthld = txthld+tline;
    else
       if (titlestr == 0)
            tline = strcat(tline,sprintf("\n"));
            txthld = txthld+tline;
            titlestr = 0;
        else            
            titlestr = 0;            
        end
    end
    if(contains(tline, 'year'))
        datestr = extractAfter(tline,"year = {");
        datestr = erase(datestr,"}");
        datestr = erase(datestr,",");
        datestr = erase(datestr,newline);
        s(count).date = datestr;
        if(isempty(datestr))
            fprintf('Line %d, %s has no year field\r\n',count,ttlStr);
        end
    end
    if(contains(tline, '  doi') && hasDOI == 0)
        tstStr = extractAfter(tline," doi = {");
       pat = [ "#","'", "(", ")", "="];
       if(contains(tstStr, pat))
            fprintf("Error nonprintng DOI char in :%s",tline);
       end
       doiStr = extractAfter(tline," doi = {");
       doiStr = erase(doiStr,",");
       doiStr = erase(doiStr,",");
       doiStr = erase(doiStr,"{");
       doiStr = erase(doiStr,"}");
       doiStr = erase(doiStr,newline);
       doiStr = erase(doiStr,char(92));
       match = ["#","'", "(", ")", "="]; 
       doiStr = erase(doiStr,match);
       %fseek(ptx,positon,'bof');
       hasDOI = 1;
    end
    if(contains(tline, '  url = {') && hasURL == 0) 
       urlStr = extractAfter(tline," url = {");
       urlStr = erase(urlStr,",");
       urlStr = erase(urlStr,",");
       urlStr = erase(urlStr,"{");
       urlStr = erase(urlStr,"}");
       urlStr = erase(urlStr,newline);
       urlStr = erase(urlStr,char(92));
       match = ["#","'", "(", ")", "="]; 
       urlStr = erase(urlStr,match);
       %fseek(ptx,positon,'bof');
       hasURL = 1;
    end
    if (exitLast == 1)
        T = struct2table(s);
       % T = sortrows(T,1);
        for ii = 1:size(T,1)
           fprintf(csvhndl,'%s',T{ii,2}); 
        end
        fclose(ptx);
        fclose(csvhndl);
        return;
    end
end



fclose(ptx);
fclose(csvhndl);