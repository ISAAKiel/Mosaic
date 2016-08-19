---
title       : Modelling Interaction
subtitle    : Distances
author      : Oliver Nakoinz, Daniel Knitter
date: Workshop, 07.09.2016, 08:00-10:00, MOSAIC summer school, Kiel
job         : MOSAIC Summer School 2016
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow # tomorrow 
widgets     : [mathjax, phantomjs]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : logo03_scaled.png
biglogo     : logo03_scaled.png
--- 

<style type="text/css">
body {background:grey transparent;
}
</style>

## Content

> 1. Prerequisites: load data into R, calculate simple geomorphometric measures
> 2. Euclidean distance
> 3. Least-cost distance

---

## Content

1. **Prerequisites: load data into R, calculate simple geomorphometric measures**
2. Euclidean distance
3. Least-cost distance

---

## 1.1 Download DEM

As test data, I download the data provided with the book of Nakoinz and Knitter (2016):


```r
download.file(
    url = "https://raw.githubusercontent.com/dakni/mhbil/master/data/dw_gk3_50_ag.asc",
    destfile = "dem.asc")
```

Now, load the file using `rgdal` package


```r
library(rgdal)
dem <- readGDAL("dem.asc")
```

---

## 1.1 Download DEM

Structure of the `dem` object


```r
str(dem)
## Formal class 'SpatialGridDataFrame' [package "sp"] with 4 slots
##   ..@ data       :'data.frame':	204892 obs. of  1 variable:
##   .. ..$ band1: num [1:204892] 11.57 10.15 9.91 10.96 11.64 ...
##   ..@ grid       :Formal class 'GridTopology' [package "sp"] with 3 slots
##   .. .. ..@ cellcentre.offset: Named num [1:2] 3550761 6022492
##   .. .. .. ..- attr(*, "names")= chr [1:2] "x" "y"
##   .. .. ..@ cellsize         : num [1:2] 50 50
##   .. .. ..@ cells.dim        : int [1:2] 566 362
##   ..@ bbox       : num [1:2, 1:2] 3550736 6022467 3579036 6040567
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr [1:2] "x" "y"
##   .. .. ..$ : chr [1:2] "min" "max"
##   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
##   .. .. ..@ projargs: chr NA
```

--- &twocol

## 1.1 Where is the DEM?

*** =left

What is the meaning of the coordinates?


```r
dem@bbox
##       min     max
## x 3550736 3579036
## y 6022467 6040567
```


What is the Spatial Reference System (SRS)?

[= Coordinate Reference System (CRS)]


*** =right

<div style='text-align: center;'>
    <img height='460' src='https://upload.wikimedia.org/wikipedia/commons/1/15/MercTranSph.png' />
</div>

<div style="font-size:10px">By <a href="//commons.wikimedia.org/wiki/User:Peter_Mercator" title="User:Peter Mercator">Peter Mercator</a> - <span class="int-own-work" lang="en">Own work</span>, Public Domain, https://commons.wikimedia.org/w/index.php?curid=9910926</div>

--- &twocol

## 1.1 Where is the DEM?

*** =left

What is the meaning of the coordinates?


```r
dem@bbox
##       min     max
## x 3550736 3579036
## y 6022467 6040567
```


What is the Spatial Reference System (SRS)?

[= Coordinate Reference System (CRS)]


*** =right

<div style='text-align: center;'>
    <img height='520' src='https://upload.wikimedia.org/wikipedia/de/1/12/Gau%C3%9F-Kr%C3%BCger-Raster_Deutschland.png' />
</div>

<div style="font-size:10px">Von <a href="//de.wikipedia.org/wiki/Benutzer:BerndH" title="Benutzer:BerndH">BerndH</a> - selbst erstellt mit Generic Mapping Tools (psbasemap, psxy), Python, GIMP, <a title="Creative Commons Namensnennung-Weitergabe unter gleichen Bedingungen Unported 3.0" href="http://creativecommons.org/licenses/by-sa/3.0/legalcode">CC BY-SA 3.0</a>, https://de.wikipedia.org/w/index.php?curid=4186798</div>


--- &twocol

## 1.2 Project DEM and plot

*** =left

https://epsg.io/5677


