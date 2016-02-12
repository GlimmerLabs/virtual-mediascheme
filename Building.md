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

* 2 GB Ram
* 8 GB Hard drive, expandable form

Install Xubuntu.  For the traditional CSC 151 course, I use the settings

* User: student
* Password: csc151
* Automatic login without password

Configure Terminal
------------------

Terminal runs white on black, which is painful.  We want to reconfigure 
it to the standard "Black on White".  

Start a terminal session.  Then Edit->Preferences->Colors->Load Presets ...
and select "Black on White".  You may also have to do this manually.

Upgrade
-------

The odds are that something will be out of date.  (Xubuntu upgrades
happen pretty frequently.)  Get it up to date.

    $ sudo apt-get upgrade

Fix Windows
-----------

By default, Xfce likes to expand windows when they hit the top of the screen.
It's annoying, at best.

* Find _Window Manager Tweaks_.
* Select _Accessibility_.
* Turn off "Automatically tile windows"

Task Bar
--------

Since students are used to the task bar on the bottom, we move the task
bar to the bottom.

* Right click on the panel, panel -> panel preferences -> unclick "Lock Panel"
* Click on the upper-left corner and drag the panel to the bottom.
* Relock the panel.

Install Synaptic
----------------

Synaptic is a tool that makes it easier to install other software.  You
need to install Synaptic from a terminal window.

     $ sudo apt-get install synaptic

You may be prompted for a password when installing synaptic (or any
software).  See above for more information.

Install Guest Additions
-----------------------

*This semester, I'm trying these steps for the original VM.*

1. Open a terminal window in the virtual machine.

2. Type `sudo apt-get install virtualbox-guest-dkms` 

3. Enter the password: `csc151` 

4. Answer yes to the random questions.

5. Restart the virtual machine.

6. After it restarts, try resizing the window.  If the desktop
resizes to match the window, everything is great. If not, talk to your
instructor. You can still do the next two steps.

7. Under the _Devices_ menu, select _Shared Clipboard_ and then _Bidirectional_.

8. Under the _Devices_ menu, select _Drag and Drop_ and then _Bidirectional_.

More Things to Install
----------------------

These are pieces of software that we rely upon, either directly or 
indirectly.

     sudo apt-get install libgimp2.0-dev racket git gedit vim feh
     
Create Launchers
----------------

It's helpful to have launchers for the main applications that students will
use.  Drag launchers for Gimp, DrDracket, Terminal, and Firefox to the task bar.

* Gimp is in the Graphics menu
* DrRacket is in the Development menu
* Terminal is in the Accessories menu
* Firefox is in the Internet menu

### Fixing the DrRacket Icon

In some situations (e.g., Xubuntu 15.04 and DrRacket 6.something), the DrRacket
icon doesn't appear.  Here's what I've observed.

* Icons are in `/usr/share/pixmaps`
* The DrRacket icons link to `/usr/share/racket/collects/icons`
* But they should link to `/usr/share/racket/pkgs/icons`

Solution: Link the pkgs icons to the collects icons.

    sudo ln -s /usr/share/racket/pkgs/icons 

Configure DrRacket
------------------

DrRacket should have the language set.  Start DrRacket, then 
Language->Choose Language.

Install the Mediascript Tools
-----------------------------

The Mediascript framework needs three packages.  

* gimp-dbus
* louDBus
* gigls

Here are approximate instructions for installing them in a terminal window.

    cd /home/student
    mkdir Mediascript
    cd Mediascript
    git clone https://github.com/GlimmerLabs/gimp-dbus
    git clone https://github.com/GlimmerLabs/louDBus
    git clone https://github.com/GlimmerLabs/gigls
    git clone https://github.com/GlimmerLabs/virtual-mediascheme

    cd /home/student/Mediascript/gimp-dbus
    make

    cd /home/student/Mediascript/louDBus
    make
    raco link `pwd`

The next steps require that we've started GIMP and turned on the server.

    cd /home/student/Mediascript/gigls
    make
    raco link `pwd`

Install Additional Files
------------------------

The files in the `Desktop` directory of this repository are useful to have
in a CSC 151 installation.  They are described in the accompanying README.md.  

    cp /home/student/Mediascript/virtual-mediascheme/Desktop/* /home/student/Desktop

Configure Launcher for .rkt Files
---------------------------------

Add the file `/usr/share/mime/packages/racket.xml'

    <?xml version="1.0" encoding="UTF-8"?> 
    <mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
        <mime-type type="text/x-racketsrc">
            <comment>Racket source code</comment>
            <sub-class-of type="text/plain"/>
            <glob pattern="*.rkt"/>
        </mime-type>
    </mime-info>
    
Run `update-mime-database`

    sudo update-mime-database /usr/share/mime
    
Check mime types

    cd /home/student/Desktop
    mimetype *.rkt
    
Do the rest

* Shift-Click on one of the .rkt files on the desktop.  
* Select "Properties ..."
* Change what it opens with to "Other Application".
* Select "DrRacket".
* Click "Close".
* Double click and ensure that DrRacket opens.
* Quit DrRacket.

Stop Screen Locking
-------------------

Recently screen locking got added.  We should turn it off.  

Bring up the Settings Manager.  Bring up the Power Manager.
Click on "Security".  Turn off "Lock Screen when System is
Going to Sleep".

*Old Instructions*: It appears that the screen saver is *Light Locker*.  
Bring up the Settings Manager (I used the application pane), select 
"Light Locker", and turn it off.

Add Account for `rebelsky`
--------------------------

Many of the instructions say to use /home/rebelsky/Desktop/whatever.
In the first attempt, I used `adduser` to add me.  That doesn't seem
to create the desktop, so perhaps I should use a GUI tool.  

    sudo adduser rebelsky
    
After adding me, we can copy files over

    sudo /bin/su rebelsky
    mkdir ~/Desktop
    cp /home/student/Desktop/kitten.jpg ~/Desktop/kitten.jpg
    
Set Home Page for Firefox
--------------------------

Clearly, the current section of 151 should be the home page for Firefox.
You may also want to make Firefox the default Web broswer.

Optional: Install Guest Additions
---------------------------------

We generally build a host-agnostic virtual machine.  However, you may
want to build a host-specific virtual machine by installing the guest
additions so that students don't have to.  Instructions are in the
user guide.


