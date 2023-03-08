# Bash Commands Manual

### Where am I?
> * `0-current_working_directory` script or command `pwd` -- prints the absolute path name of the current working directory

### What's in there?
> * `1-listit` script or command `ls` -- Display/list the contents of your current directory

### There is no place like home
> * `2-bring_me_home` script of commands `cd ~` or `cd $HOME'  -- Change the working directory to the user's home directory  

### The long format
> * `3-listfiles` script or command `ls -l` -- Display contents of the current directory in a long format

### Hidden files
> * `ls -a` -- Display current directory, including hidden files. Short format
> * `4-listmorefiles` script or commands `ls -al` or `ll` -- Display current directory, including hidden files. Long format

### I love number
> * `5-listfilesdigitonly` script or command `ls -anl` -- Display current directory contents in 'long format', 'with user and group IDs dispalyed numeriacally' and 'hidden files (starting with `.`)'

### Welcome
> * `6-firstdirectory` script or command `mkdir -p /tmp/my_first_directory` -- creates a directory named 'my_first_directory' in the `/tmp/` directory and if `/tmp` does not exist, create it.

### Betty in my first directory
> * `7-movethatfile` script or `mv /tmp/betty /tmp/my_first_directory/` -- moves the file betty from `/tmp/` to `/tmp/my_first_directory` directory

### Bye bye Betty
> * `8-firstdelete` script or `rm /tmp/my_first_directory/betty` command  -- deletes the file betty from `/tmp/my_first_directory/` directory

### Bye bye My first directory
> * `9-firstdirdeletion` script or  `rm -r /tmp/my_first_directory/` command -- deletes the directory `my_first_directory` in the `/tmp` directory

### Back to the future
> * `10-back` script or `cd -` command -- changes the working directory to the previous one.

### Lists
> * `11-lists` script or `ls -al . ../ /boot` command -- lists all files in the current directory and in the parent of the working directory and the `boot` directory in long format.

### File type
> * `12-file_type` script or `file /tmp/iamafile` command -- prints the type of the file named `iamafile` in the `/tmp` directory 

### We are symbols, and inhabit symbols
> * `13-symbolic_link` script or `ln -s /bin/ls __ls__` command -- creates a symbolic link to /bin/ls

### Copy HTML files
> * `14-copy_html` script or `cp -u *.html ../` command -- copies all the HTML files from the current working directory to the parent of the working directory, but only copy files that did not exist in the parent of the working directory or were newer than the versions in the parent of the working directory.

### Let's move
> * `100-lets_move` script or `mv [[:upper:]]* /tmp/u` command --  moves all files beginning with an uppercase letter to the directory `/tmp/u`.

### Clean Emacs
> * `101-clean_emacs` script or `rm *~` command  - deletes all files in the current working directory that end with the character `~`.

### Tree
> * `102-tree` script or `mkdir -p welcome/to/school` command  - creates the directories `welcome/`, `welcome/to/` and `welcome/to/school` in the current directory.

### Life is a series of commas, not periods
> * `103-commas` script or `ls -xamp` command - lists all the files and directories of the current directory, separated by commas (,).
> > > - Directory names should end with a slash `(/)`
> > > - Files and directories starting with a dot `(.)` should be listed 
> > > - The listing should be alpha ordered, except for the directories `.` and `..` which should be listed at the very beginning
> > > - Only digits and letters are used to sort; Digits should come first
> > > - You can assume that all the files we will test with will have at least one letter or one digit
> > > - The listing should end with a new line

### File type: School
> * `school.mgc` file that can be used with the command `file` to detect `School` data files. `School` data files always contain the string 'SCHOOL at offset 0'.
