# Welcome to UFDEV
This git repository is for 3-D thero-fluids-solids simulation.
There is a git tutorial in if you want to learn more:\
	UFDEV/install/GitTutorial.pdf
## All Users Create Account
1. First you must create an account on GitHub. Once you have created an account send the\
   username (email address) to jb2ndr@ufl.edu so you can be added to the project.
2. Wait until you recieve an invite.
3. Press the invite link and accept the invite.
4. Once the moderator is notified that you have accepted the invitation you will recieve an email notifing you that you can continue to install.
### Create a Personal Token
In your browser navigate to:
**https://github.com/jbdelete/UFDEV**
5. Select the **Profile Icon** top right.
6. Select **Settings**.
7. All the way at the bottom select **<> Developer settings**.
8. Select the **Personal Access Tokens** dropdown.
9. Select **Personal Access Tokens (classic)**
10. Asks you password
11. Enter nick name for token in text box.
12. Select everything in the check box panel below.
13. At the very bottom select **Generate personal access token**
14. Copy and store the token somwhere safe.
15. Continue to **Installing on Windows** or **Installing on Linux**.

   
 
## Installing on Windows
1. Clone the the repository the first time.\
  **$ git clone https://github.com/jbdelete/UFDEV.git**
2. Change directory to\
  **$ cd UFDEV/install/windows**

## Installing on Linux (assuming bash)
1. Install git: if there is a desktop version it is advisable to use that.\
  **$ sudo apt install git-all**
1. Clone the the repository the first time.\
  **$ git clone https://github.com/jbdelete/UFDEV.git**
2. Change directory to\
  **$ cd UFDEV/install/linux**\
3 Run the install script.\
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**$ bash ufdev.sh**\
   It will ask:\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Please Enter Path to the directory that contains UFDEV:**\
   Enter the parent directory of UFDEV without trailing slash.\
   The script will print the directory you entered and ask you to verify:\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Is this the correct parent directory?(y,n)**\
   If the answer is *yes*, then the script will print the MATLABPATH string
   and instruct you to:\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Copy this path and paste to the end of your ~/.bashrc file.**\
   Copy and paste the MATLABPATH string to the end of your ~/.bashrc\
   Close the current bash terminal and open a new one. This will echo the paths in the string you just added to your bashrc.\
   After each path it should print "is a directory".
4. Add your identity.\
	**$ git config --global user.name "John Doe"**\
	**$ git config --global user.email johndoe@example.com**
5. Add your editor\
	**$ git config --global core.editor emacs**
	
# Using git

Once the project is cloned then we need to know how to use git for collaboration.
The basic Git workflow goes something like this:
1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds
only those changes to the staging area.
3. You do a commit, which takes the files that are in the staging area and stores that snapshot
permanently to your Git directory. We will usuall not do a stage and uodate our changer with a single command.

If you try to commit change to the remote repository but somone elses has
pushed changes to it, then you will have to pull the remote version so that your version 
knows what remote changes it is pushing against.

Follow this tuorial.

1. You need to attach your name and email to this version so the remote knows who you are.
2. Use the email address of your **GitHub account that you recieved the invite under**.
3. Find
   **~/UFDEV/Contrib.md and open it in your editor**.
4. Add **YOURNAME** to the repsoitory. 
	**'## Your Name'**\
5. Add **YOUREMAIL** to the repsoitory. 
	**'###Your University - Your department'**
git is a distributed version control system so the version that resides on your machine is a full repository.
This means that your local version must be updated first, and then the remote version on github needs to be updated.
You **commit** to your local version then you **push** to the remote one.

6. Before making anything permanent get the status of your local version. Change to the project directory (UFDEV). Then:\
   **$ git status**
7. Commit your local changes. The -a parameter will tell the commit to add any new files.\
   **$ git -a commit** 
8. Now update the local repository with the remote.\
   **$ git pull**
9. Then push your changes to the remote repository on GitHub. YOURNAME is the name you used in step 2.
   (KEY) is a CRC string you recieve by email. \
   **$ git push -u https://(YOURNAME):(KEY)@github.com/jbdeete/UFDEV.git main**\
   for example my push command loks like:\
   **$ git push -u https://Jack:ghp_HXmEbbuUBC@github.com/jbdelete/UFDEV.git main**
10. Go to\
   **https://github.com/jbdelete/UFDEV**
   and check the Contrib.md file to see if you changes were updated.
11. Make sure Matlab was not running during this process. If it was, close it and reopen, so it can see the MATLABPATH environment variable.
    Navigate to\
   	**~UFDEV/Project/matlab/MPS/main_rods**\
   and run\
	main_JustRods.m
12. Email any problems.
    

   


 

