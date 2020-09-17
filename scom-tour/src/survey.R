#~ ##################################################################### 200917
#regression model
library(lme4)

#to file
png('fig/model-01.png', width=500, height=500)
par(mfrow=c(2, 2))
plot(m)
dev.off()

#~ ##################################################################### 200916
#explorative, descriptive
library(plyr)



###################### dependent measure
#perceived security by nationality (int,swe), destination (VAR00)
#22, VAR04_15

hist(dfc[,22])


dfc$nat = ifelse(dfc$VAR12==1,"swe","int")

#remove missing values in scale responses (6 ?)
tmp = dfc[dfc$VAR04_15 != 6 ,]
tmp = dfc %>% as_tibble() %>% filter(VAR04_15 != 6)



###################### 
#measure: percieved security (22, VAR04_15)
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


###################### predictors
#4 VAR01    "Hur många gånger har du besökt destinationen tidigare?"
#5 VAR02    "Hur många dagar har du vistats i destination vid detta besök?"

#53 VAR10    "Hur gammal är du?"                                                 
#54 VAR11    "Vilket är ditt kön?" 

#62 VAR17    "Hur ofta reser du privat utomlands per år?"                        
#63 VAR18    "Hur ofta reser du i arbetet utomlands per år?"


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


