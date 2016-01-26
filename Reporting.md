# Introduction #

This document will outline the design for the reporting component.

# Screen Design #

## Configure Report Screen ##

The following screenshot is a suggested layout for selecting and configuring reports.

http://lifeforachild.googlecode.com/files/configureReport.PNG

The 'Saved Reports' dropdown contains a list of all saved reports. If a saved report is selected the fields on the screen will be updated as they were configured for the original report.

There are three buttons:
  1. Show - shows the selected or configured report
  1. Save - allows the report configuration to be saved, prompting the user for a name for the report.
  1. Delete - allows a saved report to be deleted.

The report filter fields are defined as:
  * Report Type - Mandatory. Either Patient or Record
  * Status - Optional. If none selected will get all records. Options to get updated or not updated records.
  * Time period - Optional. Numeric value in the first field, months or years to be selected in the second field. i.e. 6 months
  * Date Range - Optional. A specific date range can be searched.
  * Show - Optional. what records to show. Options include: first, last and all.

The display options would display options based on the report type for the fields that apply.

## Display Report Screen ##

http://lifeforachild.googlecode.com/files/theReport.PNG

This screen would show the results for the report. It would allow the report configuration to be saved and the results exported to excel.

# Database Design #

A table would be added to the database to store saved reports.

| **ID** | **name** | **createdBy** | **type** | **status** | **timePeriodNum** | **timePeriod** | **fromDate** | **toDate** | **showRecord** | **displayFields** |
|:-------|:---------|:--------------|:---------|:-----------|:------------------|:---------------|:-------------|:-----------|:---------------|:------------------|
> |        |          |               |          |            |                   |                |              |            |                |                   |

Each report would have a unique ID. The user could give the report a name. displayFields would be a comma separated list of fields to display in the report based on what was checked in the 'display options' section. The rest of the fields are the settings from the 'report filter' section.

# Alternate Design Ideas #

  * A multi select list of appropriate fields could be displayed rather than check boxes for each field to determine which fields to display in the report.

# Questions #

  1. Can users see all saved reports? Or only ones they have created?
  1. Which fields should always be shown in a Patient report? In a Records Report?
  1. Which fields should be configurable for a Patient report? In a Records Report?
  1. Who should be able to delete saved reports?
  1. Some search features are also requested - don't want to overlap with search functionality being added.