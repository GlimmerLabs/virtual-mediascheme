Building a Xubuntu Virtual Machine for Mediascheme
==================================================

These are rough instructions for building a Xubuntu virtual machine 
that can run the Mediascheme software.  They serve as SamR's "cheat 
sheet" when he needs to build a new virtual machine, but they should
be useful for others..

Mediascheme should be able to be installed on any Linux distribution
that includes DBus and some other utilities.  However, it has only been
tested on Debian, Ubuntu, and Xubuntu.

Because these are primarily for the developer, they assume that the reader
knows something about Virtual Box and Linux installations on Virtual Box.

Initial Setup
-------------

Create a new Linux/Ubuntu machine in Virtual Box.  I tend to configure
the machine with

* 1 GB Ram
* 8 GB Hard drive, expandable form

Install Xubuntu.  For the traditional CSC 151 course, I use the settings

* User: student
* Password: csc151
* Automatic login without password

Upgrade
-------

The odds are that something will be out of date.  (Xubuntu upgrades
happen pretty frequently.)  Get it up to date.

    $ sudo apt-get upgrade

Task Bar
--------

Since students are used to the task bar on the bottom, we move the task
bar to the bottom.

* Right click on the panel, panel -> panel preferences -> unclick "Lock Panel"
* Click on the upper-right and drag the panel to the bottom.
* Relock the panel.

Install Synaptic
----------------

Synaptic is a tool that makes it easier to install other software.  You
need to install Synaptic from a terminal window.

     $ sudo apt-get install synaptic

You may be prompted for a password when installing synaptic (or any
software).  See above for more information.

More Things to Install
----------------------

These are pieces of software that we rely upon, either directly or 
indirectly.

     $ sudo apt-get install libgimp2.0-dev 
     $ sudo apt-get install racket
     $ sudo apt-get install git
     $ sudo apt-get install gedit
     $ sudo apt-get install vim
     $ sudo apt-get install chromium-browser
     
Create Launchers
----------------

It's helpful to have launchers for the main applications that students will
use.  Drag launchers for Gimp, DrDracket, and Terminal to the task bars.

* Gimp is in the Graphics menu
* DrRacket is in the Development menu
* Terminal is in the Accessories menu.

Install the Mediascript Tools
-----------------------------

The Mediascript framework needs three packages.  

* gimp-dbus
* louDBus
* gigls

Here are approximate instructions for installing them in a terminal window.

    $ cd /home/student
    $ mkdir Mediascript
    $ cd Mediascript
    $ git clone https://github.com/GlimmerLabs/gimp-dbus
    $ git clone https://github.com/GlimmerLabs/louDBus
    $ git clone https://github.com/GlimmerLabs/gigls

    $ cd /home/student/Mediascript/gimp-dbus
    $ make

    $ cd /home/student/Mediascript/louDBus
    $ make
    $ raco link `pwd`

The next steps require that we've started GIMP and turned on the server.

    $ cd /home/student/Mediascript/gigls
    $ make
    $ raco link `pwd`
    $ make compile

Install Additional Files
------------------------

The files in the `Desktop` directory of this repository are useful to have
in a CSC 151 installation.  They are described in the accompanying README.md.  

Configure Terminal
------------------

Terminal runs white on black, which is painful.  We want to reconfigure 
it to the standard "Black on White".

Start a terminal session.  Then Edit->Preferences->Colors->Load Presets ...
and select "Black on White".

Configure Launcher for .rkt Files
---------------------------------

*Warning!*  This solution is not ideal.  Right now, all it does it
make it easier to select DrRacket as the application.  (Xubuntu
seems to consider .rkt files as plain text files, so making DrRacket
the default application for .rkt files means it would also be what
you get when you double click on .txt files.) We really need to
update various registries, but that's a task for another day.

* Shift-Click on one of the .rkt files on the desktop.  
* Select "Properties ..."
* Change what it opens with to "Other Application".
* Select "DrRacket".
* Click "Close".
* Double click and ensure that DrRacket opens.
* Quit DrRacket.
* Open the properties of the file again.
* Restore the open-with application to Mousepad.

Optional: Install Guest Additions
---------------------------------

We generally build a system-agnostic virtual machine.  However, you may
want to build a system-specific virtual machine by installing the guest
additions so that students don't have to.  Instructions are in the
user guide.
