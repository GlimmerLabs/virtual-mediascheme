Using Mediascript with Virtual Box
==================================

As an experiment, we are providing a virtual machine with Mediascheme,
the software for Grinnell's CSC 151.   The virtual machine is
intended primarily for students in that course, although anyone
with an interest may feel free to use it.

We have provided a machine-independent version that should work on
Mac, Windows, and Linux.  In the near future, we may provide versions
customized for Mac and Microsoft Windows.

Feel free to email questions about these instructions or about the 
virtual machine to Samuel A. "SamR" Rebelsky at <rebelsky@grinnell.edu>.

Virtual Box
-----------

The software we use to run virtual computers is called Virtual Box.  You can
download the version of Virtual Box for your computer from
<https://www.virtualbox.org>.  (You can also find documentation there.)

Virtual Machine
---------------

We hope to put Mediascheme on the Web.  (At that point, the README
file should be updated with a link.)  For now, you will probably
get it on a flash drive.  The virtual machine will be named something
like `Xubuntu151-v1.3.vba.ova`.

*Warning!*  The virtual machine is a little over 2 gigabytes.  It
will take you awhile to download.  It is also about 5 gigabytes
when uncompressed.  Make sure that you have enough disk space.

Account Information
-------------------

Your virtual computer comes configured with a single account, named
"**student**", with a password of "**csc151**".  (We've configured the virtual
machine not to ask for an account or password, but you may find them useful
if you need to install other software on the virtual computer.)

Setting Up
----------

1. Start by installing VirtualBox.  (If you've installed software before, it
   should be straightfoward.)

2. Identify the appropriate file from the flash drive, DVD, or Web.  

3. Double click on that file.  If all goes well, in a few minutes you should 
   see a virtual machine along the left column in VirtualBox.

4. Start the Virtual Machine.

5. Install the Guest Additions (see below).

Issues with Microsoft Windows Computers
---------------------------------------

Some computers that run Microsoft Windows have virtualization turned
off by default.  That means that they will not allow you to run
virtual machines.  Hence, you need to turn virtualization on.  Here's
what's worked in the past.

1. Shut down the machine and reboot.  

2. Go into the BIOS. (Unfortunately, different computers have different 
ways of entering the BIOS.  You'll need to figure out the right way for 
your computer.)

3. Go to the "Advanced" screen.  

4. Turn on the "Virtualization" option.

If that doesn't work, you can try asking for help.  None of the CSC 151 
faculty regularly use Microsoft Windows, so help is likely to be limited.

Important! Additional Setup: The Guest Additions
------------------------------------------------

The default settings for virtual machines have a small fixed screen size.  You can
often get the virtual computer to resize the screen size when you resize the
window by installing some host-specific additions.  (By "host-specific", we
mean that it's related to the computer that you're running Virtual Box on,
whether it be Mac, Windows, or Linux.) The host-specific additions also add
some other useful features, such as the ability to copy and paste between
the virtual machine and the host machine.

Ideally, you should be able to select 'Devices' -> 'Install Host Additions'
and everything will work automatically.  But that's not been our experience.
If you're lucky, you'll see a virtual CD appear on the desktop and an
installation program will start to run.  If you are a bit less lucky, you'll
see a virtual CD appear on the desktop, but the installation program won't
run.  If you're unlucky, the virtual CD won't appear at all.  We can't help
with that last problem (at least not without sitting down with you), and you
should just go ahead to the "Running the Virtual Machine" section.   If the
virtual CD does appear, something like the following should work.

1. Double click on the CD icon.

2. Double click on `autorun.sh`

3. Enter the password (csc151).

4. A terminal window should open.  When it's done, it will say something 
like "Click Enter to Finish".  Do so.

Once you've installed the additions, you should restart the virtual machine.
(Click in the lower left-hand corner.  Select "Log Out".  Select "Restart".

After the machine restarts, see if resizing the window works appropriately.

If the window resizes correctly, try enabling cut-and-paste with 
Devices->Clipboard->Bidirectional.

Running the Virtual Machine
---------------------------

Once you're set up, running the virtual machine should be straightforward.
We don't have enough experience to predict what can go wrong, so ask
<rebelsky@grinnell.edu> if you have problems.

1. Double click on the machine in VirtualBox.  If all goes well, you should
   see a desktop much like you get in MathLAN.  (We haven't tried to get all
   of the configuration identical, but it's much the same.)

2. Start Gimp and DrRacket, both of which should be in the task bar.

3. You may need to configure DrRacket to use the appropriate language.
   From the 'Language' menu, select 'Choose Language', and then 'The Racket
   Language'

4. Try running a sample program.  For example, you might try the following.

        #lang racket
        (require gigls/unsafe)

        (define canvas (image-new 200 200))
        (image-select-ellipse! canvas REPLACE 10 20 90 120)
        (context-set-fgcolor! "black")
        (image-fill! canvas)
        (context-set-fgcolor! "red")
        (image-stroke-selection! canvas)
        (image-select-nothing! canvas)
        (image-show canvas)

Updating Your Virtual Machine
-----------------------------

At rare instances, you may need to update your virtual machine, perhaps 
because there have beeen updates to Xubuntu, updates to the Mediascript
software, or even updates to Virtual Box.  If you are in CSC 151, we will
tell you about updates to the Mediascript software.  Xubuntu and Virtual
Box will tell you about their own updates.

### Operating System Updates

Like Microsoft Windows and Macintosh OS X, Xubuntu/Ubuntu will occasionally
pop up a message when you log in telling you that things have to be updated.
Feel free to update.  You should also feel free to ignore the requests to
update.

### Virtual Box Updates

Each time you start Virtual Box, it checks whether you have the most up-to-date
version.  If you don't, it will suggest that you upgrade.  Once again, feel
free to upgrade or to ignore the requests.

### Mediascript Updates

Unlike much commercial software, the Mediascript software does not
provide an automatic update facility.  So, when we update Mediascript,
we'll try to send out a note to our students telling you what to
do to update it.  The typical update instructions will be something
like the following.  (Note: Some versions of these instructions have
backticks around the commands to distinguish them from the surrounding
text.  Don't type those backticks.)

1. Open a terminal window.

2. Type `cd Mediascheme/gigls`.

3. Type `git pull`.

4. Type `make`.

5. Try to run some commands in Mediascheme (see above).
