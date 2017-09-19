programming
===========

Random Programming files (i.e. syntax highlighting, notes)

Sublime Text Syntax Highlighting
=========
Installation
====
    Download the installer from the Sublime Text Website
    Run the installer
    Run Sublime Text
    Install the https://packagecontrol.io/installation:Sublime Text Package Control following the instructions for the version installed above
    Shutdown Sublime Text

Syncing settings via Dropbox/Github
====

NOTE: Only required if it desired to sync settings and packages across multiple computers

    Windows:
        Setup sync folder

       cd "%appdata%\Sublime Text 3\Packages\"
       mkdir "%userprofile%\<path-to-dropbox/git>\Sublime Text 3"
       mv User "%userprofile%\<path-to-dropbox/git>\Sublime Text 3\"
       mklink /D User "%userprofile%\<path-to-dropbox/git>\Sublime Text 3\User"
       
NOTE: You need to use a command window with administrative rights

NOTE: Change the paths to match your environment

    Linux:
        Setup sync folder

       # Create the sync directory in Dropbox
       $ mkdir ~/Dropbox/sublime-text-3/

       # Move your ST3 "Packages" and "Installed Packages" to Dropbox
       $ cd ~/.config/sublime-text-3/
       $ mv Packages/ ~/Dropbox/sublime-text-3/
       $ mv Installed\ Packages/ ~/Dropbox/sublime-text-3/

       # Then symlink your Dropbox directories back locally
       $ ln -s ~/Dropbox/sublime-text-3/Packages/
       $ ln -s ~/Dropbox/sublime-text-3/Installed\ Packages/
       

Install CRBasic Syntax Highlighting

    Download the Sublime Text 3 Syntax files
    Extract the ZIP file in the Sublime Text Package Users Directory:
        Windows:

        "%appdata%\Sublime Text 3\Packages\User"

        Linux:

        ~/.config/sublime-text-3/Packages/User

