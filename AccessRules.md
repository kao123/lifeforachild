# Introduction #

This section will outline the different users in the application, and the access permissions associated to that particular user type.


# User Types #

  1. Program Manager (Graham)
  1. Program Manager's Assistants
  1. Data Entry Operators
  1. Centre Manager - Will manage all centres in their country
  1. Centre Admins - Will be the ones managing the users for each individual centre
  1. Centre Staff
  1. Researchers


# Permission Matrix #

See 'Database access Feb 1b.xls' for latest matrix.

# Questions #

## Medical Records ##


  1. Can a child's existing medical records be edited? If so can anyone edit them?
  1. Can any centre user/program manager/PM's assistants/data entry operators edit them?
  1. Is a child's registration record locked after a certain amount of time has passed since it was created/last modified?
  1. Is a child's medical record locked after a certain amount of time has passed since it was created/last modified?

### Answers (from Graham): ###

  1. Yes, anyone with access, but there will need to be a log of such changes
  1. see above and below
  1. no, but there would need to be a log - in fact a log for the registration pages and another log for the medical record pages would be good
  1. Not at present - maybe we will develop this after a couple of years - can we introduce that then or should we have a code and say 3 years now?

## Data Entry Operators ##

From the requirements:

> _Other approved Data Enterers (if needed) will only have access to the data sheets that they are entering, and the previous data from that country (so they can properly link longitudinal patient data_

  1. Do the data entry operators only have access to just the one ACDS sheet that they're currently working on?
  1. Can they edit existing data sheets?
  1. What previous data can they access and how do they access this? Is it like the reports that researchers can access? Is it just previous data for the same child?

### Answers (from Graham): ###

  1. Yes I think so (I need to think through more) - see table attached
  1. Yes - see above
  1. ?

## Researchers ##
  1. Can researchers access fully deidentified records for all sites? Or are they restricted to a particular site or a list of sites?
  1. Can researchers be restricted access to selected children? Or just one child?

### Answers (from Graham): ###

  1. Researchers will be very limited - see table attached- we will generally give exported data to them
  1. Researchers will be very limited - see table attached - we will generally give exported data to them

## Individual Centres ##

From the requirements:

> _Individual centres will only be able to see data from their centre, and will determine who in their centre has that access._

  1. Are there many levels of access? Or is it just Centre Admin and Centre Staff?
  1. Can different Centre Staff have different sets of permissions?

### Answers (from Graham): ###

  1. I have put in a Country Manager line
  1. ?
