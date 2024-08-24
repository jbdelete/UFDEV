# Welcome to UFDEV
This git repository is for 3-D thero-fluids simulation
## Installing on Linux (assuming bash)
1. Clone the the repository the first time.\
  $ git clone https://github.com/jbdelete/UFDEV.git\
2. Change directory to\
  $ cd UFDEV/install/linux\
3. Run the install script. It adds the MATLABPATH  environment variable\
   which set the paths for matlab.\
  $ bash ufdev.sh\
or\
  edit ~/.bashrc and insert the line:\
export MATLABPATH="$HOME/UFDEV/Project/matlab/latex;$HOME/UFDEV/Project/matlab/MPS/common;$HOME/UFDEV/Project/MPS;$HOME/UFDEV/Project/matlab/main;$HOME/UFDEV/Project/matlab/MPS/main_rods'\
     
