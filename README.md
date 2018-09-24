# niceClips
A very simple script to interact with CLIPS (C Language Integrated Production System) in Ubuntu in a less infurating manner.

### How to
Copy the repository and run the only script inside, niceClips.sh, in your terminal.
It will open a new terminal window in wich CLIPS will run. Whatever you write in the first terminal will be inputed in the second one aswell, so you can write CLIPS commands while maintainig use of the arrow keys, history, autocomplete, etc. You can also work on the second terminal.
q, quit, or exit to close the CLIPS terminal and exit the script. If the second terminal doesn't close, be sure to manually log out or read screen's documentation to learn how to close a session.

### Requirements
* **CLIPS**
>sudo apt install clips

or install from source: http://clipsrules.sourceforge.net/

* **screen**
>sudo apt install screen
