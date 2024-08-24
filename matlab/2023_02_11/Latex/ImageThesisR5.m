%linestyle
%"-" Solid line. [default]
%"--" Dashed line.
%":" Dotted line.
%"-." A dash-dot line.
%"none" No line. Points will still be marked using the current Marker Style.

%marker A character indicating a plot marker to be place at each data point,
% 		or "none", meaning no markers should be displayed.


function ret = ImageThesisR5(Name,texDir,Images,CapTitle,Caption,Zoom,ImgAry)

	
	fprintf('This is Single Image Thesis - %s\r\n',Name);
	latex_fl = sprintf('%s\\%s.tex',texDir,Name);
	
	ltx = fopen (latex_fl, "w", "ieee-le");
	if(ltx<0)
		fprintf('Equation - Could Not Create File %s - Aboting\r\n',latex_fl)
		return
	end
	rows = ImgAry(1);
	cols = ImgAry(2);
	
	
	fprintf(ltx,'\\begin{flushleft}\r\n');
	fprintf(ltx,'\\begin{multiFigure}\r\n');
    fprintf(ltx,'\\begin{center}\r\n');

	imgnum = 1;
	if size(Images,2) > 1
		for rr = 1:rows
			for cc = 1:cols
				if imgnum > size(Images,2)
					break;
				end
				fprintf(ltx,'\\addFigure {%0.2f} %s\r\n',sprintf('{\\includegraphics{%s}}',Zoom,string(Images(imgnum))));
				imgnum =imgnum +1;
			end
			fprintf(ltx,'}\r\n');
		end	
	else
		
		fprintf(ltx,'%s\r\n',sprintf('\\includegraphics[width=%0.2fin]{%s}',Zoom,string(Images(1))));
	end
			
	fprintf(ltx,'\\end{center}\r\n');
	fprintf(ltx,'%s\r\n',sprintf('\\captionof{figure}[%s]{%s}',CapTitle,Caption));
	fprintf(ltx,'%s\r\n',sprintf('\\label{fig:%s}',Name));
    fprintf(ltx,'\\end{multifigure}\r\n');
    fprintf(ltx,'\\end{flushleft}\r\n');
	fclose(ltx);
	if 0
	ltx = fopen ('..\rpt\pre.tex', "a", "ieee-le");
	fprintf(ltx,'%%============================================= Image %s \r\n',Name);
	fprintf(ltx,'%s',sprintf('Fig. \\ref{fig:%s}\r\n',Name));
	fprintf(ltx,'%s',sprintf('\\input{../images/%s.tex}\r\n',Name));
	
	
	
	if(ltx<0)
		fprintf('Equation - Could Not Create File %s - Aboting\r\n',latex_fl);
		return
	end
	fclose(ltx);
    end
    end

