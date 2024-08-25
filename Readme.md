# Welcome to UFDEV
This git repository is for 3-D thero-fluids simulation

## Installing on Windows
1. Clone the the repository the first time.\
  $ git clone https://github.com/jbdelete/UFDEV.git\
2. Change directory to\
  $ cd UFDEV/install/windows\


## Installing on Linux (assuming bash)
1. Install git: if there is a desktop version it is advisable to use that.
	sudo apt install git-all
1. Clone the the repository the first time.\
  $ git clone https://github.com/jbdelete/UFDEV.git\
2. Change directory to\
  $ cd UFDEV/install/linux\
3. Run the install script. It adds the MATLABPATH  environment variable\
   which set the paths for matlab.\
  $ bash ufdev.sh\
or\
  edit ~/.bashrc and insert the line:\
export MATLABPATH=~/UFDEV/Project/matlab/latex;~/UFDEV/Project/matlab/MPS/common;~/UFDEV/Project/matlab/MPS;~/UFDEV/Project/matlab/MPS/main;~/UFDEV/Project/matlab/MPS/main_rods
4. Add your identity \
	$ git config --global user.name "John Doe"\
	$ git config --global user.email johndoe@example.com\

5. Add your editor
	$ git config --global core.editor emacs\
	
#using git

Once the proeject is cloned then we need to know how to use git for collaboration.
The basic Git workflow goes something like this:\
1. You modify files in your working tree.\
2. You selectively stage just those changes you want to be part of your next commit, which adds
only those changes to the staging area.\
3. You do a commit, which takes the files as they are in the staging area and stores that snapshot
permanently to your Git directory.\

Follow this tuorial.

1. You need to attach you name and email to this version so the remote knows who you are.

1. Find ~/UFDEV/Contrib.md and open it in your editor.
2. Add the fllowing two lines
	## Your Name\
	###Your Uinversity - Your department\
3. Save it.
4. git is a distributed version control system. This means that the version that resides on your machine is a full repository.
	This means that your local version must be updated first and then the remote version on github needs to be updated.
	You 'commit' to your local version then you push to the remote one.
	

