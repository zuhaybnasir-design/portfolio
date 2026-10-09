/* WHO Life Expectancy Dataset - Part 1 SAS Program */

/* 1. Import Dataset */
proc import datafile="/home/YOUR_SAS_USERNAME/Life Expectancy Data (1).csv"
    out=life_raw
    dbms=csv
    replace;
    guessingrows=max;
run;

/* 2. Dataset Structure */
proc contents data=life_raw;
run;

/* 3. Descriptive Statistics */
proc means data=life_raw n nmiss mean median std min max;
    var _numeric_;
run;

/* 4. Frequency Analysis */
proc freq data=life_raw;
    tables Status;
run;

/* 5. Histograms */
proc sgplot data=life_raw;
    histogram 'Life expectancy'n;
    density 'Life expectancy'n;
    title "Distribution of Life Expectancy";
run;

proc sgplot data=life_raw;
    histogram GDP;
    density GDP;
    title "Distribution of GDP";
run;

proc sgplot data=life_raw;
    histogram Schooling;
    density Schooling;
    title "Distribution of Schooling";
run;

/* 6. Boxplot by Development Status */
proc sgplot data=life_raw;
    vbox 'Life expectancy'n / category=Status;
    title "Life Expectancy by Development Status";
run;

/* 7. Correlation Analysis */
proc corr data=life_raw;
    var 'Life expectancy'n Schooling GDP 'Adult Mortality'n;
run;

/* 8. Outlier Detection */
proc sgplot data=life_raw;
    vbox GDP;
    title "Boxplot of GDP";
run;

proc sgplot data=life_raw;
    vbox 'Adult Mortality'n;
    title "Boxplot of Adult Mortality";
run;

/* 9. Scatter Plots */
proc sgplot data=life_raw;
    scatter x=Schooling y='Life expectancy'n;
    reg x=Schooling y='Life expectancy'n;
    title "Relationship Between Schooling and Life Expectancy";
run;

proc sgplot data=life_raw;
    scatter x='Adult Mortality'n y='Life expectancy'n;
    reg x='Adult Mortality'n y='Life expectancy'n;
    title "Relationship Between Adult Mortality and Life Expectancy";
run;

/* 10. Missing Values Summary */
proc means data=life_raw n nmiss;
    var _numeric_;
run;

/* 11. Median Imputation */
proc stdize data=life_raw
    out=life_clean
    reponly
    method=median;
    var _numeric_;
run;

/* 12. Remove Duplicate Country-Year Records */
proc sort data=life_clean
    out=life_clean_nodup
    nodupkey;
    by Country Year;
run;

/* 13. Log Transformation of GDP */
data life_transformed;
    set life_clean_nodup;
    if GDP > 0 then Log_GDP = log(GDP);
    else Log_GDP = .;
run;

/* 14. Create Life Expectancy Category */
data life_transformed;
    set life_transformed;
    if 'Life expectancy'n >= 70 then Life_Category = "High";
    else Life_Category = "Low";
run;

/* Check Life_Category Distribution */
proc freq data=life_transformed;
    tables Life_Category;
run;

/* 15. Standardization (Z-score Normalization) */
proc standard data=life_transformed
    mean=0
    std=1
    out=life_standardized;
    var Log_GDP Schooling 'Adult Mortality'n;
run;

/* Verify Standardization */
proc means data=life_standardized mean std;
    var Log_GDP Schooling 'Adult Mortality'n;
run;

/* 16. Data Reduction (Feature Selection) */
data life_reduced;
    set life_standardized;
    keep Country Year Status 'Life expectancy'n
         Schooling Log_GDP 'Adult Mortality'n
         Life_Category;
run;

/* 17. Final Dataset Structure */
proc contents data=life_reduced;
run;

/* 18. Final Summary Statistics */
proc means data=life_reduced n nmiss mean std min max;
    var 'Life expectancy'n Schooling Log_GDP 'Adult Mortality'n;
run;

/* 19. Export Final Dataset to CSV */
proc export data=life_reduced
    outfile="/home/YOUR_SAS_USERNAME/life_reduced.csv"
    dbms=csv
    replace;
run;