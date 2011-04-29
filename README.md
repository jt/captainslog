captainslog
======

captainslog is a command line utility that prints git logs by day and by author. This is useful when filling out time logs and emailing summaries of commits to clients.

Install
-------

    gem install captainslog

Commands
--------

Within a git repository:

    $ captainslog
    > prints out the past 7 formatted day logs including today

    $ captainslog 2
    > prints out the past 2 formatted day logs including today

    $ captainslog 20
    > prints out the past 20 formatted day logs including today
