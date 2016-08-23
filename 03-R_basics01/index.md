---
title       : R basics
subtitle    : First Steps
author      : Franziska Faupel
job         : MOSAIC Summer School 2016
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow    # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
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

## Structure 

*** =left

- **First Part**

> 1. Vectors
> 2. Functions
> 3. Operators
> 4. Data Frames, Martices & Arrays

*** =right

- **Second Part**

> 6. Load data
> 7. Manipulate Data
> 8. Loops and Restrictions
> 9. Loading Packages
> 10. Plots 

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

--- .segue bg:grey

## Somethings to remember...

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

---

## Somethings to remember:

To understand computations in R, two slogans are helpful:

- **Everything that exists is an object.**
- **Everything that happens is a function call.**

John Chambers

---

## Further basics...

R has many data structures. These include:

> - atomic vector
> - list
> - matrix
> - data frame
> - factors
> - tables

*** =pnotes

Blah

--- .segue bg:grey

## Open a new R Script

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
 
</a>

*** =pnotes
File > New File > R Script

--- .segue bg:grey

## 1.  Vectors

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
 
</a>

*** =pnotes

A Vector is THE basic structure in R.
Most of your data is handled as vectors in R.
Vectors are pretty much the workhorses...

---

## 1.  Vectors | How to create a vector?


```r
vec01 <- 5                        # "<-" is an operator to asign vec01 with 5
vec01
vec02 = c(4,6,7,2)                # c() is short for combine()
vec02
"neolithic" -> vec03 
vec03
```

*** =pnotes

Please decide wether you want to use a script for your exercises or use only the 
console

---

## 1.  Vectors | How to create a vector?


```r
vec01 <- 5                        # "<-" is an operator to asign vec01 with 5
vec01
## [1] 5
vec02 = c(4,6,7,2)                # c() is short for combine()
vec02
## [1] 4 6 7 2
"neolithic" -> vec03 
vec03
## [1] "neolithic"
```

---

## 1.  Vectors | How to create a vector?




































































