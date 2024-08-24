REM You may need to change the location of the Acrobat Reader
REM You can also comment out the DEL to keep all files
@echo off
cd J:\RCCDJournalDynamic\rpt
echo %cd%
pause

DEL *.log *.aux  *.blg *.bak *.sav *.dvi *.bbl *.blg *.log
ECHO UF THESIS BATCH FILE
latex -interaction=batchmode main
latex -interaction=batchmode main
bibtex main >> make_xelatex_bib.log
latex -interaction=batchmode main >> make_latex.log
latex -interaction=batchmode main 
xelatex -interaction=nonstopmode main >> make_xelatex.log
xelatex main
REM start "c:\Program Files (x86)\Adobe\Reader 9.0\Reader\AcroRd32.exe" _main.pdf
ECHO CLEANING FOLDER...
REM DEL *.log *.aux  *.blg *.bak *.sav
REM del *.bbl
REM DEL tex\*.aux  tex\*.blg tex\*.bak tex\*.sav
exit 0