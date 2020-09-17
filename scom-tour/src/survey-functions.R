#install.packages("haven", lib="~/lib/r-cran")
library(tidyverse)
library(haven)

#~ ##################################################################### 200915
#

get_sav_dfs <- function(fp) {
#read sav
dfs = read_sav(paste0(fp, ".sav"))
#get head
dfh = data.frame(label=sapply(dfs, function(x) attributes(x)$label))
dfh$vars = rownames(dfh)
#export csv
write.table(dfs, paste0(fp, ".csv"), sep="\t", row.names=F)
#read csv
dfc = read.table(paste0(fp, ".csv"), sep='\t', header=T, strip.white=TRUE, stringsAsFactors=FALSE)
#
return(list(dfc, dfh, dfs))
}






#~ ##################################################################### 200915
#




###################### 
## Summarizes data.
## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
##   data: a data frame.
##   measurevar: the name of a column that contains the variable to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variables
##   na.rm: a boolean that indicates whether to ignore NA's
##   conf.interval: the percent range of the confidence interval (default is 95%)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
    library(plyr)

    # New version of length which can handle NA's: if na.rm==T, don't count them
    length2 <- function (x, na.rm=FALSE) {
        if (na.rm) sum(!is.na(x))
        else       length(x)
    }

    # This does the summary. For each group's data frame, return a vector with
    # N, mean, and sd
    datac <- ddply(data, groupvars, .drop=.drop,
      .fun = function(xx, col) {
        c(N    = length2(xx[[col]], na.rm=na.rm),
          mean = mean   (xx[[col]], na.rm=na.rm),
          sd   = sd     (xx[[col]], na.rm=na.rm)
        )
      },
      measurevar
    )

    # Rename the "mean" column    
    datac <- rename(datac, c("mean" = measurevar))

    datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean

    # Confidence interval multiplier for standard error
    # Calculate t-statistic for confidence interval: 
    # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
    ciMult <- qt(conf.interval/2 + .5, datac$N-1)
    datac$ci <- datac$se * ciMult

    return(datac)
}
























