# This scrips do make boxplot graphics and significance test to number of genomic variants
# Libraries
library("ggplot2")
library("carData")
library("car")
library("pgirmess")
library("grid")
library("gtable")
library("gridExtra")
############################## Effects of domestication ######################################################
##########################
######################## Differences in number of indels by grade of management
# Data
data1 <- data.frame ("Grade of management" = c(rep("Wild", 4), rep("Landraces", 5), rep("Commercial varieties", 5)), "Number of Indels" = c(439389, 408284, 429906, 323672, 420371, 350810, 223455, 279099, 349497, 230364, 251415, 245261, 257729, 326962))
head(data1)
# Median
aggregate(Number.of.Indels ~ Grade.of.management, data = data1, FUN = median)
# Standar deviation
aggregate(Number.of.Indels ~ Grade.of.management, data = data1, FUN = sd)
# Boxplot
graphic1 <- ggplot(data = data1, mapping = aes(x = Grade.of.management, y = Number.of.Indels, colour = Grade.of.management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("gold", "forestgreen", "darkblue")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic1

png("dome_indels_boxplot.png",608,445)
print(graphic1)
dev.off()
# Test of distribution of data and significance test
x <- data1$Number.of.Indels
shapiro.test(x)
anova <- aov(data1$Number.of.Indels ~ data1$Grade.of.management)
summary(anova)
##########################
######################## Differences in number of SNVs by grade of management
# Data
data2 <- data.frame ("Grade of management"  = c(rep("Wild", 4), rep("Landraces", 5), rep("Commercial varieties", 5)), "Number of SNVs" = c(2996261, 2846632, 2188783, 1794740, 3019471, 2337734, 1184682, 1781418, 2131563, 1258181, 1372752, 1323018, 1534069, 2013711))
head(data2)
# Median
aggregate(Number.of.SNVs ~ Grade.of.management, data = data2, FUN = median)
# Standar deviation 
aggregate(Number.of.SNVs ~ Grade.of.management, data = data2, FUN = sd)
# Boxplot
graphic2<-ggplot(data = data2, mapping = aes(x = Grade.of.management, y = Number.of.SNVs, colour = Grade.of.management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("gold", "forestgreen", "darkblue")) +
  theme_bw() + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                       panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
                       axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic2


png("dome_snvs_boxplot.png",608,445)
print(graphic2)
dev.off()
# Test of distribution of data and significance test
x <- data2$Number.of.SNVs
shapiro.test(x)
anova <- aov(data2$Number.of.SNVs ~ data2$Grade.of.management)
summary(anova)
##########################
######################## Differences in number of STRs by grade of management
# Data
data3 <- data.frame ("Grade of management" = c(rep("Wild", 4), rep("Landraces", 5), rep("Commercial varieties", 5)), "Number of STRs" = c(17430, 16703, 4821, 7130, 19149, 15343, 3475, 6233, 7454, 6600, 7160, 6130, 6259, 15229))
head(data3)
# Median
aggregate(Number.of.STRs ~ Grade.of.management, data = data3, FUN = median)
# Standar deviation 
aggregate(Number.of.STRs ~ Grade.of.management, data = data3, FUN = sd)
# Boxplot
graphic3 <-ggplot(data = data3, mapping = aes(x = Grade.of.management, y = Number.of.STRs, colour = Grade.of.management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("gold", "forestgreen", "darkblue")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic3
png("dome_strs_boxplot.png",608,445)
print(graphic3)
dev.off()

# Test of distribution of data and significance test
x <- data3$Number.of.STRs
shapiro.test(x)
kruskal.test(data3$Number.of.STRs ~ data3$Grade.of.management)

png("short_variant_dom.png", width=13 *300, height=8*300, res= 300)
graphic4 <- grid.arrange(graphic1, graphic2, graphic3, nrow = 1)
dev.off()

#### structural variants analysis
######################## Differences in number of CNV by grade of management
# Data
Tabla1 <- read.table("cnv_dom.txt", head=T)

# Median
aggregate(Number_of_CNV ~ Grade_of_management, data = Tabla1, FUN = median)
# Standar deviation
aggregate(Number_of_CNV ~ Grade_of_management, data = Tabla1, FUN = sd)
# Boxplot
graphic1 <- ggplot(data = Tabla1, mapping = aes(x = Grade_of_management, y = Number_of_CNV, colour = Grade_of_management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("darkblue", "gold", "forestgreen")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic1

png("dome_CNV_boxplot.png",608,445)
print(graphic1)
dev.off()
# Test of distribution of data and significance test
x <- Tabla1$Number_of_CNV
shapiro.test(x)
anova <- aov(Tabla1$Number_of_CNV ~ Tabla1$Grade_of_management)
summary(anova)

######################## Differences in number of DEL by grade of management
# Data
Tabla1 <- read.table("del_dom.txt", head=T)

# Median
aggregate(Number_of_DEL ~ Grade_of_management, data = Tabla1, FUN = median)
# Standar deviation
aggregate(Number_of_DEL ~ Grade_of_management, data = Tabla1, FUN = sd)
# Boxplot
graphic1 <- ggplot(data = Tabla1, mapping = aes(x = Grade_of_management, y = Number_of_DEL, colour = Grade_of_management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("darkblue", "gold", "forestgreen")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic1

png("dome_DEL_boxplot.png",608,445)
print(graphic1)
dev.off()
# Test of distribution of data and significance test
x <- Tabla1$Number_of_DEL
shapiro.test(x)
kruskal.test(Tabla1$Number_of_DEL ~ Tabla1$Grade_of_management)

######################## Differences in number of INS by grade of management
# Data
Tabla1 <- read.table("ins_dom.txt", head=T)

# Median
aggregate(Number_of_INS ~ Grade_of_management, data = Tabla1, FUN = median)
# Standar deviation
aggregate(Number_of_INS ~ Grade_of_management, data = Tabla1, FUN = sd)
# Boxplot
graphic1 <- ggplot(data = Tabla1, mapping = aes(x = Grade_of_management, y = Number_of_INS, colour = Grade_of_management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("darkblue", "gold", "forestgreen")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic1

png("dome_INS_boxplot.png",608,445)
print(graphic1)
dev.off()
# Test of distribution of data and significance test
x <- Tabla1$Number_of_INS
shapiro.test(x)
kruskal.test(Tabla1$Number_of_INS ~ Tabla1$Grade_of_management)

######################## Differences in number of INV by grade of management
# Data
Tabla1 <- read.table("inv_dom.txt", head=T)

# Median
aggregate(Number_of_INV ~ Grade_of_management, data = Tabla1, FUN = median)
# Standar deviation
aggregate(Number_of_INV ~ Grade_of_management, data = Tabla1, FUN = sd)
# Boxplot
graphic1 <- ggplot(data = Tabla1, mapping = aes(x = Grade_of_management, y = Number_of_INV, colour = Grade_of_management)) +
  geom_point() +
  geom_boxplot() +
  scale_colour_manual(values=c("darkblue", "gold", "forestgreen")) +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(color="white", size=8, face="bold"),
        axis.title.y = element_text(color="black", size=10, face="bold")) +
  theme(legend.position = "none")
graphic1

png("dome_INV_boxplot.png",608,445)
print(graphic1)
dev.off()
# Test of distribution of data and significance test
x <- Tabla1$Number_of_INV
shapiro.test(x)
anova <- aov(Tabla1$Number_of_INV ~ Tabla1$Grade_of_management)
summary(anova)
