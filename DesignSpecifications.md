# Design Specifications #

## Background and Need ##

Children with diabetes in developing countries frequently die quickly or are chronically unwell with poor quality of life and develop early and devastating complications. This is because insulin, other supplies, and diabetes care is often unaffordable or unavailable.

The International Diabetes Federation (IDF) is the umbrella organisation for the world’s diabetes associations. It is incorporated in Brussels, Belgium. The IDF "Life for a Child Program" (LFC) supports the care of children with diabetes in developing countries, and builds capacity in the centres caring for these children.  The program started in 2000, and now helps in 19 countries.  The program is mainly administered from Sydney, Australia, by HOPE worldwide (Australia) and Diabetes Australia-NSW.

Funds and supplies are provided to diabetes centres caring for children, and a specific list of the most needy children is helped by LFC’s support. Medical care is determined by the centres themselves, not the LFC Program. The centres provide annual reports. One of the main components of these reports is an annual clinical data sheet (see attachment). This form is filled out at baseline and then each year. A copy is kept at the centre and the original is sent through to the LFC office in Sydney.

This annual clinical data sheet (ACDS) is used for monitoring of the program, in the following way:

**It provides part of the proof that the care is reaching the child** It informs the LFC staff about the situation in the developing country, allowing them to advise on how to improve organisation of care (e.g. forms come back without blood pressure measurement, or without dates for measurements, without complications screening, or with the type of diabetes incorrectly diagnosed – and the LFC staff can help the centre improve this).
**General patterns revealed by the forms help with advocacy and planning of extension of the support from LFC** It helps the centres themselves develop registers, improve clinical care, and plan future health services


The forms have not yet been used for research, but it is likely that this will be considered in the future. This would be a secondary purpose for the forms – the primary purpose is for program monitoring and administration.


## The proposed database ##

The double-handling of the forms, need for data keying if they are to be put into a database, and challenges with reading handwriting etc have led us to plan a database that recipient centres and the LFC office could upload the ACDS to. This would streamline the process, saving time.  It would also reduce errors, and make the information much more accessible both for the recipient centre and the LFC office.

We would like an open-source coded database in MySQL, hosted on a reputable Australian-based server.

Once in full operation, the plan would be for centres to upload their ACDS data directly to the database if possible. If they are not able to do this, the ACDS forms will be sent to the LFC Office in Sydney and approved Program Assistants will upload the forms.

Last year, a database was being developed for us pr bono by Velos, a software company in California that specialises in large multi-centre clinical trials. This was using an Oracle platform, and was going to be hosted by the University of Oklahoma. However the IDF lawyers, on reviewing the legal issues, decided that there were too many cross-border privacy issues to host the database in the USA. Hence this plan had to be halted. However Velos did considerable work on planning of the types of fields, ranges etc, and we have all this information.

The ACDS has about 68 fields

We would like to split this so that there is a registration sheet on each child (with about 8 fields) and then a clinical record filled in annually (or more frequently if so wished by the centre concerned).

Various fields will have various limitations – e.g. for date of birth, sometimes the day of the month is not known, or even the month. If the day of the month is not known, the person entering the data should be prompted to put in 15 as a default. If the month as well is not known, then month should be June.


## Field descriptions ##

The attached Excel files give the field types and limits that we agreed with Velos. There are two files – one labelled “Database field instructions for Velos with Velos comments” which goes through each question, and “Database Velos datamap at beta-testing stage” which was the document they used to prepare the database.

We will add a couple of extra questions –
**One in the registration part of the form asking about how far the child lives from the centre (there will be four options:  within the city where the centre is, within 50km of the city, between 50 and 200 km, and over 200km).**  One in the clinical record part – asking, when the calculated age is over 10,  if the child is literate or not (yes or no)

There will be a few additional calculated fields (see below)

## Scope ##

Currently we are helping in 19 countries, 1,200 children. By the end of this next year this will probably grow to 30 countries, 6-10,000 children. Some countries have a few sites. All going well, the program could extend to 60 countries, possibly 200 sites, containing the data of 20-50,000 children and youth. There would likely be 1-4 people in each site who could access the data – although some sites will eb uploaded from Sydney.


## Internal calculations ##

