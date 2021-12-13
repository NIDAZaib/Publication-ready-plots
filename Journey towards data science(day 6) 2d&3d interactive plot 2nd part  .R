#title: Interactive 2D and 3D plots in R
#Author:Nida Zaib
#date: Oct 6, 2021

library(ggplot2)
head(iris)
p <- ggplot(iris, aes(iris$Sepal.Width, iris$Sepal.Length, col=iris$Species))+geom_point()
p
library(plotly)
plot_ly(p)

library(plotly)
head(volcano)
plot_ly(z=volcano)%>% add_surface()
plot_ly(z=volcano,type = "surface")
view

#different surfaces
x1 = c(1,2,3,4,5)
y1 = c(1,2,3,4,5)
z1 = rbind(c(0, 1, 0, 1, 0),
           c(1, 0, 1, 0, 1),
           c(0, 1, 0, 1, 0),
           c(1, 0, 1, 0, 1),
           c(0, 1, 0, 1, 0))

p1 <- plot_ly(
  type = 'surface',
  contours = list(
    x = list(show = TRUE, start = 1.5, end = 2, size = 0.04, color = 'white'),
    z = list(show = TRUE, start = 0.5, end = 0.8, size = 0.05)),
  x = ~x1,
  y = ~y1,
  z = ~z1)
p1

#scatter plot
p1 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)
p1
p1 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
              marker = list(size = 20,
                            color = "blue",
                            line = list(color = "black", width = 2)))
p1
#line+scatter plot


library(plotly)

trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)

data <- data.frame(x, trace_0, trace_1, trace_2)

fig <- plot_ly(data, x = ~x)
fig <- fig %>% add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines')
fig <- fig %>% add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers')
fig <- fig %>% add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')

fig

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)

str(diamonds) 
diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(diamonds, x = ~carat, y = ~price, color = ~carat, size = ~carat)

#piechart
labels = c("oxygen", "hydrogen", "carbon-dioxide", "nitrogen")
values = c(4500, 2500, 1053, 500)
fig <- plot_ly(type = "pie", labels = labels, values=values,
        texinfo = "label+percentage",
        insidetextorientation = "radial")
fig

#bar plot

x= c("giraffes", "oranges", "monkeys")
y = c(20, 14, 23)
plot_ly(type = "bar", x=x, y=y, color = x)
iris
p3 <- plot_ly(type="bar",  data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)
p3
View(iris)
dt <- group_by(iris, Species) %>% 
  summarise(Means=mean(Sepal.Length), sd = sd(Sepal.Length))
            
dt
dt <- group_by(iris, Species) %>%
  summarise(means=mean(Sepal.length), sd = sd(Sepal.Length))
dt            
plot_ly(data= dt, type = "bar", x=dt$species, y=dt$Means, color = dt$Species)
dt
