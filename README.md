## What is this?

This is the behind-the-scenes place where ill-paid grunka lunkas, when not warning people about secret ingredients and armed guards, make Debian packages of [cjdns](https://github.com/cjdelisle/cjdns/). While the author of this repository generally only uses it to make i386 packages, in theory it can be used on any architecture.

## Using this thing to make your own cjdns packages

Most of the process is automated by scripting, including the incrementing of the release number (TODO: add a --no-increment option to mkpackage.sh so I don't have to decrement the release first before remaking the package). Creating a package for i386 is quite easy:

    git clone --recursive https://github.com/campadrenalin/cjdns-deb
    cd cjdns-deb
    ./buildcjdroute.sh
    ./mkpackage.sh

Note that you have to install certain dependencies to get compilation to work. See [Project Meshnet's page on it](https://wiki.projectmeshnet.org/How-to_build_and_configure_CJDNS_on_Linux) for more details. You will likely need to build libevent2 from source somewhere else and install it systemwide first.

## Other architectures

At some point, I'm going to add an "arches" file to the top level, which will be used by mkpackage as part of its templating, so that people won't have to edit the line in control_template. As it is though, you need to edit that line manually right now, and honestly, it's not *that* bad a chore. Use the valid Debian architecture name for the type of system you used to build it (default is i386, but other options include AMD64, PowerPC, SPARC, DEC Alpha, ARM, MIPS, PA-RISC, S390, and IA-64). DO NOT MISLABEL THE ARCH. What you build on, you build for, so if it was on an ARM machine, put ARM there. Calling your package an AMD64 will not magically cross-compile the cjdroute binary if you're on an x86 processor. If you need to build for something you don't have, use a virtual machine.

Once you have corrected the control_template file, you want to run:

    ./buildcjdroute.sh && ./mkpackage.sh

If this exits successfully, the resulting cjdns.deb file will be a working Debian package that you can use on any machine of the same architecture. If you want to set up one-command install for this architecture, you should modify install-wildly.sh to pull the packages from the appropriate sources. This means you are also responsible for providing a libevent2.0.17 package for your arch. However, as long as the links are correct and your packages work, one-command install will work.

libevent2 is really, fantastically easy to make a package of, using checkinstall. Download the source somewhere, compile it, and instead of using "make install", use "checkinstall". This requires you to install checkinstall first, and it will ask you a series of metadata questions when it builds the package. Checkinstall is a great program, and useful for a lot of projects (although projects that intend to use install scripts in the package don't work with it, and require custom packaging efforts like this one).
