#!/usr/bin/env Rscript
#
#Reducer : count the words
#
f<-file("stdin",open = 'r')
ds = readLines(f,warn = F)
sum = summary(factor(unlist(strsplit(ds,"\\s|\\s+"))))
do.call(function(x) write(paste(names(x),":",x), stdout(),append = TRUE),list(sum))
close(f)
