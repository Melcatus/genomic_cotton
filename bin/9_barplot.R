#### This script is to do graphic of number of structural variants in each sample ####
## Packages
library(gtable)
library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

#### graphic of CNV ####
Tabla1 <- read.table("cnv_dom.txt", head=T)

graphic1 <- ggplot(data=Tabla1, aes(x=ID, y=Number, fill=Origin)) + 
  geom_bar(stat="identity", position="dodge") + 
  scale_fill_manual(name = "Origen de las muestras", labels=c("silvestre", "variedad comercial", "variedad nativa"), values=c("deepskyblue4", "yellow2", "green4"))
graphic1
graphic1 <-graphic1+ theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="black", size=8, face="bold"),
                                        axis.title.y = element_text(color="black", size=10, face="bold"))
graphic1
#modified labels
graphic1 <- graphic1 + xlab("Individuo")
graphic1
graphic1 <- graphic1 + ylab("Copy Number Variant")
graphic1

#### graphic of Deletions ####
Tabla2 <- read.table("del_dom.txt", head=T)
graphic2 <- ggplot(data=Tabla2, aes(x=ID, y=Number, fill=Origin)) + 
  geom_bar(stat="identity", position="dodge") + 
  scale_fill_manual(name = "Origen de las muestras", labels=c("silvestre", "variedad comercial", "variedad nativa"), values=c("deepskyblue4", "yellow2", "green4"))
graphic2
graphic2 <-graphic2+ theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="black", size=8, face="bold"),
                                        axis.title.y = element_text(color="black", size=10, face="bold"))
graphic2
#modified labels
graphic2 <- graphic2 + xlab("Individuo")
graphic2
graphic2 <- graphic2 + ylab("Deleciones")
graphic2

#### graphic of Insertions ####
Tabla3 <- read.table("ins_dom.txt", head=T)
graphic3 <- ggplot(data=Tabla3, aes(x=ID, y=Number, fill=Origin)) + 
  geom_bar(stat="identity", position="dodge") + 
  scale_fill_manual(name = "Origen de las muestras", labels=c("silvestre", "variedad comercial", "variedad nativa"), values=c("deepskyblue4", "yellow2", "green4"))
graphic3
graphic3 <-graphic3+ theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="black", size=8, face="bold"),
                                        axis.title.y = element_text(color="black", size=10, face="bold"))
graphic3
#modified labels
graphic3 <- graphic3 + xlab("Individuo")
graphic3
graphic3 <- graphic3 + ylab("Inserciones")
graphic3

#### graphic of Insertions ####
Tabla4 <- read.table("inv_dom.txt", head=T)
graphic4 <- ggplot(data=Tabla4, aes(x=ID, y=Number, fill=Origin)) + 
  geom_bar(stat="identity", position="dodge") + 
  scale_fill_manual(name = "Origen de las muestras", labels=c("silvestre", "variedad comercial", "variedad nativa"), values=c("deepskyblue4", "yellow2", "green4"))
graphic4
graphic4 <-graphic4+ theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="black", size=8, face="bold"),
                                        axis.title.y = element_text(color="black", size=10, face="bold"))
graphic4
#modified labels
graphic4 <- graphic4 + xlab("Individuo")
graphic4
graphic4 <- graphic4 + ylab("Inversiones")
graphic4

#### all graphics in only image ####
graphic5 <- grid.arrange(graphic1, graphic2, graphic3, graphic4, nrow = 2)

