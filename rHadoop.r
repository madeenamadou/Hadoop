###### Streaming R code to MapReduce : Age Count, with age.txt

yum install R
R && install.packages("magrittr","data.table")

#!/usr/bin/env Rscript
#Mapper
f<-file("stdin",open = 'r')
ds = read.table(f,header = FALSE,sep = "\t",colClasses = 'factor')
do.call(function(x) write(paste(x[,2], "1", sep="\t"), stdout(),append = TRUE),list(ds))
close(f)
#END

#!/usr/bin/env Rscript
#Reducer
f<-file("stdin",open = 'r')
ds = read.table(f,header = FALSE,sep = "\t",colClasses = 'factor')
sum = summary(ds$V1)
do.call(function(x) write(paste(names(x),":",x), stdout(),append = TRUE),list(sum))
close(f)
#END


hadoop fs -put -f age.txt age.txt

hadoop fs -rm streamout*/\* &&\
hadoop fs -rmdir streamout*
  hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar -input age.txt -output streamout -mapper mapper.r -reducer reducer.r -numReduceTasks 4 -file mapper.r -file reducer.r
hadoop fs -cat streamout/\*
  
#######


###### wordcount

#txt = gsub("[[:punct:]]", "", txt)
#txt = gsub("[[:digit:]]", "", txt)
#txt = gsub("http\\w+", "", txt)
#txt = gsub("[ \t]{2,}", "", txt)
#txt = gsub("^\\s+|\\s+$", "", txt)
#txt = gsub("\\n", "", txt)

#!/usr/bin/env Rscript
#Reducer
f<-file("stdin",open = 'r')
f<-file("~/Documents/200mots.txt",open = 'r')
ds = readLines(f,warn = F)
sum = summary(factor(unlist(strsplit(ds,"\\s|\\s+"))))
do.call(function(x) write(paste(names(x),":",x), stdout(),append = TRUE),list(sum))
close(f)
#END

hadoop fs -put -f 200mots.txt 200mots.txt

hadoop fs -rm streamout*/\* &&\
hadoop fs -rmdir streamout*
  hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar -input 200mots.txt -output streamout -mapper /bin/cat -reducer reducer.r -numReduceTasks 4 -file reducer.r
hadoop fs -cat streamout/\*