### The easy ones ###

We would like to insert a field that calculates exact age to two decimal points – eg 10.53 years. As an example, this can be done readily in Excel by subtracting the date of birth from the date when the measurement is done. In Excel this then gives a number of days, which are divided by 365.25 to determine the calculated age in years. I expect this can be readily set up in MySQL.

Similarly we would like to have a field which calculates age at diagnosis of diabetes (age at diagnosis minus date of birth).

We would like to insert a field that automatically calculates body mass index, once height and weight are entered. This is simply calculated as (weight/height2)

We would like to insert a field that calculates insulin/kg – this is insulin use/day divided by weight, once these two are entered


### The hard ones ###

There are various measurements that are age- and sex-dependent – these are height, weight, body mass index, systolic blood pressure, and diastolic blood pressure. International standards are available. They are usually based on one particular country – we will use the US data – which has some limitations when used outside the US, but everyone is aware of this and takes them into account.

With an exact age and height measurement, it is possible to calculate the height Z-score or standard deviation score – i.e. a child at the average height for age would have a Z-score of 0. A child 1.5 standard deviations taller than the mean would be have a Z-score of +1.5. a child 2.3 standard deviations below the mean would have a Z-score of -2.5.

This can also be done for weight, body mass index, and systolic and diastolic blood pressure. However, the algorithms are complicated. Firstly, there are, not surprisingly, different algorithms for boys and girls. For height, weight, and body mass index, there is an equation for the Z-score

Z = (((X/M)L) - 1)/LS    L <> 0

or

Z = ln(X/M)/S ,L=0

_(note from Graham – I don’t think this second formula is needed as in the three tables we will be using, L is never 0)_

where X is the physical measurement (e.g. weight, length, head circumference, stature or calculated BMI value) and L, M and S are the values from the appropriate table corresponding to the age in months of the child (or length/stature).  (X/M)L means raising the quantity (X/M) to the Lth power.
For example, to obtain the weight-for-age z-score of a 9-month-old male who weighs 9.7 kg, we would look up the L, M and S values from the WTAGEINF table, which are L=-0.1600954, M=9.476500305, and S=0.11218624. Using the equation above, we calculate that the z-score for this child is 0.207. This z-score corresponds to the 58th percentile.


The formula isn’t that complicated. The age needs to be calculated in months – that could easily be done in the background. The problem is the other three variables – L M and S (this is called the LMS method) all vary according to the age in months, with a different table for each measurement (height or weight or body mass index etc). There are Excel tables for these, as links from the page - http://www.cdc.gov/nchs/nhanes/growthcharts/datafiles.htm, but they would have to be imported in some way into MySQL for this to work. I have attached the Table for Weight to give you an idea – there are L,M and S values for each month from 24 months to 240 months (i.e. 2-20 years), with increments of one month from 24.5 months to 239.5 months – i.e. there would need to be an internal function to round the calculated age to the nearest half-month age point, then the z-score would be calculated from the L, M, and S data for that half-month point.  In the table attached, it is only the yellowed data in the first five columns (sex age L M S) that would need to be available. But it is still a lot of data, and there are three of these tables (one each for height, weight and body mass index).

The analysis of systolic and diastolic blood pressure is a bit different. It needs height Z-score, age, and sex. Then there is a polynomial equation that you use. So it is easier to set up, once you have the height Z-score, which will be calculated as per the above section.


## Reports and audit questions ##

Various report options would be available

A few fields should be set up to develop an audit record if changed (eg date of birth, type of diabetes).


## Access ##

This is personal health information so the database needs to be very secure

There will be tiered levels of access to the data

  1. Individual centres will only be able to see data from their centre, and will determine who in their centre has that access.
  1. The Life for a Child Program Manager (Graham Ogle) and his Assistant(s) in Sydney Australia, will have access to all data. Other approved Data Entry operators (if needed) will only have access to the data sheets that they are entering, and the previous data from that country (so they can properly link longitudinal patient data)
  1. If the data is to be used for research, once approval is obtained, researchers will only have access to fully de-identified data.


## Maintenance ##

Ongoing maintenance will be needed – new users (although probably LFC can be trained to do that), new reports, other needs.
