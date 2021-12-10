#title: "Plotting in R with ggplot2"
#author: "Nida Zaib"
#date: "03/10/2021"

install.packages("ggplot2")
library(ggplot2)
#Violin plots------------
data()
data("diamonds")
nrow(diamonds)
x <- diamonds
nrow(x)
ncol(x)
head(x)
str(x)
sample_x <- x[seq(from= 1, to= 50000, by=50),]
nrow(sample_x)
p1 <- ggplot(data = sample_x, mapping = aes(x=cut, y=price, col=cut))+
  geom_violin()+
  geom_boxplot(width=0.1)+geom_jitter(size=0.5)
p1+facet_wrap(~cut, nrow = 1, scales = "free_x")+
  theme_bw()

help("facet_wrap")


#to save in high quality for publication
p1+ggsave("p1.tiff", units = "in", width = 8, 
          height = 6, dpi = 300, compression='lzw')

p2 <- ggplot(data = x, mapping = aes(x=cut, y=price, col=cut))+
  geom_violin()+
  geom_boxplot(width=0.1)+geom_jitter(size=0.5) #53000 observations



#heatmaps---------
library(ggplot2)
iris
x <- iris
install.packages("reshape")
library(reshape)
x1 <- melt(x)
ggplot(data=x1, mapping = aes(x=Species, y=variable, fill=value))+
  geom_tile()+
  scale_fill_gradient(low = "green", high = "red")

#marginal plots
library(ggplot2)
install.packages("ggExtra")
library(ggExtra)
data(mpg)
x <- mpg
ggplot(x, aes(cty, hwy))+geom_count()+geom_smooth(method = "lm")

p1 <- ggplot(x, aes(cty, hwy))+geom_count()+
  geom_smooth(method = "lm")
p1
ggMarginal(p1, type = "boxplot", fill="transparent")
ggMarginal(p1, type = "histogram", fill="transparent")
ggMarginal(p1, type = "density", fill="transparent")
ggMarginal(p1, type = "violin", fill="transparent")
ggMarginal(p1, type = "densigram")
help("ggMarginal")


#bar plot with tukey test and lettering
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("multcompView")
install.packages("dplyr")
library(ggthemes)
library(multcompView)
library(dplyr)

# analysis of variance
data("chickwts")
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)
# Tukey's test
tukey <- TukeyHSD(anova)
tukey
# compact letter display
cld <- multcompLetters4(anova, tukey)
cld
# table with factors and 3rd quantile
dt <- group_by(chickwts, feed) %>%
  summarise(w=mean(weight), sd = sd(weight)) %>%
  arrange(desc(w))
dt
# extracting the compact letter display and adding to the Tk table
cld <- as.data.frame.list(cld$feed)
dt$cld <- cld$Letters

print(dt)


g1 <- ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  theme_few()

ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld)) +
  theme_few()

ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld), vjust = -0.5, hjust = -0.5) +
  theme_few()

ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld, y = w + sd), vjust = -0.5) +
  ylim(0,410) +
  theme_few()

g1
install.packages("ggsignif")
library(ggsignif)
g1 + geom_signif(
  comparisons = list(c("sunflower", "horsebean")))
  