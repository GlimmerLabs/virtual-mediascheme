Using Mediascript with Virtual Box
==================================

_The latest version of this guide can be found at
 <https://github.com/GlimmerLabs/virtual-mediascheme/blob/master/UserGuide.md>_

As an experiment, we are providing a virtual machine with Mediascheme,
the software for Grinnell's CSC 151.   The virtual machine is intended
primarily for students in that course, although anyone with an interest
may feel free to use it.

We have provided a machine-independent version that should work on
Mac, Windows, and Linux.  

Feel free to email questions about these instructions or about the 
virtual machine to Samuel A. "SamR" Rebelsky at <rebelsky@grinnell.edu>.

Short Instructions
------------------

1. Download and Install the latest version of Virtual Box from
   <https://www.virtualbox.org>.

2. Download the virtual machine from 
   <http://www.cs.grinnell.edu/csc-151-vm/Xubuntu151-2016S.ova>.  

3. Double click the `.ova` file to install the virtual machine.

4. Double click the virtual machine to start it.

5. See if it works.

6. Ask for help if it doesn't.

7. Your account is `student` and your password is `csc151`.

Virtual Box
-----------

The software we use to run virtual computers is called *Virtual Box*.
You can download the latest version of Virtual Box for your computer from
<https://www.virtualbox.org>.  (You can also find documentation there.)

*You cannot run the virtual machine without Virtual Box or something
equivalent.*

Virtual Machine
---------------

You can find the virtual machine at
<http://www.cs.grinnell.edu/csc-151-vm/Xubuntu151-2016S.ova>.  

You can find additional instructions for that virtual machine at
<http://www.cs.grinnell.edu/csc-151-vm/UserGuide.md>.

*Warning!*  The virtual machine is a little over 2 gigabytes.  It
will take you some time to download.  It is also over 5 gigabytes
when uncompressed.  Make sure that you have enough disk space.

Account Information
-------------------

Your virtual computer comes configured with a single account, named
"**student**", with a password of "**csc151**".  The machine is configured
to log you in automatically, but the screen lock may set itself off at
some ponit.

Setting Up
----------

1. Start by installing VirtualBox.  (If you've installed software before, 
   it should be straightfoward.)

2. Identify the appropriate file from the flash drive, DVD, or Web.  

3. Double click on that file.  If all goes well, in a few minutes
   you should see a virtual machine along the left column in VirtualBox.

4. Start the Virtual Machine.

Issues with Microsoft Windows Computers
---------------------------------------

Some computers that run Microsoft Windows have virtualization turned
off by default.  That means that they will not allow you to run virtual
machines.  Hence, you need to turn virtualization on.  Here's what's
worked in the past.

1. Shut down the machine and reboot.  

2. Go into the BIOS. (Unfortunately, different computers have different
   ways of entering the BIOS.  You'll need to figure out the right way
   for your computer.)

3. Go to the "Advanced" screen.  

4. Turn on the "Virtualization" option.

If that doesn't work, you can try asking for help.  None of the CSC 151 
faculty regularly use Microsoft Windows, so help is likely to be limited.

Running the Virtual Machine
---------------------------

Once you're set up, running the virtual machine should be straightforward.
We don't have enough experience to predict what can go wrong, so ask
<rebelsky@grinnell.edu> if you have problems.

1. Double click on the machine in VirtualBox.  If all goes well, you should
   see a desktop much like you get in MathLAN.  (We haven't tried to get all
   of the configuration identical, but it's much the same.)

2. Start GIMP and DrRacket, both of which should be in the task bar.

3. You may need to configure DrRacket to use the appropriate language.
   From the 'Language' menu, select 'Choose Language', and then 'The Racket
   Language'

4. Try running a sample program.  For example, you might try the following.

        #lang racket
        (require gigls/unsafe)

        (define kitten (image-load "/home/student/Desktop/kitten.jpg"))
        (image-show (image-variant kitten irgb-complement))

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

Deprecated: Copying Files
-------------------------

_These instructions do not currently work.  They may work in the
next version._

Your virtual machine is independent from both your computer and the
MathLAN computers.  The guest additions that you added above should
allow you to copy files from your computer to the virtual machine and
back again.

If you want to copy files from your virtual machine to MathLAN and back
again, there are a variety of techniques you can use.  Some students have
found it easiest to use email.  We recommend that you use terminal commands.
There's a directory called `/home/student/Desktop/CSC151` on the virtual
machine.  If you set up a directory called `/home/USERNAME/Desktop/CSC151`
in your MathLAN account (substituting your own username), there are commands
on the virtual machine that will "synchronize" the two.  

To upload files in that directory from your virtual machine to MathLAN,
use the following command in terminal.

    upload-151 USERNAME

You will be prompted for your password.  When you enter your password, you
should see a report of files being copied.

To download files in that directory from MathLAN to your virtual machine,
use the following command in terminal.

    download-151 USERNAME

You will also be prompted for your password.  When you enter your password,
you should see a report of files being copied.

More generally, if you want to copy from any directory on your virtual
machine to any directory on MathLAN, you can use the following command
in terminal.

    rsync -rav VM-DIRECTORY/ USERNAME@ssh.cs.grinnell.edu/MATHLAN-DIRECTORY/

For example, the `upload-151` command basically generates the following command.

    rsync -rav /home/student/Desktop/CSC151/ USERNAME@ssh.cs.grinnell.edu/home/USERNAME/Desktop/CSC151/

If you want to copy from MathLAN to your virtual machine, you would swap
the order in the terminal command.

    rsync -rav USERNAME@ssh.cs.grinnell.edu/MATHLAN-DIRECTORY/ VM-DIRECTORY/

For example, the `download-151` command basically generates the following
command.

    rsync -rav USERNAME@ssh.cs.grinnell.edu/home/USERNAME/Desktop/CSC151/ /home/student/Desktop/CSC151/

