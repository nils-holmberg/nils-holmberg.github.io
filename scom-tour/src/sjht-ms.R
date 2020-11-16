## -----------------------------------------------------------------------------
library(plyr)
library(tidyverse)
#read csv
#dfc = read.table("csv/survey-200922.csv", sep='\t', header=T, strip.white=TRUE)
dfc = read.table("../input/scom-tour-data/survey-200922.csv", sep='\t', header=T, strip.white=TRUE)


## -----------------------------------------------------------------------------
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


## -----------------------------------------------------------------------------
print(gp)

