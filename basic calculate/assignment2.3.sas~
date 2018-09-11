/******************************************************
Name:	assignment_2.3
Date: 	07/09/2018
Description: this program reads returns from IBM and 
       		 from the value-weighted returns and computes excess 
			 returns for IBM
******************************************************/

options ls=80;
libname worklib '/folders/myfolders/class&hw/assignment2';

* Read the data weighted-data into 'd';
data d;
	set worklib.a2_data_indices;
	vwretd = vwretd*100;
	ewretd = ewretd*100;
run;

data d2;
	set worklib.a2_data_stocks;
	where permno = 12490;
	ret = ret*100;
	keep ret date;
run;

*obtain a new dataset from data d1 which change the column name caldt to DATE;
data d1;
	set d(keep=caldt vwretd rename=(caldt=DATE));    
run;

*merge two dateset together by date;
data data_test;
	merge d1 d2;
	by date;
run;

proc print data=data_test(obs=20);
run;

*calculate the excess_ret and add a new column in the data;
proc SQL;
	alter table data_test
	add excessRet num label='excess_ret' format=8.5;
	update data_test set excessRet = ret-vwretd;
run;
quit;

proc print data=data_test(obs=20);
run;

proc univariate data=data_test;
	title 'Excess_Ret';
	var excessRet;
run;
