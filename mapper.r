#!/usr/bin/env Rscript
#Mapper
f<-file("stdin",open = 'r')
ds = read.table(f,header = FALSE,sep = "\t",colClasses = 'factor')
do.call(function(x) write(paste(x[,2], "1", sep="\t"), stdout(),append = TRUE),list(ds))
close(f)
