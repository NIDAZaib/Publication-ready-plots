#title: "Animated Graphs in Rstudio"
#author: "Nida Zaib"
# "Oct 4, 2021"

install.packages("ggplot2")
install.packages('gganimate')
library(ggplot2)
library(gganimate)
install.packages("gifski")
install.packages('av')
library(gifski)
library(av)
data()
install.packages("gapminder")
library(gapminder)
head(gapminder)
nrow(gapminder)
View(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp))+geom_point() #simple graph

ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop))+geom_point() #size of pop

ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F) #colour code by country

ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F, alpha=0.8)
#color change for beauty
install.packages("viridis")
library(viridis)
AN1<- ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F, alpha=0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  labs(title = "Year: {frame_time}", x="GDP per Capita", 
       y="Life Expectency")+
  transition_time((year))+shadow_wake(wake_length = 0.1,alpha = FALSE)+
  ease_aes("linear")+facet_wrap(~gapminder$continent,nrow = 3)#nrow =1 or we can make it to equel 3
AN1
animate(AN1, duration = 10, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")
install.packages("devtools")
library(devtools)



#color change for beauty
install.packages("viridis")
library(viridis)
AN1<- ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F, alpha=0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  labs(title = "Year: {frame_time}", x="GDP per Capita", 
       y="Life Expectency")+
  transition_time((year))+
  ease_aes("linear")
AN1
animate(AN1, duration = 10, fps = 20, width = 300, height = 300, renderer = gifski_renderer())
anim_save("output.gif")

# with facetwraps

AN1<- ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F, alpha=0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+facet_wrap(~gapminder$continent,nrow = 3)+
  labs(title = "Year: {frame_time}", x="GDP per Capita", 
       y="Life Expectency")+
  transition_time((year))+
  ease_aes("linear")
AN1
animate(AN1, duration = 10, fps = 20, width = 300, height = 300, renderer = gifski_renderer())
anim_save("output.gif")

#tails
AN1<- ggplot(gapminder, aes(gdpPercap, lifeExp,size=pop, col=country))+
  geom_point(show.legend = F, alpha=0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  labs(title = "Year: {frame_time}", x="GDP per Capita", 
       y="Life Expectency")+
  transition_time((year))+shadow_wake(wake_length = 0.1,alpha = FALSE)+
  ease_aes("linear")
AN1
animate(AN1, duration = 10, fps = 20, width = 600, height = 600, renderer = gifski_renderer())
anim_save("output.gif")
install.packages("devtools")


#line plot
p <- ggplot(
  airquality,
  aes(Day, Temp, group = Month, color = factor(Month))) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
p
p1<- p + transition_reveal(Day)+ 
  geom_point() +
  transition_reveal(Day)
animate(p1, duration = 10, fps = 20, width = 600, height = 600, renderer = gifski_renderer())
anim_save("output.gif")

#barplot
library(dplyr)
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))
mean.temp
p2 <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
  geom_col() +
  scale_fill_distiller(palette = "Reds", direction = 1) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white"),
    panel.ontop = TRUE
  )
p2
p3 <- p2 + transition_states(Month, wrap = FALSE) +
  shadow_mark()
animate(p3, duration = 10, fps = 20, width = 600, height = 600, renderer = gifski_renderer())
anim_save("output.gif")