```r
dem@proj4string <- CRS("+init=epsg:5677")
is.projected(dem)
## [1] TRUE
plot(dem)
```

*** =right

![plot of chunk unnamed-chunk-7](assets/fig/unnamed-chunk-7-1.png)

--- &twocol

## 1.2 Project DEM and plot

*** =left

Plot using `raster` package


```r
#library(raster)
plot(raster(dem))
```

*** =right


```
## Error in plot(raster(dem)): could not find function "raster"
```

--- 

## 1.3 Download point data


```r
download.file(
    url = "https://raw.githubusercontent.com/dakni/mhbil/master/data/meg_dw.csv",
    destfile = "meg_dw.csv")

meg_dw <- read.table(file = "meg_dw.csv",
                     header = TRUE,
                     sep = ";")
head(meg_dw)
```

```
##   id       x       y
## 1  1 3553751 6028609
## 2  2 3553442 6027416
## 3  3 3552502 6025080
## 4  4 3552518 6024799
## 5  5 3553799 6025130
## 6  6 3551621 6025247
```

---

## 1.4 Create SpatialPointsDataFrame (spdf)


```r
library(sp)
coordinates(meg_dw) <- ~x+y
str(meg_dw)
```

```
## Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
##   ..@ data       :'data.frame':	267 obs. of  1 variable:
##   .. ..$ id: int [1:267] 1 2 3 4 5 6 7 8 9 10 ...
##   ..@ coords.nrs : int [1:2] 2 3
##   ..@ coords     : num [1:267, 1:2] 3553751 3553442 3552502 3552518 3553799 ...
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr [1:267] "1" "2" "3" "4" ...
##   .. .. ..$ : chr [1:2] "x" "y"
##   ..@ bbox       : num [1:2, 1:2] 3551621 6022761 3576305 6040236
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr [1:2] "x" "y"
##   .. .. ..$ : chr [1:2] "min" "max"
##   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
##   .. .. ..@ projargs: chr NA
```

--- &twocol

## 1.5 Project spdf and plot

*** =left


```r
proj4string(meg_dw) <- CRS("+init=epsg:5677")
is.projected(meg_dw)
```

```
## [1] TRUE
```

```r
plot(raster(dem))
```

```
## Error in plot(raster(dem)): could not find function "raster"
```

```r
points(meg_dw)     
```

```
## Error in plot.xy(xy.coords(x, y), type = type, ...): plot.new has not been called yet
```

*** =right


```
## Error in plot(raster(dem)): could not find function "raster"
```

```
## Error in plot.xy(xy.coords(x, y), type = type, ...): plot.new has not been called yet
```

---

## Content

1. Prerequisites: load data into R, calculate simple geomorphometric measures
2. **Euclidean distance**
3. Least-cost distance

---


## 2 Euclidean distance 1

Distance between points using Euclidean distance with our own function

$$d(i,j) = \sqrt{(x_i-x_j)^2 + (y_i-y_j)^2}$$


```r
meg_dw@coords[1,]
```

```
##       x       y 
## 3553751 6028609
```

```r
e.d <- function(x1,x2){
    ed <- sqrt((x1[1]-x2[1])^2 + (x1[2]-x2[2])^2)
    return(ed)
    }             
ed1 <- e.d(meg_dw@coords[1,],meg_dw@coords[2,])
ed1
```

```
##        x 
## 1232.368
```

---

## 2 Euclidean distance 2

Distance between points using Euclidean distance using package `rgeos`


```r
library(rgeos)
```

```
## Warning: package 'rgeos' was built under R version 3.3.1
```

```
## rgeos version: 0.3-19, (SVN revision 524)
##  GEOS runtime version: 3.5.0-CAPI-1.9.0 r4084 
##  Linking to sp version: 1.2-3 
##  Polygon checking: TRUE
```

```r
gDistance(spgeom1 = meg_dw[meg_dw@data$id==1,],
          spgeom2 = meg_dw[meg_dw@data$id==2,])
```

```
## [1] 1232.368
```

```r
ed2 <- gDistance(spgeom1 = meg_dw,
          byid = TRUE)
ed2[2]
```

```
## [1] 1232.368
```

```r
ed1==ed2[2]
```

```
##    x 
## TRUE
```

--- &twocol

## 2 Euclidean distance 2

*** =left


