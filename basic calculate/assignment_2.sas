/******************************************************
Name:	assignment_2.1
Date: 	07/09/2018
Description: this program reads returns from IBM, GSC and Wrigley Co.
        	 and gets some basic data from it.
******************************************************/
options ls=80;
libname worklib '/folders/myfolders/class&hw/assignment2';


* Read the data IBM into 'd1';
data d1;
	set worklib.a2_data_stocks;
	where permno = 12490;
	ret = ret*100;
run;
/*proc print data=d;
	where ret = .;
run;*/

proc contents data=d1;
run;

proc print data=d1(obs=10);
run;

proc univariate data=d1;
	title 'IBM';
	var ret;
run;

proc ttest data=d1 h0=0.09 alpha=0.05;
	title 'Testing IBM';
	var ret;
run;



* Read the data GSC into 'd2';
data d2;
	set worklib.a2_data_stocks;
	where permno = 12095;
	ret = ret*100;
run;
/*proc print data=d;
	where ret = .;
run;*/

proc univariate data=d2;
	title 'GSC';
	var ret;
run;




* Read the data into 'd3';
data d3;
	set worklib.a2_data_stocks;
	where permno = 15472;
	ret = ret*100;
run;
/*proc print data=d;
	where ret = .;
run;*/

*calculate the univarite;
proc univariate data=d3;
	title 'Wrigley Co.';
	var ret;
run;



