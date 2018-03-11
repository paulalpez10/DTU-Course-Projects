/* This example:
	- We use a simple model with and without intercept.
	- When we have intercept:
	    - If no Factors, then the intercept is just the the mean of the Y that is substracted to the estimation.
	    - If there are Factors: Then the intercept is the same but for a given combiantion of factors
	      and then the rest are adapted to that.
	      We have one more parameter though ! And we lose one of the interactions which will become the intercept.
*/


Data penclass;
input X1 X2 X1X1 X2X2 X1X2 Cyclone;
cards;
1 1 1 1 1 370
1 2 1 4 2 452
1 3 1 9 3 273
1 4 1 16 4 422
2 1 4 1 2 526
2 2 4 4 4 624
2 3 4 9 6 513
2 4 4 16 8 1059
3 1 9 1 3 980 
3 2 9 4 6 1200
3 3 9 9 9 995
3 4 9 16 12 1751
;

/* 
Title 'Model Class-Noint';
proc glm;
class sugar;
model yield = sugar conc/noint solution;
run;
*/

Title 'Model All';
proc reg
data=penclass;
plots(label)=(CooksD RStudentByLeverage DFFITS DFBETAS);
model Cyclone = X1 X2 X1X1 X2X2 X1X2 /cov;
run;

Title 'Model Reduced';
proc glm;
model Cyclone = X1 X2 / solution;
run;
