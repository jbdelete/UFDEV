
clc
clear all
close all
more off

run('addPath.m');

disp("Default Main file");
DateString = date();
disp(sprintf("%s",DateString));
%==================== First time run ======================
if 1
if ~exist('..\equations', 'dir')
mkdir '..\equations';
mkdir '..\tables';
mkdir '..\images';
mkdir '..\citations';
mkdir '..\authors';
mkdir '..\matricies';
mkdir '..\doc';
mkdir '..\data';
mkdir '..\cad';
mkdir '..\text';
mkdir '..\orig';
mkdir '..\rpt';
end
end
CleanPre();
%============== Clean to insure everything updates ========

do_clean		= 0;
if do_clean == 1
	delete (sprintf('%s%s','..\equations\','*.*'));
	delete (sprintf('%s%s','..\tables\','*.*'));
	delete (sprintf('%s%s','..\images\','*.*'));
	delete (sprintf('%s%s','..\citations\','*.*'));
	delete (sprintf('%s%s','..\authors\','*.*'));
	delete (sprintf('%s%s','..\matricies\','*.*'));
	%CleanTex();
	
end
%Always clean temp files or you get repeates.

%============== Constants =================================
%============== Defines ===================================
LEGEND_BCENTER	 	= 1;
LEGEND_TCENTER 		= 2;
LEGEND_BLEFT 		= 3;
LEGEND_TLEFT 		= 4;
LEGEND_BRIGHT	 	= 5;
LEGEND_TRIGHT 		= 6;
%================================ Authors =================
authList 						= cell(1);
AUTH_FIRST						= 1;
AUTH_LAST						= 2;
AUTH_POSITION					= 3;
AUTH_ORGANIZATION				= 4;
authList{1,AUTH_LAST} 			= 'Bell';
authList{1,AUTH_FIRST} 			= 'Jack';
authList{1,AUTH_POSITION} 		= 'Student';
authList{1,AUTH_ORGANIZATION} 	= 'University of Florida';

%Authors(authList);
%================================ Header Footer  ===============
%Heading('CLASS SECTION ASSIGNMENT DATE');
%================================ Flags  ===============
plt_num			= 1;
redo_angles		= 1;

%Clean uo pre files
ptx = fopen ('tablespre.tex', "w", "ieee-le");
if(ptx<0)
	fprintf('MatlabTableIEEE - Failed to open pre.tex - aborting\r\n',latex_fl);
	return
end
fclose(ptx);
%================================ Citations  ===============
run('a_Images.m');
%run('DoBiblinks.m');
%run('TableAcronyms.m')
run('a_Equations.m');
%run('a_Plots.m');
%run('a_Tables.m');
%slocDir('Y:\_Latex_IntiermReports\proj','proj.txt')
EndPre();

%status = system(['"C:\Program Files\Notepad++\notepad++" J:\sandboxR9\Thesis\rpt\pre.tex']);