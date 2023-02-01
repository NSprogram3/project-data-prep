/* a)  Import Data */

proc import datafile= '/home/u62252371/final project DP/Bike_Lanes.csv'
dbms=csv out= bike replace;
run;
PROC PRINT DATA = bike;
run;

/* b) Filter rows of bike that are NOT missing the route variable. */
DATA bike;
   SET have_route;
   WHERE NOT MISSING(route);
RUN;
proc print data=have_route;

/* c) Describe the distribution of bike lane lengths (length): 
(a) Numerically and (b) graphically */

proc univariate data=bike plot;
 VAR length; 
 RUN;
 
 /* d) Write the necessary code to check for duplicate observations */
proc sort data=bike_lanes out=bike nodupkey ;
 by _all_;
  run;
    title "cheak for duplicate";
  proc print data=bike;
  id _all_;
  run;
 
 