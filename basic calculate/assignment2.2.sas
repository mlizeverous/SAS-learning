/******************************************************
Name:	assignment_2.2
Date: 	07/09/2018
Description: this program reads value-weighted returns and 
			 equal-weighted returns and calculate the univarite
			 of them.
******************************************************/

options ls=80;
libname worklib '/folders/myfolders/class&hw/assignment2';

* Read the weighted-data into 'd';
data d;
	set worklib.a2_data_indices;
	vwretd = vwretd*100;
	ewretd = ewretd*100;
run;

proc univariate data=d;
	title 'value-weighted';
	var vwretd;
run;

proc univariate data=d;
	title 'equal-weighted';
	var ewretd;
run;


