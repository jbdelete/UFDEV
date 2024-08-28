#!/bin/bash
read -p "Please Enter Path:" -r r1
parent=$(dirname "$r1")
echo Copy and paste the following to bashrc:
echo 
echo "export MATLABPATH=${r1}/UFDEV/Project/matlab/latex;$r1/UFDEV/Project/matlab/MPS/common;$r1/UFDEV/Project/matlab/MPS;$r1/UFDEV/Project/matlab/MPS/main;$r1/UFDEV/Project/matlab/MPS/main_rods"
echo