```r
class(ed2)
```

```
## [1] "matrix"
```

```r
str(ed2)
```

```
##  num [1:267, 1:267] 0 1232 3744 4005 3479 ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:267] "1" "2" "3" "4" ...
##   ..$ : chr [1:267] "1" "2" "3" "4" ...
```

```r
library(fields)
```

```
## Error in library(fields): there is no package called 'fields'
```

```r
image.plot(ed2)
```

```
## Error in eval(expr, envir, enclos): could not find function "image.plot"
```

*** =right


```
## Error in eval(expr, envir, enclos): could not find function "image.plot"
```

---

## 2 Euclidean distance 2


```r
min(ed2)
```

```
## [1] 0
```


```r
round(data.frame(min = min(ed2[ed2>0]),
                 max = max(ed2[ed2>0]),
                 mean = mean(ed2[ed2>0]),
                 median = median(ed2[ed2>0])
                 ),
      2)
```

```
##     min      max    mean  median
## 1 18.44 27561.77 9565.89 8619.07
```


--- &twocol

## 2 Euclidean distance 2

*** =left


```r
hist(ed2)
abline(v = mean(ed2[ed2>0]), col = "red")
abline(v = median(ed2[ed2>0]), col = "blue")
```

*** =right

![plot of chunk unnamed-chunk-21](assets/fig/unnamed-chunk-21-1.png)

--- &twocol

## 2 Euclidean distance 2

Some further questions that might be interesting

*** =left


```r
mp <- apply(X = ed2,
            MARGIN = 2,
            FUN = mean)

tmp <- ed2
tmp[tmp==0] <- 9999

cp <- apply(X = tmp,
            MARGIN = 2,
            FUN = min)

meg_dw$mp <- mp
meg_dw@data$cp <- cp
```

*** =right

What is the mean euclidean distance from a point to its surrounding points (mp)?

What is the closest euclidean distance from a point to its surrounding points (cp)?

Write the result in the attribute table of our spdf

**Question:** Why changing 0 to 9999?

--- &twocol

## 2 Euclidean distance 2

Examples how to use `spplot`: http://rspatial.r-forge.r-project.org/gallery/

*** =left


```r
spplot(meg_dw, "cp")
```

<img src="assets/fig/unnamed-chunk-23-1.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="450px" />

*** =right


```r
spplot(meg_dw, "mp")
```

<img src="assets/fig/unnamed-chunk-24-1.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" width="450px" />

---

## 2 Euclidean distance 2

Leaflet in `R`: https://rstudio.github.io/leaflet/


```r
library(leaflet)
tmp <- spTransform(meg_dw, CRSobj = CRS("+init=epsg:4326"))
leaflet(data=tmp$cp) %>%
    addTiles() %>%
    addCircleMarkers(lng = tmp@coords[,1],
                     lat = tmp@coords[,2],
                     radius = tmp$mp/1000,
                     )
```

---

## 2 Euclidean distance 2

`Mapview` [as alternative to `leaflet`]: http://environmentalinformatics-marburg.github.io/mapview/introduction.html


```r
library(mapview)
mapview(meg_dw, zcol = "mp", legend = TRUE)
```

---


## Questions? 


---

## Content

1. Prerequisites: load data into R, calculate simple geomorphometric measures
2. Euclidean distance
3. **Least-cost distance**

---

## 3 Least cost distance

What are the necessary steps?

1. Create cost surface
2. Create transition matrix, i.e. matrix recording connections between cells
3. Transition matrix is filled with conductance, rather than resistance values; hence unconnected cells have value 0 (= no conductance); memory efficient
4. Geocorrection of values
5. Identify adjacent cells
6. Calculate walking speed for adjacent cells
7. Geocorrect speed values
8. Find path using least-cost ("as the wolf runs") or random walk ("drunkard's walk") algorithm


--- &twocol

## 3 Least cost distance


*** =left

