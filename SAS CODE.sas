/* reading a datafile in */
libname path 'C:\Users\cba-lab_gen\Desktop\files';

/* storing data in a "mydata" variable*/
Data mydata;
set path.nlsy97_basicsforclass;

/* conditions to fix blank variable problem */
/*if heightft97 ne . and heightin97 = . then height97 = 12 * heightft97 ;
else height97 = (5 * heightft97) + heightin97 ;*/
/* creating a new variable which is always done in datastep
height97 = (12*heightft97) + heightin97;
*/

/* creating new variables mothered and fathered */
if motheryrs = . then mothered = .;
else if motheryrs < 12 then mothered = 1;
else if motheryrs = 12 then mothered = 2 ;
else if motheryrs <= 15 then mothered = 3;
else mothered = 4;

if fatheryrs = . then fathered = .;
else if fatheryrs < 12 then fathered = 1;
else if fatheryrs = 12 then fathered = 2 ;
else if fatheryrs <= 15 then fathered = 3;
else fathered = 4;
run;

/* displaying the frequency of mothered and fathered */
proc freq data=mydata;
tables mothered*fathered;
run;

/* how to check the missing variables */
/*
proc print data = mydata;
where heightft97 ne . AND heightin97 =.;
var heightft97 heightin97 height97;
run;
*/

/* displaying all the variables */
/*
proc contents data=mydata;
run;
*/
/* displaying frequency for "yrs" variable */
/*
proc freq data=mydata;
tables yrs;
run;
*/
/* finding the frequency of mother's and faher's educaion */
/*
proc freq data=mydata;
tables motheryrs*fatheryrs;
run;
*/
/* find a correlation between mother's and father's education */
/*
proc corr data=mydata;
var motheryrs fatheryrs;
run;
*/
/* running proc means on the new variable "height97" */
/*
proc means data=mydata;
var height97;
run;
*/
