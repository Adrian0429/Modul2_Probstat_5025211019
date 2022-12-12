ANOVA4 = read.table("onewayanova.txt",h=T)
ANOVA4
  
  # set group ->  Faktor
  ANOVA4$Group <- as.factor(ANOVA4$Group)
  
  # labelling
  ANOVA4$Group = factor(ANOVA4$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))
  
  Group1 <- subset(ANOVA4, Group == "kucing oren")
  Group2 <- subset(ANOVA4, Group == "kucing hitam")
  Group3 <- subset(ANOVA4, Group == "kucing putih")
  

  qqnorm(Group1$Length)
  qqline(Group1$Length)
  
  qqnorm(Group2$Length)
  qqline(Group2$Length)
  
  qqnorm(Group3$Length)
  qqline(Group3$Length)
  
  
# b, Homogenity of Variances
  
  bartlett.test(Length ~ Group, data = ANOVA4)
  
  model1 = lm(Length ~ Group, data = ANOVA4)
  anova(model1)
  
  #TukeyHSD
  TukeyHSD(aov(model1))
  
  #plot using GGplot
  #import library ggplot
  library("ggplot2")
  ggplot(ANOVA4, aes(x = Group, y = Length)) +
    geom_boxplot(color = c("#00AFBB", "#E7B800", "#FC4E07"), fill = "green") +
    scale_x_discrete() + xlab("Group") + ylab("Length (cm)")
  
  