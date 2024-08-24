@echo off
set src_folder=.
set dst_folder=2023_02_11
set file_list=filelist.txt

del rpt\*.aux
del rpt\*.gz
del rpt\*.log
del rpt\*.lof
del rpt\*.loa
del rpt\*.lot
del rpt\*.out
del rpt\*.bbl
del rpt\*.bcf
del rpt\*.dvi
del rpt\*.blg
del rpt\*.bbl
del rpt\*.pdf
del rpt\*.toc
del rpt\*.txt
del rpt\*.xml
del rpt\*.synctex



rem rmdir /S /Q "%dst_folder%"
rem %pause
if exist "%dst_folder%" rmdir "%dst_folder%" /s /q
if not exist "%dst_folder%" mkdir "%dst_folder%"

for /f "delims=" %%f in (%file_list%) do (
    xcopy "%src_folder%\%%f" "%dst_folder%\%%f" /s /i
	rem echo "%src_folder%\%%f" "%dst_folder%\"
)
"C:\Program Files\7-Zip\7z.exe" a "%dst_folder%.zip" "%dst_folder%"

pause