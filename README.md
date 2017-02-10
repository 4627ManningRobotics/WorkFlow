# WorkFlow

*[this is a living document]*

To get started with Git in the 4627 Manning Robotics environment, you first need to install git and some other stuff:

* Windows:
 * Install "git for windows" from <https://git-for-windows.github.io/>
        *Ryan/Drew: is this a good windows tool?*

* Linux Debian/Ubuntu:
        
        apt install git

* OS X:
        <https://git-scm.com/download/mac>


The rest of this document assumes that you are using the command line interface.  At the present time, the coders on the team are all *eleeet haxx0rs* and are comfortable on the command line.  If you need command line help, please ask a previous team coder or a mentor.  Or fumble around in the gui and update this document accordingly.

Git is a distributed source code management system. This means that the repository is stored at a remote site like github.com or gitlab.com  (we use github.com).  You need to ask a mentor or teacher to give you access to the ManningRobotics group at www.github.com.  In order for them to do so, you should create an account on github.com first.

Once you've got access to the group, you can do a number of things.  You can clone an existing repository, or you can create your own and push it to github.  Lets start by creating your own repository.

Make sure you edit the ".gitconfig" file in this repository by putting your name and email address.  The name in this file is what will appear when people do "git log" so it should be descriptive and unambiguous.

### Create a new repository

Go to <https://github.com/4627ManningRobotics> and click the green  'New' button, and create a repository.  Once you have the new repository, copy the URL (e.g: <https://github.com/4627ManningRobotics/2018-Submarine-Wars> ). Then:

	$ cd 2018-Submarine-Wars
	$ git add <some files>
	$ git commit -m "Added this code stuff. it's cool."
	
Now you have a local repository with some files in it but those files aren't on github yet.  They're only on your computer.

	$ git push 
	
Now they are.

### Clone an existing repository

	$ cd $HOME/Documents
	$ git clone https://github.com/4627ManningRobotics/2017-Steamworks
	
Now you have a copy of the repository from github.com that your co-workers are all working on.

### Make a branch

When you're working with others on the same source code, it's easiest to assume the main tree is always functional.  This way the drive team can check out 'master' and drive the robot.  When working on new functionality, it is best to do it on a branch. This way you can run a rototiller through the code and not have any effect on anyone.  When you're finished and your code is tested, you can merge the code back to 'master'.

	$ git checkout -b my_awesome_mod
	$ <edit, commit with reckless abandon>
	
### Edit/Commit/Push/etc

Now you can work on your project on your private branch.  You can do whatever you want on it.  

	$ <edit files>
	
See what's changed:

	$ git status
	
	On branch master
	Your branch is up-to-date with 'origin/master'.
	
	Changes not staged for commit:
	(use "git add <file>..." to update what will be committed)
	(use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md
	
	no changes added to commit (use "git add" and/or "git commit -a")
	
Not sure what some changes are:

	$ git diff
	
Want to commit some of the changes but not all of them?

	$ git add -p README.md
	
Then it will run through the changes section by section and let you decide whether to add that section to the commit. Use "?" to get help.   This is useful if you've added a new feature to autonomous but also fixed a bug in the tank drive.. You can omit the tank drive changes and commit just the autonomous changes, and then go back and commit the tank drive changes seperately.  It makes the commit log cleaner and it's easier to pull individual commits across into another branch.

Once you're happy with the output of *git status*, you can:

	$ git commit -m "keep tank drive from wandering left"

If you're finished committing and want to sync the changes with the remote repository, you can then:

	$ git push
	
If this branch doesn't already exist at the remote repository, you have to tell it that what you have is a new local branch that you also want to exist at the remote.  You do that like so:

	$ git push --set-upstream origin my_awesome_mod
	
### Someone else can test your changes

You think your new feature is ready for testing.  The drive-team can check it out, build it and test it:

	$ git pull
	$ git checkout my_awesome_mod
	
### Ready to merge to master

The drive team has tested your new feature.  It works awesome and didn't break anything!  First you have to pull in any changes someone else may have committed to master while you were off working on your branch:

	$ git pull
	$ git merge 
