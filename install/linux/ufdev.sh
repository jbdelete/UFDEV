#!/bin/bash
read -p "Please Enter Path to the directory that contains UFDEV:" -r r1
parent=$(dirname "$r1")
echo
echo $r1
echo
while true; do
    read -p "Is this the correct parent directory?(y,n) " yn
    case $yn in
        [Yy]* ) echo "Copy this path and paste to the end of your ~/.bashrc file";echo; echo "export MATLABPATH=${r1}/UFDEV/Project/matlab/latex;$r1/UFDEV/Project/matlab/MPS/common;$r1/UFDEV/Project/matlab/MPS;$r1/UFDEV/Project/matlab/MPS/main;$r1/UFDEV/Project/matlab/MPS/main_rods";echo; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
