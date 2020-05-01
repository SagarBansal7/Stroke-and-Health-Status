/*ods graphics on;
proc cluster data=stroke method=average outtree=averagetree;
var age avg_glucose_level bmi;
id stroke;
run;
ods graphics off;
*/
ods graphics on;
proc cluster data=stroke method=average outtree=averagetree plots(maxpoints=30000);
var age avg_glucose_level bmi;
copy stroke;
run;
ods graphics off; 

proc tree data=averagetree out=newDat7 nclusters=7 horizontal;
copy age avg_glucose_level bmi stroke;
run;

proc means data=newDat7;
vars age avg_glucose_level bmi;
class cluster;
run;
/*
proc tree data=averagetree out=newDat3 nclusters=3 horizontal;
copy age avg_glucose_level bmi hd hbp;
run;

proc means data=newDat3;
vars age avg_glucose_level bmi;
class cluster;
run;

proc tree data=averagetree out=newDat2 nclusters=2 horizontal;
copy age avg_glucose_level bmi hd hbp;
run;

proc means data=newDat2;
vars age avg_glucose_level bmi;
class cluster;
run;
*/
proc freq data=newDat7;
tables hd*cluster/chisq;
run;
/*
proc freq data=newDat2;
tables hd*cluster/chisq;
exact chisq;
run;

proc freq data=newDat2;
tables hbp*cluster/chisq;
exact chisq;
run;
*/
