---
title: An R Markdown document converted from "src/sjht-ms.ipynb"
output: html_document
---

# Abstract
some text..


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

## Models
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

general perceived insecurity by gender

![alt text](https://github.com/nils-holmberg/nils-holmberg.github.io/blob/main/scom-tour/fig/gen-insec-nat-gender-03.png?raw=true)

perceived security by destination

![alt text](https://github.com/nils-holmberg/nils-holmberg.github.io/blob/main/scom-tour/fig/dest-sec-nat-03.png?raw=true)

Table: regression model 1, mean general insecurity
|term                           | estimate| std.error| statistic| p.value|
|:------------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                    |    1.191|     0.128|     9.313|   0.000|
|gen_trav_int                   |   -0.011|     0.039|    -0.287|   0.774|
|dest_info_mean                 |    0.434|     0.024|    17.915|   0.000|
|demo_age                       |    0.002|     0.002|     1.222|   0.222|
|as.factor(demo_gender)male     |   -0.134|     0.057|    -2.337|   0.020|
|as.factor(demo_nationality)swe |    0.007|     0.059|     0.117|   0.907|

Table: regression model 2 (mixed effects), destination security
|term                           | Estimate| Std..Error| t.value|   p.z|
|:------------------------------|--------:|----------:|-------:|-----:|
|(Intercept)                    |    4.812|      0.202|  23.846| 0.000|
|gen_insec_mean                 |   -0.101|      0.034|  -2.938| 0.003|
|gen_trav_int                   |   -0.088|      0.042|  -2.086| 0.037|
|dest_trav_int                  |   -0.118|      0.025|  -4.833| 0.000|
|dest_info_mean                 |    0.047|      0.033|   1.421| 0.155|
|demo_age                       |    0.000|      0.002|   0.124| 0.901|
|as.factor(demo_gender)male     |    0.024|      0.061|   0.390| 0.696|
|as.factor(demo_nationality)swe |    0.169|      0.085|   1.990| 0.047|

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

