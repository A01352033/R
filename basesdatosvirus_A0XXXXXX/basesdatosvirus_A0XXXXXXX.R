library("seqinr")
library("ggplot2")
library("stringr")

zika<-read.fasta("Zika.fasta")
sarscovid<-read.fasta("COVID.fasta")
wuhan<-read.fasta("wuhan.fasta")
mers<-read.fasta("MECOVID.fasta")
dengue<-read.fasta("dengue.fasta")

length(zika[[1]])
length(sarscovid[[1]])
length(wuhan[[1]])
length(mers[[1]])
length(dengue[[1]])

count(zika[[1]],1)
count(sarscovid[[1]],1)
count(wuhan[[1]],1)
count(mers[[1]],1)
count(dengue[[1]],1)

head(zika[[1]])
head(sarscovid[[1]])
head(wuhan[[1]])
head(mers[[1]])
head(dengue[[1]])

GC(zika[[1]])*100
GC(sarscovid[[1]])*100
GC(wuhan[[1]])*100
GC(mers[[1]])*100
GC(dengue[[1]])*100

zika[[1]][c(1:10,(length(zika[[1]])-10):length(zika[[1]]))]
comp(zika[[1]])[c(1:10,(length(zika[[1]])-10):length(zika[[1]]))]
dengue[[1]][c(1:10,(length(dengue[[1]])-10):length(dengue[[1]]))]
comp(dengue[[1]])[c(1:10,(length(dengue[[1]])-10):length(dengue[[1]]))]
sarscovid[[1]][c(1:10,(length(sarscovid[[1]])-10):length(sarscovid[[1]]))]
comp(sarscovid[[1]])[c(1:10,(length(sarscovid[[1]])-10):length(sarscovid[[1]]))]
mers[[1]][c(1:10,(length(mers[[1]])-10):length(mers[[1]]))]
comp(mers[[1]])[c(1:10,(length(mers[[1]])-10):length(mers[[1]]))]
wuhan[[1]][c(1:10,(length(wuhan[[1]])-10):length(wuhan[[1]]))]
comp(wuhan[[1]])[c(1:10,(length(wuhan[[1]])-10):length(wuhan[[1]]))]

tabla<-data.frame(
  virus = rep(c("Dengue", "Middle E-COVID", "COVID","Wuhan-Hu-1",
                "Zica"),each=4),
  nucleotido=rep(c("Adenina","Citosina","Guanina",
                   "Timina"),5),
  Frecuencia = c(count(dengue[[1]],1), count(mers[[1]],1),
                 count(sarscovid[[1]],1), count(wuhan[[1]],1),
                 count(zika[[1]],1))
)

ggplot(data = tabla) +
  geom_bar(aes(x=virus, y=Frecuencia, fill=nucleotido),
           position="dodge",stat="identity")

