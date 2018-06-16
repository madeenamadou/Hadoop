#  Using R and Streaming APIs in Hadoop
#
#



### Run Python app on Hadoop
### Exemple with MovieRatingsCount

yum -y --enablerepo=extras install epel-release
#This command will install the correct EPEL repository for the CentOS version you are running.

yum -y install nano
yum -y install python-pip
pip install --upgrade pip
pip install mrjob

#run on local
python RatingsBreakdown.py u.data

#run on hadoop
python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar u.data


#RatingsBreakdown.py
from mrjob.job import MRJob
from mrjob.step import MRStep

class RatingsBreakdown(MRJob):
def steps(self):
return [
MRStep(mapper=self.mapper_get_ratings,
reducer=self.reducer_count_ratings)
]

def mapper_get_ratings(self, _, line):
(userID, movieID, rating, timestamp) = line.split('\t')
yield rating, 1

def reducer_count_ratings(self, key, values):
yield key, sum(values)

if __name__ == '__main__':
RatingsBreakdown.run()
#END



### Run R app on Hadoop
### Exemple with R
#In streaming the key is the text in the line before the first tab, and the value is the rest of the line. One key value pair per line.
#If used as a mapper the script would emit lines of text in the format of key<tab>value and the output would be partitioned by key and sorted by key
#If the emitted from the script is not in key<tab>value format you could use it as a Reducer; as a Mapper it might not work so well.



###### Streaming R code to MapReduce : Age Count, with age.txt

yum install R
R install.packages("magrittr","data.table")

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


###### Streaming R code to MapReduce : Word Count, with 200mots.txt

#!/usr/bin/env Rscript
#Reducer
f<-file("stdin",open = 'r')
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

#######








































