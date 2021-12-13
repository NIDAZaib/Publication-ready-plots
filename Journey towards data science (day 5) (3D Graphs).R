install.packages("plot3D")
library(plot3D)
data("iris")
head(iris)
str(iris)
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

#labels
scatter3D(x, y, z, clab = c("Sepal", "Width (cm)"))
#size of points
scatter3D(x, y, z, colvar = NULL, col = "red",
          pch = 19, cex = 0.5)
help("scatter3D")
scatter3D(x, y, z, colvar = NULL, col = "red",
          pch = 19, cex = 0.5)
#fullbox
scatter3D(x, y, z, bty = "f", colkey = FALSE, main ="bty= 'f'",
          phi = 45)
#change in shape
scatter3D(x, y, z, bty = "f", colkey = FALSE, main ="bty= 'f'",
          phi = 45, pch=18)
#colors
scatter3D(x, y, z, pch = 18, bty = "u", colkey = FALSE, 
          main ="bty= 'u'", col.panel ="#32A852", expand =0.4, 
          col.grid = "#FF00FF")

scatter3D(x, y, z, bty = "g", pch = 18, col = gg.col(25))

scatter3D(x, y, z, bty = "g", pch = 18,
          col = ramp.col(c("blue", "yellow", "red")))

#col variable
scatter3D(x, y, z, bty = "g", pch = 18, 
          col.var = as.integer(iris$Species),
          col = c("#1B9E77", "#D95F02", "#7570B3"),
          pch = 18, ticktype = "detailed",
          colkey = list(at = c(2, 3, 4), side = 1, 
                        addlines = FALSE, length = 0.5, width = 0.5,
                        labels = c("R", "With", "Aammar")))
#angle theta, phi
scatter3D(x, y, z, theta = 0, phi = 20)

#labels change
scatter3D(x, y, z, pch = 18,  theta = 25, phi = 25,
          main = "Iris data", xlab = "Sepal.Length",
          ylab ="Petal.Length", zlab = "Sepal.Width")
scatter3D(x, y, z, phi = 0, bty = "g",
          pch = 20, cex = 2, ticktype = "detailed")

#text graph
text3D(x, y, z,  labels = rownames(iris),
       add = TRUE, colkey = FALSE, cex = 0.5)


#line plot
scatter3D(x, y, z, phi = 0, bty = "g", type = "b", 
          ticktype = "detailed", lwd = 4)

#Line + point
scatter3D(x, y, z, phi = 0, bty = "g", type = "h", 
          ticktype = "detailed", pch = 20, 
          cex = c(0.5, 1, 1.5))
#CI calculation
CI <- list(z = matrix(nrow = length(x),
                      data = rep(0.1, 2*length(x))))
scatter3D(x, y, z, phi = 0, bty = "g", col = gg.col(100), 
          pch = 18, CI = CI)


#bar 3d HIST 3d
data(VADeaths)
head(VADeaths)
#  hist3D and ribbon3D with greyish background, rotated, rescaled,...
hist3D(z = VADeaths, scale = FALSE, expand = 0.01, bty = "g", phi = 20,
       col = "#0072B2", border = "black", shade = 0.2, ltheta = 90,
       space = 0.3, ticktype = "detailed", d = 2)
p <- plot_ly(z=volcano, type = "surface")
p
install.packages("rgl")
library(rgl)
install.packages("magick")
library(magick)
library(plotly)
