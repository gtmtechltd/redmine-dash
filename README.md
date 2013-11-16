redmine-dashboard
=================

A simple dashboard display of redmine bugs for information radiator purposes.

I had a need for better visibility (to devs) of bugs in redmine, and the redmine plugins just didn't do it for me... so I wrote this very quick rails app, using twitter bootstrap theme, that displays all bugs in redmine with the following sensible rules:

* Closed bugs are only displayed if they are less than 3 days old (so they filter out of the display nicely)
* Rejected bugs are only displayed if they are less than 7 days old
* Bugs are sorted by their progress status (horizontally)
* Bugs are ordered within their status firstly by priority, secondly by last updated
* Bugs are colour-coded by their priority
* Bugs can be clicked on to take you to the redmine page for that bug.

How to run
==========

(Tested on ruby 1.8.7 using passenger, and straight forward rails s)

* bundle install
* Edit config/database.yaml and supply the correct username/password/databasename for your redmine instance
* Edit config/database.yaml and supply the correct mysql.sock for your redmine instance (if unclear, do netstat -anp | grep redmine)
* Edit config/application.rb and supply the correct ```REDMINE_URL``` for your company
* Then you're good to go

Screenshot
==========

![ScreenShot](https://raw.github.com/gtmtechltd/redmine-dashboard/master/doc/screenshot.png)

Caveats
=======

This took me a couple of hours to write. Where possible all information (statuses, trackers, priorities etc.) comes from the database, however, the exception to this is the top menu bar, as each menu option maps to a controller. If you have different trackers (as no doubt you do), then you will need to create a blank controller, and view file for each controller (in apps/) and also to reference it in the config/routes.rb.. like the other ones are referenced. 

Enjoy!
