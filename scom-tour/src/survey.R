###################### 
#clear workspace
rm(list=ls())
#load functions
source("src/teid-functions.R")

#~ ##################################################################### 201109
#resume, results for publication
library(plyr)
library(tidyverse)

###################### 
#measure: general insecurity
#perceived general insecurity by nationality (int,swe) and gender (exclude other)


###################### 
#measure: destination security (22, VAR04_15)
#perceived security by nationality (int,swe), destination (VAR00)
#22, VAR04_15
#hist(dfc[,22])
#dfc$nat = ifelse(dfc$VAR12==1,"swe","int")
table(dfc$demo_nationality)

#remove missing values in scale responses (6 ?)
#tmp = dfc[dfc$VAR04_15 != 6 ,]
tmp = dfc %>% as_tibble() %>% filter(VAR04_15 != 6)

#summarize
bp1 <- ddply(tmp, c("VAR00","demo_nationality"), summarise,
N=length(VAR04_15), mean=mean(VAR04_15), sd=sd(VAR04_15), se=sd/sqrt(N))
#or from src/survey-functions.R
#bp1 <- summarySE(df, measurevar="len", groupvars=c("supp","dose"))

###################### 
#theme
gt = theme(
strip.text = element_text(size = 36),
plot.title = element_text(family = "Helvetica", face = "bold", size = (36)), 
legend.title = element_text(colour = "black",  face = "bold.italic", family = "Helvetica"), 
legend.text = element_text(face = "italic", colour="black",family = "Helvetica"), 
axis.title = element_text(family = "Helvetica", size = (24), colour = "black"),
axis.text = element_text(family = "Helvetica", colour = "black", size = (24)),
axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

dest = c("Göteborg","Helsingborg","Kalmar","Landskrona","Lysekil","Malmö","Stockholm","Varberg","Visby","Ystad","Annan")
#bp1$dest = rep(dest, each=2)
#standard error of the mean, could also use confidence intervals from src/survey-functions.R
gp = ggplot(bp1, aes(x=factor(VAR00), y=mean, fill=demo_nationality)) + 
geom_bar(position=position_dodge(), stat="identity") +
geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.2, position=position_dodge(.9)) +
scale_x_discrete(breaks=c(1:11), labels=dest) +
gt +
labs(title="perceived security by nationality and destination", 
y="mean destination security", x="destination")

#to file
png('fig/sec-nat-dest-02.png', width=1000, height=500)
#layout(matrix(c(1,2,3,4),2,2))
#par(mfrow=c(4,1))
#set margins: bottom, left, top, right margins
#par(mar=c(10.1, 5.1, 7.1, 4.1))
print(gp)
#
dev.off()

#mean index ?
dfc$dest_sec_mean = rowMeans(dfc[, 22])

#~ ##################################################################### 201106
#resume, results for publication

#library(rmarkdown)
input="src/scom-tour.ipynb"
rmarkdown:::convert_ipynb(input, output=xfun::with_ext(input, "Rmd"))




#spin script to rmd
#knitr::spin('tmp/script.R', knit=FALSE)
#echo "knitr::spin('"$(head -n46 src/survey.R)"', knit=FALSE)" | R --slave
#echo "knitr::spin('tmp/script.R', knit=FALSE)" | R --slave
#Rscript -e "knitr::spin('tmp/script.R', knit=FALSE)"

#read csv
dfc = read.table("csv/survey-200922.csv", sep='\t', header=T, strip.white=TRUE)


#~ ##################################################################### 200922
#regression models


#export csv
#write.table(dfc, "csv/survey-200922.csv", sep="\t", row.names=F)


#~ ##################################################################### 200917
#regression models
library(lme4)
#library(performance)

#fix colnames
colnames(dfc)[c(53,54,64,67,68,69,71)] = c("demo_age","demo_gender","demo_nationality","gen_trav_sum","gen_trav_int","gen_trav_bin","dest_trav_int")
#remove gender value 3 !
dfc$demo_gender = as.factor(ifelse(dfc$demo_gender==3, NA, dfc$demo_gender))
#travel binary
dfc$trav_freq_bin = ifelse(dfc$trav_freq_int==1, 1, 2)
#remove response value 6 !
dfc$dest_sec = ifelse(dfc$VAR04_15==6, NA, dfc$VAR04_15)
#mean index ?
#dfc$dest_sec_mean = rowMeans(dfc[, 22])
#destination travelling frequency
dfc$dest_freq_int = dfc$VAR01


###################### 
#model 1: general insecurity (subject id)
m1 = lm(gen_insec_mean ~
#general travelling frequency
gen_trav_int +
#gen_trav_bin +
#information about destination
dest_info_mean +
#demographics
demo_age +
demo_gender +
demo_nationality,
data=dfc)
#
#(1|ID),
#getpvals_lmer(m)
#r2(m)


###################### 
#model 2: destination security (destination id)
m2 = lmer(dest_sec ~
#general insecurity
gen_insec_mean +
#general travelling frequency
gen_trav_int +
#gen_trav_bin +
#destination travelling frequency
dest_trav_int +
#information about destination
dest_info_mean +
#demographics
demo_age +
as.factor(demo_gender) +
demo_nationality +
(1|VAR00),
data=dfc)
#
getpvals_lmer(m)
r2(m)



#to file
png('fig/model-01.png', width=500, height=500)
par(mfrow=c(2, 2))
plot(m)
dev.off()

