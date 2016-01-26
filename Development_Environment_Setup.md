# Setup instructions for the Life for a Child Development Environment. #

## Software ##

Download and install:
  1. Java JDK 6
  1. Tortoise SVN
  1. Springsource toolsuite (STS)
  1. Apache Tomcat 6
  1. MYSQL Server and MYSQL Workbench

Note: Maven and Roo come installed with STS so don't need to be installed separately.

## Maven Setup ##

  1. Add the M2\_HOME environment variable by opening up the system properties (WinKey + Pause), selecting the "Advanced" tab, and the "Environment Variables" button, then adding the M2\_HOME variable in the user variables with the value C:\Program Files\Apache Software Foundation\apache-maven-3.0.3. Be sure to omit any quotation marks around the path even if it contains spaces. Note: For Maven < 2.0.9, also be sure that the M2\_HOME doesn't have a '\' as last character.
  1. In the same dialog, add the M2 environment variable in the user variables with the value %M2\_HOME%\bin.
  1. In the same dialog, update/create the Path environment variable in the user variables and prepend the value %M2% to add Maven available in the command line.
  1. In the same dialog, make sure that JAVA\_HOME exists in your user variables or in the system variables and it is set to the location of your JDK, e.g. C:\Program Files\Java\jdk1.5.0\_02 and that %JAVA\_HOME%\bin is in your Path environment variable.

## Database Setup ##

> Open command prompt and run the following:
  * cd C:\Program Files\MySQL\MySQL Server 5.5\bin
  * mysqld

> Open a new command prompt and run the following:
  * mysqladmin -u root password NEWPASSWORD
  * cd C:\Program Files\MySQL\MySQL Server 5.5\bin
  * mysql -u root -p
> -- enter password created above when requested
  * create database life\_for\_a\_child;
  * use life\_for\_a\_child;

  * CREATE USER 'dev'@'localhost'
> > IDENTIFIED BY 'password';

  * GRANT ALL PRIVILEGES ON **.** TO 'dev'@'localhost'
> > WITH GRANT OPTION;


> -- make sure you do on separate lines
  * exit;

> check you can connect using this new user
> mysql -u dev -p

## Code Setup ##

  1. Checkout code from https://lifeforachild.googlecode.com/svn/trunk,

on checkin enter you gmail email address and password generated from the page http://code.google.com/p/lifeforachild/source/checkout once you a logged in

## Running the Application ##

  1. start STS
  1. File > Import > Maven > Existing Maven Projects
  1. Specify checkout directory from above and continue
  1. Jars will start to download and everything build, this may take some time. Make sure everything builds correctly.
  1. Window > Show View > Servers
  1. Right click > add server, select apache, tomcat 6 server, select tomcat dir downloaded previously
  1. Right click on tomcat server, add and remove, add lifeforachild
  1. Open persistence.xml, change 'hibernate.hbm2ddl.auto' to create
  1. Start the tomcat server and make sure it connects ok.
  1. Stop the server and change the persistence file back (otherwise it will recreate the tables each time and you will lose your data)

## Database Data Load ##

  1. Add an environment variable for MYSQL\_HOME - C:\Program Files\MySQL\MySQL Server 5.5\bin
  1. Add to the path %MYSQL\_HOME\bin
  1. Open the command prompt and cd \lifeforachild\src\main\resources\sql
  1. mysql -u root -p
  1. source all.sql;

This should run a script and finish sucessfully and you should now see data in the database.

If something goes wrong there is a droptables.sql script in the same directory to clear the database and start again.

## Starting the application ##

  1. Start tomcat again
  1. Go to http://localhost:8080/lifeforachild in IE
  1. Ask me for a login