We use the `gdistance` package by Jacob van Etten (https://cran.r-project.org/web/packages/gdistance)

First we calculate the slope, as this is used as cost


```r
library(raster)
```

```
## Warning: package 'raster' was built under R version 3.3.1
```

```
## Error: package or namespace load failed for 'raster'
```

```r
dem <- raster(dem)
```

```
## Error in eval(expr, envir, enclos): could not find function "raster"
```

```r
slope <- terrain(x = dem,
                 opt = "slope",
                 neighbors = 8,
                 unit = "degrees")
```

```
## Error in eval(expr, envir, enclos): could not find function "terrain"
```

```r
plot(slope)
```

```
## Error in plot(slope): object 'slope' not found
```

```r
##drawExtent()
crop.extent <- extent(c(3551000,3578650,6022770,6045000))
```

```
## Error in eval(expr, envir, enclos): could not find function "extent"
```

```r
slope <- crop(x = slope, y = crop.extent)
```

```
## Error in eval(expr, envir, enclos): could not find function "crop"
```

*** =right


```
## Error in plot(slope): object 'slope' not found
```

--- 

## 3 Least cost distance

*** =left

We need to get rid of the ocean areas since it is not crossable (by foot)

- get land areas
- reproject them
- mask the slope
- reproject and factorize
- create uncrossable transition area


*** =right


```r
ab <- getData("GADM", country = "DEU", level = 1)
```

```
## Error in eval(expr, envir, enclos): could not find function "getData"
```

```r
ab <- spTransform(ab, CRSobj = CRS("+init=epsg:5677"))
```

```
## Error in spTransform(ab, CRSobj = CRS("+init=epsg:5677")): object 'ab' not found
```

```r
slope <- mask(slope, mask = ab, updatevalue = 9999)
```

```
## Error in eval(expr, envir, enclos): could not find function "mask"
```

---

## 3 Least cost distance

Afterwards we create the transition object and geocorrect it


```r
library(gdistance)
```

```
## Warning: package 'gdistance' was built under R version 3.3.1
```

```
## Warning: package 'raster' was built under R version 3.3.1
```

```
## Error: package 'raster' could not be loaded
```

```r
slope.tran <- transition(x = slope,
                         transitionFunction = mean,
                         directions = 8,
                         symm = TRUE)
```

```
## Error in eval(expr, envir, enclos): could not find function "transition"
```

```r
slope.geo <- geoCorrection(x = slope.tran, scl = TRUE)
```

```
## Error in eval(expr, envir, enclos): could not find function "geoCorrection"
```

To see how the results look like we create a raster stack for easy plotting


```r
slopes <- stack(slope,
                raster(slope.tran),
                raster(slope.geo))
```

```
## Error in stack(slope, raster(slope.tran), raster(slope.geo)): object 'slope' not found
```

```r
names(slopes) <- c("Slope","Transition","Geocorrection")
```

```
## Error in names(slopes) <- c("Slope", "Transition", "Geocorrection"): object 'slopes' not found
```

```r
plot(slopes, nr = 1)
```

```
## Error in plot(slopes, nr = 1): object 'slopes' not found
```

--- &twocol

## 3 Least cost distance

Now, the final step. Calculate Tobler's hiking speed, geocorrect again and calculate a shortest path

*** =left


```r
adj <- adjacent(x = slope,
                cells=1:ncell(slope),
                pairs=TRUE,
                directions=8)
```

```
## Error in eval(expr, envir, enclos): could not find function "adjacent"
```

```r
speed <- slope.geo
```

```
## Error in eval(expr, envir, enclos): object 'slope.geo' not found
```

```r
speed[adj] <-  6 * exp(-3.5 * abs(slope.geo[adj] + 0.05))
```

```
## Error in eval(expr, envir, enclos): object 'slope.geo' not found
```

```r
speed.geo <- geoCorrection(x = speed, scl=TRUE)
```

```
## Error in eval(expr, envir, enclos): could not find function "geoCorrection"
```

```r
sp1 <- shortestPath(x = speed.geo,
                    origin = meg_dw@coords[4,],
                    goal = meg_dw@coords[231,],
                    output = "SpatialLines")
```

```
## Error in eval(expr, envir, enclos): could not find function "shortestPath"
```

```r
plot(raster(speed.geo))
```

```
## Error in plot(raster(speed.geo)): could not find function "raster"
```

```r
lines(sp1)
```

```
## Error in lines(sp1): object 'sp1' not found
```

*** =right


```
## Error in plot(raster(speed)): could not find function "raster"
```

```
## Error in lines(sp1): object 'sp1' not found
```


--- 

## 3 Least cost distance

What about the "drunkard's walk"? `theta` is the level of drunkenness, i.e. the degree from which
the path randomly deviates from the shortest path


```r
p1 <- passage(x = speed.geo,
              origin = meg_dw@coords[4,],
              goal = meg_dw@coords[231,],
              theta = .005)              
```

```
## Error in eval(expr, envir, enclos): could not find function "passage"
```

```r
p2 <- passage(x = speed.geo,
              origin = meg_dw@coords[4,],
              goal = meg_dw@coords[231,],
              theta = .05)
```

```
## Error in eval(expr, envir, enclos): could not find function "passage"
```

```r
hs <-  hillShade(slope = terrain(x = dem*10, opt = "slope"),
                 aspect = terrain(x = dem, opt = "aspect"),
                 angle = 40, direction = 270)
```

```
## Error in eval(expr, envir, enclos): could not find function "hillShade"
```

```r
plot(hs, col=grey(0:100/100), legend=FALSE)
```

```
## Error in plot(hs, col = grey(0:100/100), legend = FALSE): object 'hs' not found
```

```r
plot(p1, alpha = .5, add=TRUE); lines(sp1)
```

```
## Error in plot(p1, alpha = 0.5, add = TRUE): object 'p1' not found
```

```
## Error in lines(sp1): object 'sp1' not found
```

--- &twocol

## 3 Least cost distance

*** =left

theta = .005


```
## Error in plot(hs, col = grey(0:100/100), legend = FALSE): object 'hs' not found
```

```
## Error in plot(p1, alpha = 0.5, add = TRUE): object 'p1' not found
```

```
## Error in lines(sp1): object 'sp1' not found
```

*** =right

theta = .05


```
## Error in plot(hs, col = grey(0:100/100), legend = FALSE): object 'hs' not found
```

```
## Error in plot(p2, alpha = 0.5, add = TRUE): object 'p2' not found
```

```
## Error in lines(sp1): object 'sp1' not found
```

---

## 3 The prehistoric "Autobahn"

Run the code and get some coffee... a lot of coffee


```r
xy <- data.frame(X = meg_dw@coords[,1],
                 Y = meg_dw@coords[,2])

rows.xy <- row.names(xy)
sa.rows.xy <- sample(row.names(xy), length(xy$X)/2)
starts <- subset(xy, rows.xy %in% sa.rows.xy)
goals <- subset(xy, !(rows.xy %in% sa.rows.xy))
sg.passages <- brick(slope)
```

```
## Error in eval(expr, envir, enclos): could not find function "brick"
```

```r
for(i in 1:length(starts$X)) {
    s <- c(starts$X[i],starts$Y[i])
    z <- c(goals$X[i],goals$Y[i])
    sg.passages[[i]] <- passage(x = speed.geo, origin = s, goal = z, theta = .05) 
    cat("iteration ", i, " of ", length(starts$X),"\n")
}
```

```
## Error: could not find function "passage"
```

```r
sg.passages.sum <- sum(sg.passages)
```

```
## Error in eval(expr, envir, enclos): object 'sg.passages' not found
```

--- &twocol 

## 3 The prehistoric "Autobahn"

*** =left


```r
plot(hs, col=grey(0:100/100), legend=FALSE)
```

```
## Error in plot(hs, col = grey(0:100/100), legend = FALSE): object 'hs' not found
```

```r
plot(sg.passages.sum,
     col = colorRampPalette(colors = c("white","red"))(50),
     alpha = .5,
     add=TRUE)
```

```
## Error in plot(sg.passages.sum, col = colorRampPalette(colors = c("white", : object 'sg.passages.sum' not found
```

```r
points(meg_dw,
       pch = 19,
       col = rgb(red = 0, green = 0, blue = 0, alpha = .2))
```

```
## Error in plot.xy(xy.coords(x, y), type = type, ...): plot.new has not been called yet
```

*** =right


```
## Error in plot(hs, col = grey(0:100/100), legend = FALSE): object 'hs' not found
```

```
## Error in plot(sg.passages.sum, col = colorRampPalette(colors = c("white", : object 'sg.passages.sum' not found
```

```
## Error in plot.xy(xy.coords(x, y), type = type, ...): plot.new has not been called yet
```
