# Welcome to UFDEV
This git repository is for 3-D thero-fluids-solids simulation.
There is a git tutorial in:\
	UFDEV/install/GitTutorial.pdf
## Installing on Windows
1. Clone the the repository the first time.\
  $ git clone https://github.com/jbdelete/UFDEV.git
2. Change directory to\
  $ cd UFDEV/install/windows


## Installing on Linux (assuming bash)
1. Install git: if there is a desktop version it is advisable to use that.\
  $ sudo apt install git-all
1. Clone the the repository the first time.\
  $ git clone https://github.com/jbdelete/UFDEV.git
2. Change directory to\
  $ cd UFDEV/install/linux
3. A. You can open the file\
   ~UFDEV\install\linux\bashrc_edit.text\
   and add it to the end of ~/.bashrc\
OR\
   B. Run the install script. It adds the MATLABPATH environment variable automatically. 
   which set the paths for matlab.\
  $ bash ufdev.sh
4. Add your identity.\
	$ git config --global user.name "John Doe"\
	$ git config --global user.email johndoe@example.com
5. Add your editor\
	$ git config --global core.editor emacs
	
# Using git

Once the project is cloned then we need to know how to use git for collaboration.
The basic Git workflow goes something like this:
1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds
only those changes to the staging area.
3. You do a commit, which takes the files as they are in the staging area and stores that snapshot
permanently to your Git directory.

If you try to commit change to the remote repository but somone elses has
pushed changes to it, then you will have to pull the remote version so that your version 
knows what remote changes it is pushing against.

Follow this tuorial.

1. You need to attach you name and email to this version so the remote knows who you are.

1. Find ~/UFDEV/Contrib.md and open it in your editor.
2. Add the fllowing two lines, without the quotes. Use just your first name.\
	'## Your Name'\
	'###Your University - Your department'
3. Save it.\
	git is a distributed version control system so the version that resides on your machine is a full repository.
	This means that your local version must be updated first and then the remote version on github needs to be updated.
	You *commit* to your local version then you *push* to the remote one.
4. Before making anything permanent get the status of your local version. CHnage to the partent directory of the project (UFDEV). Then:\
   $ git status
5. Commit your local changes. The -a parameter will tell the commit to add any new files.\
   $ git -a commit 
6. Now update the local repository with the remote.\
   $ git pull
7. The push your changes to the remote repository on GitHub. YOURNAME is the name you used in step 2.\ (KEY) is a CRC string you recieve by email. It expires every 90 days.
   $ git push -u https://(YOURNAME):(KEY)@github.com/jbdeete/UFDEV.git main
   for example my push command loks like:\
   git push -u https://Jack:ghp_HXmEbbuUBC@github.com/jbdelete/UFDEV.git main
9. Go to\
   https://github.com/jbdelete/UFDEV\
   and check the Contrib.md file to see if you chnages were updated.





   end


 

