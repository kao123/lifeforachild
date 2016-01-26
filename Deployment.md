# Build for staging #

Checking out code, tag it with the right tag: e.g. RELEASE\_04\_ddmmyyyy

To build, please do the following:
  * Modify **database.properties**, update the database config to point to staging
  * Modify **web.xml**, update all reference to lifeforachild to lifeforachild-staging
  * Run mvn clean install to build the war file

# Build for production #

It is recommended to take the war in staging, modify configuration and deploy to Production. The reason is staging has been tested by users.

Steps:
  * Copy the staging war to a ~/installs/release-yyyymmdd
  * Go to that directory: cd ~/installs/release-yyyymmdd
  * Create a temp directory: mkdir temp-war
  * Go to that directory: cd temp-war
  * Expand the war: jar xvf ../lifeforachild-staging.war
  * Modify **database.properties**: point to Production
  * Modify **web.xml**: update all "lifeforachild-staging" to "lifeforachild" (in vi: %s/-staging//g)
  * ~~Modify **application.properties**: have the right encryption~~ (no longer needed as it is now in the server)
  * Create the war: jar cvf ../lifeforachild.war .
  * Copy the newly created war into the right Tomcat/webapps directory.