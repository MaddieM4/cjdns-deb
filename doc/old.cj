CJDROUTED(1)
===========
:doctype: manpage


NAME
----
cjdrouted - Daemon control over cjdroute.


SYNOPSIS
--------
*cjdrouted* [start|stop|reconfigure|start-default|commands|tunnel|killtunnel]


DESCRIPTION
-----------
The cjdrouted(1) command provides shortcuts for manipulating the cjdroute
process, as well as creating and destroying tunnel devices.


OPTIONS
-------
*-f, --conf-file*='CONF_FILE'::
    Use configuration file 'CONF_FILE'.Configuration files processed
    in command-line order (after implicit configuration files).  This
    option may be specified more than once.

*--doctest*::
    Run Python doctests in 'asciidoc' module.

*-d, --doctype*='DOCTYPE'::
    Document type: 'article', 'manpage' or 'book'. The 'book' document
    type is only supported by the 'docbook' backend.  Default document
    type is 'article'.

*-c, --dump-conf*::
    Dump configuration to stdout.

*--filter*='FILTER'::
    Specify the name of a filter to be loaded (used to load filters
    that are not auto-loaded).  This option may be specified more than
    once. The *--filter* option is also used to manage filter plugins
    (see <<X1,*PLUGIN COMMANDS*>>).

*-h, --help* ['TOPIC']::
    Print help TOPIC. *--help* 'topics' will print a list of help
    topics, *--help* 'syntax' summarizes AsciiDoc syntax,
    *--help* 'manpage' prints the AsciiDoc manpage.


BUGS
----
See the AsciiDoc distribution BUGS file.


AUTHOR
------
AsciiDoc was originally written by Stuart Rackham. Many people have
contributed to it.


RESOURCES
---------
SourceForge: <http://sourceforge.net/projects/asciidoc/>

Main web site: <http://www.methods.co.nz/asciidoc/>


COPYING
-------
Copyright \(C) 2002-2011 Stuart Rackham. Free use of this software is
granted under the terms of the GNU General Public License (GPL).

