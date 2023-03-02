/* read a excel file */
PROC IMPORT DATAFILE="/home/u61494208/sasuser.v94/examplefile.csv" 
		OUT=WORK.IRIS DBMS=CSV REPLACE;
	SHEET="Sheet1";
	GETNAMES=YES;
RUN;

/* print data  */
PROC PRINT data=IRIS;
RUN;

/* create a table */
DATA outdata;
	INFILE Datalines dlm=",";
	INPUT age gender $ dept obs1 obs2 obs3;
	Datalines;
1,F,3,17,6,   /adding missing value
1,G,3,4,5.34,6
run;

/* 	create table only single records */
/* DATA Example1; */
/* 	OldPrice=10; */
/* 	NewPrice=15; */
/* RUN; */
/*  */
/* read data */
/* PROC PRINT DATA=example1; */
/* RUN; */

PROC PRINT DATA=outdata;
RUN;

proc print data=outdata (drop=age);
	where gender='F';
run;

data outdata2;
	set outdata;
	drop age;
run;

/* USING SQL */
PROC SQL;
select * from outdata2;
 
/* "DELETE USING SQL"  */
/* PROC SQL; */
/* Delete from outdata where gender="G"; */
/*  */
/* PROC SQL; */
/* select * from outdata; */


Data readin;
Input ID Q1-Q3;
cards;
85 1 2 3
90 3 4 6
95 5 5 6
100 6 6 4
105 5 5 6
110 6 6 5
;

Data dummy;
Input ID Q1-Q3;
cards;
85 1 2 3
90 3 6 5
95 5 5 6
100 6 6 4
105 5 5 6
110 6 6 5
;

proc sql;
select * from dummy;


/* for all columns */
proc freq data=readin;
run;

/* for specific coloumn */
proc freq data=readin;
table Q1/list missing;
run;

/* for specific coloumn */
proc freq data=readin;
table Q1*Q2/list missing;
run;

/* for more coloumn combinations */
proc freq data=readin;
table Q1*(Q2 Q3)/list missing;
run; 

proc means data=readin;
run;

/* calculate mean */
PROC means DATA=readin;
var Q1;
RUN;

/* calculate mean */
PROC means DATA=readin;
/* var Q1; */
Class Q2;
RUN;

proc mean



/* new name been assigned  readin1*/
Data readin1;
Set readin;
IF ID LE 100;
run; 

PROC PRINT DATA=readin1;
RUN;

proc summ