#~ ##################################################################### 200916
#explorative, descriptive
library(plyr)

###################### dependent measures
# general insecurity (crime type)
# destination security (perceived secure)

###################### 
#measure: general insecurity
#46-51 "crime_insec_index_mean" => exclude "6"
dfc[ , 46:51 ][ dfc[ , 46:51 ] == 6 ] = NA
ggplot(gather(dfc[ , 46:51 ], cols, value), aes(x = value)) + 
geom_histogram(binwidth = 1) + facet_grid(.~cols)
#
dfc$gen_insec_mean = rowMeans(dfc[ , 46:51 ])


###################### 
#measure: destination security (22, VAR04_15)
#perceived security by nationality (int,swe), destination (VAR00)
#22, VAR04_15
hist(dfc[,22])
dfc$nat = ifelse(dfc$VAR12==1,"swe","int")

#remove missing values in scale responses (6 ?)
tmp = dfc[dfc$VAR04_15 != 6 ,]
tmp = dfc %>% as_tibble() %>% filter(VAR04_15 != 6)

#summarize
bp1 <- ddply(tmp, c("VAR00","nat"), summarise,
N=length(VAR04_15), mean=mean(VAR04_15), sd=sd(VAR04_15), se=sd/sqrt(N))
#or from src/survey-functions.R
bp1 <- summarySE(df, measurevar="len", groupvars=c("supp","dose"))

#standard error of the mean, could also use confidence intervals from src/survey-functions.R
gp = ggplot(bp1, aes(x=VAR00, y=mean, fill=nat)) + 
geom_bar(position=position_dodge(), stat="identity") +
geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.2, position=position_dodge(.9))

#to file
png('fig/sec-nat-dest-01.png', width=1000, height=500)
#layout(matrix(c(1,2,3,4),2,2))
#par(mfrow=c(4,1))
#set margins: bottom, left, top, right margins
#par(mar=c(10.1, 5.1, 7.1, 4.1))
print(gp)
#
dev.off()

#mean index ?
dfc$dest_sec_mean = rowMeans(dfc[, 22])

###################### predictors
#4 VAR01    "Hur många gånger har du besökt destinationen tidigare?" => multiple, single
dfc$dest_freq_bin = ifelse()
#5 VAR02    "Hur många dagar har du vistats i destination vid detta besök?" => 
# only for model 2, destination security


#31-35 "dest_info_index_mean" => exclude "6"
dfc[ , 31:35 ][ dfc[ , 31:35 ] == 6 ] = NA
ggplot(gather(dfc[ , 31:35 ], cols, value), aes(x = value)) + 
geom_histogram(binwidth = 1) + facet_grid(.~cols)
#
dfc$dest_info_mean = rowMeans(dfc[ , 31:35 ])
#37-45 "city_insec_index_mean" => exclude "6"
#dfc[ , 37:45 ][ dfc[ , 37:45 ] == 6 ] = NA
#ggplot(gather(dfc[ , 37:45 ], cols, value), aes(x = value)) + 
#geom_histogram(binwidth = 1) + facet_grid(.~cols)


#53 VAR10    "Hur gammal är du?"                                                 
hist(dfc[, 53])
#54 VAR11    "Vilket är ditt kön?" 
table(dfc[, 54])


#62 VAR17    "Hur ofta reser du privat utomlands per år?"   => combine with 63, 3 intervals
#63 VAR18    "Hur ofta reser du i arbetet utomlands per år?"
dfc$trav_freq_sum = rowSums(dfc[,c(62,63)])
#table(ifelse(rowSums(dfc[,c(62,63)]) <= 2, "low", "mid"))
dfc$trav_freq_int = ifelse(dfc$trav_freq_sum > 3, 3, ifelse(dfc$trav_freq_sum < 2, 1, 2))

#~ ##################################################################### 200915
#spss survey analysis
library(tidyverse)

#clear workspace
rm(list=ls())
#load functions
source("src/survey-functions.R")
#
tmp = get_sav_dfs(fp="tmp/Export_eng")
#survey csv data, header, sav data
dfc = tmp[[1]]; dfh = tmp[[2]]; dfs = tmp[[3]];
#head
dfh %>% as_tibble() %>% select(vars, label) %>% mutate(label = str_extract(label, "^.{2,72}")) %>% print(n=100)

#dependent variable, perceived security
dfh %>% filter(str_detect(label, 'mig trygg'))
#de tre sista – quite, safe, low crime rate går också att köra som upplevd trygghet
#21,22,23

#number swedish, international participants
table(ifelse(dfc$VAR12==1,"swe","int")
#and destination
with(dfc, table(VAR12, VAR00))

#~ ##################################################################### 200910
#spss survey analysis
#install.packages("haven", lib="~/lib/r-cran")
library(haven)

#project string
pstr = "tmp/Export_eng" #1045 obs. of  63 variables
#pstr = "tmp/Export" #1045 obs. of  63 variables
#pstr = "tmp/Stockholm_Export"


#read sav
dfs = read_sav(paste0(pstr, ".sav"))
#get labels
dfl = data.frame(label=sapply(dfs, function(x) attributes(x)$label))
dfl$vars = rownames(dfl)

#export csv
write.table(dfs, paste0(pstr, ".csv"), sep="\t", row.names=F)
#read csv
dfs = read.table(paste0(pstr, ".csv"), sep='\t', header=T, strip.white=TRUE, stringsAsFactors=FALSE)


