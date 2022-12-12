install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GlassData = read_csv("GTL.csv")
head(GlassData)

str(GlassData)


qplot(x = Temp, y = Light, geom = "point", data = GlassData) + 
  facet_grid(.~Glass, labeller = label_both)

#ANOVA
GlassData$Glass = as.factor(GlassData$Glass)
GlassData$Temp = as.factor(GlassData$Temp)


anova = aov(Light ~ Glass*Temp, data = GlassData)
summary(anova)

# tambilkan mean dan SD

dataSum = group_by(GlassData, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(dataSum)

# uji tukey
tukey = TukeyHSD(anova)
print(tukey)


tukey.cld = multcompLetters4(anova, tukey)
print(tukey.cld)

#menambahkan CLD ke tabel sebelumnya

cld = as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
dataSum$Tukey <- cld$Letters
print(dataSum)
