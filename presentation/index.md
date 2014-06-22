---
title       : Painless Plotting Shiny App
subtitle    : Developing Data Products - Data Science Coursera Course
author      : Marc Tolentino
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## The Problem
### Implementing Plots in R can take time

```r
# Boxplot of MPG by Car Cylinders
boxplot(mpg ~ cyl, data = mtcars, main = "Car Milage Data", xlab = "Number of Cylinders", 
    ylab = "Miles Per Gallon")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


--- .class #id 

## The Solution: Plotting App to easily plot your data

<img src="assets/img/app_image.png" width="1000px" height="400px"/>

--- .class #id 

## Next Steps: Overlay Plots of Your Choice



# Example: Avoid implementing overlayed density plots

```r
featurePlot(x = iris[, 1:4], y = iris$Species, plot = "density", scales = list(x = list(relation = "free"), 
    y = list(relation = "free")), adjust = 1.5, pch = "|", layout = c(4, 1), 
    auto.key = list(columns = 3))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


--- .class #id 

## Thank You

If you want to participate, join me at
* GitHub: https://github.com/mtolent23/Data-Products.git
* Email: mtolent23@yahoo.co.uk

