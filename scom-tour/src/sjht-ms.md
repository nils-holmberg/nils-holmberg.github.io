---
title: Explaining differences in perceived security in tourists visiting Swedish destinations
updated: 210217
---

# Abstract
The results of the survey will be presented in two steps. First, some general descriptive statistics will be presented, and secondly, we use inferential statistics to test the hypotheses H1-H4 provided by the theoretical models generated through literature review of previous research. Descriptive statistics show roughly a 40 / 60 percent split between international and swedish visitors respectively. About 57% of the respondents identified as women. Focusing on the first dependent variable in the study, general insecurity in tourists, descriptive analyses show small differences in perceived insecurity depending on nationality and gender, with an overall mean insecurity score of about 2.5 on a 5-point likert scale (cf. Figure 1). The second dependent measure, percieved destination security (cf. Figure 2), show overall high ratings among domestic and international tourists across 11 different destinations (on average 4.5 on a 5-point likert scale). On average, Swedish tourists generally reported lower scores on destionation security (4.0 on the same scale).

A number of measures were investigated for their explanatory contribution in relation to respondents' perceptions of general insecurity while travelling to Swedish tourist destinations. Based on the theoretical model informed by previous research within tourism and travelling, we hypothesized that tourists' general insecurity would be negatiely associated with their general travelling frequency (H2a). We also hypothesized that this dependent measure would be positively associated with destingation information search (H3a), such that the more general insecurity tourists feel, the more they search for travelling information. Finally, we hypothesized that female gender and international country of origin would be associated with higher levels of perceived general insecurity (H4a).

To test these hypothesized associations, a multiple regression analysis was performed using the statistical software R. The results of the regression model indicated that general travelling frequency in tourists was indeed associated with sligtly lower levels of general insecurity. However, as this effect did not reach significance, our observed data do not provide support for this hypothesis. By contast, results of the regression model indicate a strong positive association between information search about the destination and perceived insecurity (p<0.05, t=17.915) which can be interpreted such that individuals that are high in general insecurity tend to engage more in information search related to their travelling destinations. Thus, our data provide strong support for hypothesis H3a. Finally, our regression analysis revealed no effect of tourist nationality on general insecurity. However, the model indicated a strong association between male gender in tourists and lower levels of perceived insecurity (p<0.05, t=-2.337). Consequently, our evidence provides mixed support for hypothesis H4a. The R-squared measure reported by the regression model, indicated that this set of predictors explained about 23.84% if the variability in perceived general insecurity in tourists.

Our survey study also included a dependent variable measuring tourists' percieved security at their travel destination, and investigated how a set of 


# Introduction

## Perceived security in tourists

\[previous research here \...\]

- H1: Destination security will be negatively (?) associated with general insecurity

## Travelling frequency

\[previous research here \...\]

- H2a: General insecurity will be negatively (?) associated with general travelling frequency

- H2b: Destination security will be positively (?) associated with general travelling frequency

- H2c: Destination security will be positively (?) associated with destination travelling frequency

## Information search

\[previous research here \...\]

- H3a: General insecurity will be positively (?) associated with travelling information search

- H3b: Destination security will be positively (?) associated with travelling information search

## Tourist demographics

\[previous research here \...\]

- H4a: General insecurity will be higher in females and international tourists

- H4b: Destination security will be higher in males and Swedish tourists

## Theoretical models
![theoretical models](https://github.com/nils-holmberg/nils-holmberg.github.io/blob/main/scom-tour/fig/analysis-results-200922.png?raw=true)

# Methods

## Participants

\[present here \...\]

## Survey

\[present here \...\]

## Procedure

\[present here \...\]

## Analysis

\[present here \...\]

# Results
Descriptive analysis of dependent measures general insecurity and destination security.

Figure 1: (A left, B right)
![figure](https://github.com/nils-holmberg/nils-holmberg.github.io/blob/main/scom-tour/fig/per-sec-combined-01.png?raw=true)

Inferential analysis of dependent measures general insecurity and destination security.

Table 1: regression model, mean general insecurity
|term                           | estimate| std.error| statistic| p.value|
|:------------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                    |    1.198|     0.138|     8.653|   0.000|
|gen_trav_int                   |   -0.011|     0.039|    -0.287|   0.774|
|dest_info_mean                 |    0.434|     0.024|    17.915|   0.000|
|demo_age                       |    0.002|     0.002|     1.222|   0.222|
|as.factor(demo_gender)male     |   -0.134|     0.057|    -2.337|   0.020|
|as.factor(demo_nationality)swe |   -0.007|     0.059|    -0.117|   0.907|

Table 2: regression model (mixed effects), destination security
|term                           | Estimate| Std..Error| t.value|   p.z|
|:------------------------------|--------:|----------:|-------:|-----:|
|(Intercept)                    |    4.981|      0.194|  25.675| 0.000|
|gen_insec_mean                 |   -0.101|      0.034|  -2.938| 0.003|
|gen_trav_int                   |   -0.088|      0.042|  -2.086| 0.037|
|dest_trav_int                  |   -0.118|      0.025|  -4.833| 0.000|
|dest_info_mean                 |    0.047|      0.033|   1.421| 0.155|
|demo_age                       |    0.000|      0.002|   0.124| 0.901|
|as.factor(demo_gender)male     |    0.024|      0.061|   0.390| 0.696|
|as.factor(demo_nationality)swe |   -0.169|      0.085|  -1.990| 0.047|

## Perceived security in tourists

\[results here \...\]

- H1: Destination security will be negatively (?) associated with general insecurity

## Travelling frequency

\[results here \...\]

- H2a: General insecurity will be negatively (?) associated with general travelling frequency

- H2b: Destination security will be positively (?) associated with general travelling frequency

- H2c: Destination security will be positively (?) associated with destination travelling frequency

## Information search

\[results here \...\]

- H3a: General insecurity will be positively (?) associated with travelling information search

- H3b: Destination security will be positively (?) associated with travelling information search

## Tourist demographics

\[results here \...\]

- H4a: General insecurity will be higher in females and international tourists

- H4b: Destination security will be higher in males and Swedish tourists

# Discussion

