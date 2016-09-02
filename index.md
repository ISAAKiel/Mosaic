---
title       : Mosaic 
subtitle    : Modelling Spheres of Intercation
author      : Franziska Faupel, Daniel Knitter and Oliver Nakoinz
job         : Summer School 2016
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : logo03.png
biglogo     : logo03.png
--- &twocol

<style type="text/css">
body {background:grey transparent;
}
</style>

<style>
strong {
  font-weight: bold;
}
</style>

## Organisation

*** =left

- Franziska Faupel
- Carl Evers

*** =right

<div style='position:absolute;bottom:10%;right:15%'>
  <img  height="200" src='assets/img/cEvers.png' />
</div>

<div style='position:absolute;top:10%;right:15%'>
  <img  height="200" src='assets/img/FFaupel.jpg' />
</div>

---

## Reconstructing and Modelling Early Iron Age Systems of Interaction and Distribution

<div style='position:absolute;bottom:10%;right:5%'>
  <img  height="450" src='assets/img/shkr.png' />
</div>

<div style='position:absolute;bottom:25%;left:5%'>
  <img  height="300" src='assets/img/pic51.png' />
</div>


---

## Mosaic | Modelling Speheres of Interaction

<div style='position:absolute;bottom:10%;right:20%'>
  <img  height="500" src='assets/img/mosaic.png' />
</div>

---

## International Center

<div style='position:absolute;bottom:10%;left:10%'>
  <img  height="500" src='assets/img/IntCenter.png' />
</div>

<div style='position:absolute;top:15%;right:10%'>
  <img  height="100" src='assets/img/CAu.png' />
</div>

--- 

## Guest Lectures

>- Loup Bernard

>- James Allison

>- Aleksandr Diachenko

--- &twocol

## Daniel Knitter

*** =left

- SS 2013 (Noer)
- WS 2014 (Berlin)

*** =right

<div style='position:absolute;bottom:10%;right:10%'>
  <img  height="450" src='assets/img/diss.jpg' />
</div>

<div style='position:absolute;bottom:10%;left:15%'>
  <img  height="300" src='assets/img/buch.jpeg' />
</div>

---

## MOSAIC - Modelling Speheres of Interaction

**Aims**
- understand concepts
- adapt methods and techniques
- connect to experts
- establish a community
- develop a scientific network
- **collaborative projects of participants**

<div style='position:absolute;bottom:20%;right:10%'>
  <img  height="300" src='assets/img/panic.jpg' />
</div>

---

## Some usefull information

<div style='position:absolute;bottom:10%;right:5%'>
  <img  height="500" src='assets/img/Ufg_Lage.png' />
</div>

---

## Timetable

<div style='position:absolute;bottom:10%;right:15%'>
  <img  height="500" src='assets/img/time.png' />
</div>

--- .segue bg:grey

## Interaction between Humans and Landscape

## Jutta Kneisel

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="100" width="100" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

--- &twocol

## Presentations

*** =left

**Monday, 5th of September**

1. [Interaction as a key term](01-interaction/index.html)

**Tuesday, 6th of September**

1. [Introduction to R](02-introduction/index.html)
2. [R Basics: Frist Steps](03-R_basics01/index.html)
3. [R Basics: Getting used to R](04-R_basics02/index.html)
4. [Using R as GIS](05-R_GIS/index.html)
5. [**Workshop:** Basic Spatial Statistics](06-WS_Basic_Spatial_Statistics/index.html)

*** =right

**Wednesday, 7th of September**

1. [Modelling Interaction: Cultural & Geographic Distance](07-cul_distances/index.html)
2. [**Workshop**: Geographical and Economic Distances](08-WS_Geo_Eco_Distances/index.html)
3. [**Workshop:** Cultural Distances](09-WS_Cul_Distances/index.html)

**Thursday, 8th of September**

1. [Modelling Interaction: Network Approaches](10-Network_Analysis/index.html)
2. [**Workshop:** Pointpattern Analysis](11-WS_Pointpattern/index.html)
3. [**Workshop:** Network Analysis](12-WS_Network/index.html)

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="100" width="100" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

--- &twocol

## Needed Packages

*** =left
- `vioplot`
- `ggplot2`
- `sm`
- `rgdal`
- `raster`
-  `sp`
- `rgeos`
- `maptools`
- `proj4`
- `gstat`

*** =right

- `foreign`
- `shapefiles`
- `plyr`
- `RSAGA`
- `Matrix`
- `spdep`
- `nlme`
- `rpart`
- `spatstat`
- `igraph`
- `RANN`

---

## Install Packages from a local directory

In case the internet connection is not stable enough, you find all needed packages on your flash drive.
Please adapte the follwing code to your needs. 


```r
 install.packages("ggplot2", lib="path to flash drive or local dir/Rpackages/")
 library(ggplot2, lib.loc="path to flash drive or local dir/Rpackages/")
```

---

## MOSAIC - Modelling Speheres of Interaction

**Aim**

This Summer School focuses on interaction as a key concept in social life, and 
on methods for reconstructing and modeling spheres of interaction at different 
spatial and temporal scales. Students will learn an innovative approach, used in
recent studies, for modelling spheres of interaction. The course will cover a 
variety of theories and concepts that will enable students to apply this method 
to further regions, material groups, and time periods. The course is divided 
into individual lessons presented by experts, thus providing a diverse overview 
of approaches.

---

## MOSAIC - Modelling Speheres of Interaction

**About Mosaic**

At Kiel University there is a growing interdisciplinary community which strives 
to establish an integrative concept and culture of modelling. The intention 
behind Mosaic is to convey the Kiel spirit of interdisciplinary modelling and to
facilitate knowledge transfer on basic theories, methods and techniques in 
spatio-temporal modelling. In this summer school we will introduce participants 
to the basics of modelling, mathematics, trends, boundaries, movement, 
interaction and networks.

---

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="300" width="300" style='position:absolute;top:20%;right:35%' src='assets/img/ISAAK.png' />
</a>
