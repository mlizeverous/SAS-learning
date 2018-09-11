/******************************************************
Name:	assignment_2.4
Date: 	07/09/2018
Description: this program reads vwretd data for 
			 period 1962-1994 and calculate the univarite 
******************************************************/
options ls=80;
libname worklib '/folders/myfolders/class&hw/assignment2';

* Read the data into 'd';
data d;
	set worklib.a2_data_indices;
	vwretd = vwretd*100;
	ewretd = ewretd*100;
run;

PROC SQL;
	DELETE FROM d
    	WHERE caldt > '30dec1994'd;
run;
QUIT;

PROC PRINT data = d;
RUN;

proc univariate data=d;
	title 'univariate';
	var vwretd;
run;