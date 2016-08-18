---
title       : R basics
subtitle    : Getting started 
author      : Franziska Faupel
job         : MOSaIC
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

<div style='position:absolute;top:5%;right:5%'>
    <img  height="100" width="100" src='assets/img/Rlogo.png' />
</div>

--- .segue bg:grey

## Something to remember...

---

## Something to remember:

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

*** =pnotes
File > New File > R Script

--- .segue bg:grey

## 1.  Vectors

*** =pnotes

A Vector is THE basic structure in R.
Most of your data is handled as vectors in R.
Vectoris are pretty much the workhorses...

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



```r
seq_var <- 1:10
seq_var
seq_var <- seq(10)                # sep() is a function!
seq_var
seq_var <- seq(1, 9, by = 0.1)    # seq("from", "to", by = "steps")
seq_var
```

---

## 1.  Vectors | How to create a vector?



```r
seq_var <- 1:10
seq_var
##  [1]  1  2  3  4  5  6  7  8  9 10
seq_var <- seq(10)                # sep() is a function!
seq_var
##  [1]  1  2  3  4  5  6  7  8  9 10
seq_var <- seq(1, 9, by = 0.1)    # seq("from", "to", by = "steps")
seq_var
##  [1] 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6
## [18] 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3
## [35] 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0
## [52] 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7
## [69] 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0
```

--- &twocol

## 1.  Vectors | Atomic Vectors

*** =left

- numeric
       - logical
       - integer
       - double
- character
- complex
- raw
- date

*** =right


```r
dbl_var <- c(4,6,7,2)     
dbl_var
# With the L suffix, you get an integer
int_var <- c(1L, 6L, 10L)
int_var 
# Use TRUE and FALSE (or T and F) 
# to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
log_var
chr_var <- c("these are", "some strings")
chr_var
```

--- &twocol

## 1.  Vectors | Atomic Vectors

*** =left

- numeric
       - logical
       - integer
       - double
- charackter
- complex
- raw
- date

*** =right


```r
dbl_var <- c(4,6,7,2)     
dbl_var
## [1] 4 6 7 2
# With the L suffix, you get an integer
int_var <- c(1L, 6L, 10L)
int_var 
## [1]  1  6 10
# Use TRUE and FALSE (or T and F) 
# to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
log_var
## [1]  TRUE FALSE  TRUE FALSE
chr_var <- c("these are", "some strings")
chr_var
## [1] "these are"    "some strings"
```

--- &twocol

## 1.  Vectors | Atomic Vectors

*** =left

- numeric
       - logical
       - integer
       - double
- charackter
- complex
- raw
- date

*** =right


```r
cpl_var <-2i+2     
cpl_var

d <- as.Date("2016-09-06")
d
# Raw vectors are used to store 
# fixed-length sequences of bytes.
raw_var <- raw(10)
raw_var
```

--- &twocol

## 1.  Vectors | Atomic Vectors

*** =left

- numeric
       - logical
       - integer
       - double
- charackter
- complex
- raw
- date

*** =right


```r
cpl_var <-2i+2     
cpl_var
## [1] 2+2i

d <- as.Date("2016-09-06")
d
## [1] "2016-09-06"
# Raw vectors are used to store 
# fixed-length sequences of bytes.
raw_var <- raw(10)
raw_var
##  [1] 00 00 00 00 00 00 00 00 00 00
```

--- 

## 1.  Vectors | Atomic Vectors

Atomic vectors are always flat, even if you nest **c()**’s:


```r
c(1, c(2, c(3, 4)))
## [1] 1 2 3 4

# the same as
c(1, 2, 3, 4)
## [1] 1 2 3 4
```

---

## 1.  Vectors | Adding elements to existing vectors


```r
dbl_var
## [1] 4 6 7 2
dbl_var <- c(dbl_var,8,7,1)
dbl_var
## [1] 4 6 7 2 8 7 1
chr_var 
## [1] "these are"    "some strings"
chr_var  <- c(chr_var, "and some", "more strings")
chr_var 
## [1] "these are"    "some strings" "and some"     "more strings"
```

---

## 1.  Vectors | Checking details of a vector


```r
dbl_var
typeof(dbl_var)  # What is it?
length(dbl_var)  # How long is it?
attributes(dbl_var)  # Does it have any metadata?
d
attributes(d) 
```

---

## 1.  Vectors | Checking details of a vector


```r
dbl_var
## [1] 4 6 7 2 8 7 1
typeof(dbl_var)  # What is it?
## [1] "double"
length(dbl_var)  # How long is it?
## [1] 7
attributes(dbl_var)  # Does it have any metadata?
## NULL
d
## [1] "2016-09-06"
attributes(d) 
## $class
## [1] "Date"
```


--- 

## 1.  Vectors | Atomic Vectors

How to check vector types?


```r
is.atomic()
is.character()
is.double()
is.integer()
is.logical()
class()
```

---

##  Exercise 1


```r
# Create a new R Script to document your exercises.
# 1. Create some new vectors of typ numeric and character (name those vectors meaningfully)
# 2. Use seq() function to create a vector from 5 to 23 with 0,3 steps.
# 3. Combine two numeric vectors to a new vector.
# 4. Combine vectors of different classes.
# 5. Explore properties of your created vectors.
```

--- .segue bg:grey

## 2.  Functions

*** =pnotes
In programming, a named section of a program that performs a specific task. In this sense, a function is a type of procedure or routine. Some programming languages make a distinction between a function, which returns a value, and a procedure, which performs some operation but does not return a value.

Most programming languages come with a prewritten set of functions that are kept in a library. You can also write your own functions to perform specialized tasks.

The term function is also used synonymously with operation and command. For example, you execute the delete function to erase a word.
http://www.webopedia.com/TERM/F/function.html
---

## 2.  Functions


```r
vec_a <- c(3,5,2,2,5,8,5,2)             # Function: c()
seq_a <- seq(along=vec_a)               # Function: seq()
rep01 <- rep(3,5)                       # Function: rep("value", "count")
min(vec_a)                              # Function: min("vector")
range(vec_a)                            # Function: range("vector")
length(vec_a)                           # Function: length("vector")
vec_s <- sort(vec_a)                    # Function: sort("vector")
vec_r <- rev(vec_a)                     # Function: rev("vector")
vec_rs <- rev(sort(vec_a))              # Nested funtions!
```

--- 

## 2.  Functions | How to adapte an unkown funtion


```r
# Use implemented help function
help(round)
?round
```

--- 

## 2.  Functions | Help?!

<div style='position:absolute;bottom:10%;right:15%'>
<img  height="500" width="750" src='assets/img/RStudio_help.png' />
</div>


---

## 2.  Functions | Some Examples


```r
vec_a <- c(3,5,2,2,5,8,5,2)
seq_a <- seq(along=vec_a)
seq_a
## [1] 1 2 3 4 5 6 7 8
rep01 <- rep(3,5)
rep01
## [1] 3 3 3 3 3
min(vec_a)
## [1] 2
range(vec_a)
## [1] 2 8
```

--- 

## 2.  Functions | Some Examples


```r
length(vec_a)
## [1] 8
vec_s <- sort(vec_a)
vec_s
## [1] 2 2 2 3 5 5 5 8
vec_r <- rev(vec_a)
vec_r
## [1] 2 5 8 5 2 2 5 3
vec_rs <- rev(sort(vec_a))
vec_rs
## [1] 8 5 5 5 3 2 2 2
```

---

## 2.  Funtion | How to develope your own function?


```r
name_func <- function(parameter1,parameter2){
  output <- "What ever needs to be done"
  return (output)
}

name_func(vec_a, vec_b)
```

--- &twocol

## 2.  Funtion | How to develope your own function?

*** =left

One simple function...


```r
myfunc <- function(a,b){
  res_myfunc <- a*b
  return(res_myfunc)
}

myfunc(2,4)
```

*** =right

This is how it works...


```r
myfunc <- function(a,b){
  res_myfunc <- a*b
  return (res_myfunc)
}

myfunc(2,4)
## [1] 8
```

--- .segue bg:grey

## 3.  Operators

---

## 3.  Operators | Some basic Operators


```r
2 + 5 # addition
## [1] 7
4 - 2 # substraction
## [1] 2
2 * 5 # muliplication
## [1] 10
8 / 2 # division
## [1] 4
5^2 # exponentiate
## [1] 25
2 ** 5 # exponentiate
## [1] 32
```

--- &twocol

## 3.  Operators

*** =left


```r
7 %% 3 # x mod y
## [1] 1
7 %/% 3 # integer division
## [1] 2
2 < 5  # x smaler as y
## [1] TRUE
2 > 5 # x bigger as y
## [1] FALSE
2 == 5 # x equal to y
## [1] FALSE
2 != 5 # x unequal to y
## [1] TRUE
(2 < 5) | (2 > 5) # "or"
## [1] TRUE
(2 < 5) & (2 > 5) # "and"
## [1] FALSE
```

*** =right


```r
vec_a[c(1:4)]
## [1] 3 5 2 2
seq_a[c(1:4)]
## [1] 1 2 3 4
vec_a[c(1:4)] >= seq_a[c(1:4)]
## [1]  TRUE  TRUE FALSE FALSE
vec_a[c(1:4)] <= seq_a[c(1:4)]
## [1] FALSE FALSE  TRUE  TRUE
com <- vec_a[c(1:4)] == seq_a[c(1:4)]
vec_b <- vec_a * seq_a
vec_b
## [1]  3 10  6  8 25 48 35 16
```

--- .segue bg:grey

## 4.  Data Frames, Martices & Arrays 

*** =pnotes

As we allready know: a vector store multiple elements in a one dimensional array
Now we will continue with matrices and arrays as further basic object in R

---

## 4. Data Frames, Martices & Arrays | Matrices

**A Matrix stores multiple elements in a two dimensional array.**


```r
mat <- matrix(vec_a, nrow=2)        # matrix(data, nrow = rows, ncol = cols)
mat
##      [,1] [,2] [,3] [,4]
## [1,]    3    2    5    5
## [2,]    5    2    8    2
mat_t <- t(mat)
mat_t
##      [,1] [,2]
## [1,]    3    5
## [2,]    2    2
## [3,]    5    8
## [4,]    5    2
```


---

## 4. Data Frames, Martices & Arrays | Array

**An Array stores multiple elements in more then two dimensions.**

```r
arr <- array(vec_a, dim=(c(2,2,3)))   # array(data, dim, dimnames)
arr
## , , 1
## 
##      [,1] [,2]
## [1,]    3    2
## [2,]    5    2
## 
## , , 2
## 
##      [,1] [,2]
## [1,]    5    5
## [2,]    8    2
## 
## , , 3
## 
##      [,1] [,2]
## [1,]    3    2
## [2,]    5    2
```

---

## 4. Data Frames, Martices & Arrays | What are Data Frames for?

**Vectors, Matrices and Arrays can't include different data types.**


```r
mat <- matrix(c(vec_a[1:4], chr_var), nrow=2)       
mat
##      [,1] [,2] [,3]           [,4]          
## [1,] "3"  "2"  "these are"    "and some"    
## [2,] "5"  "2"  "some strings" "more strings"
class(mat)
## [1] "matrix"
is.numeric(mat)
## [1] FALSE
is.character(mat)
## [1] TRUE
```

*** =pnotes
A Matrix can either be character or numeric. It is not possible to combines 
these different data types.

---

## 4. Data Frames, Martices & Arrays | Data Frame

**A Data Frame combines different data types.**

```r
nam_s <- c("Bettelsbühl", "Mont Lassoir", "Kappel", "salem", "Königsbück", 
           "seltz", "Giesshübel", "Hohmichele")

df <- data.frame(vec_a, vec_b, nam_s)
class(df)
## [1] "data.frame"
str(df)
## 'data.frame':	8 obs. of  3 variables:
##  $ vec_a: num  3 5 2 2 5 8 5 2
##  $ vec_b: num  3 10 6 8 25 48 35 16
##  $ nam_s: Factor w/ 8 levels "Bettelsbühl",..: 1 6 5 7 4 8 2 3
```

---

## 4. Data Frames, Martices & Arrays | Data Frame

**A data frame is a two diomensional group of R objects.**

```r
df
##   vec_a vec_b        nam_s
## 1     3     3 Bettelsbühl
## 2     5    10 Mont Lassoir
## 3     2     6       Kappel
## 4     2     8        salem
## 5     5    25 Königsbück
## 6     8    48        seltz
## 7     5    35  Giesshübel
## 8     2    16   Hohmichele
```

---

## 4. Data Frames, Martices & Arrays | Data Frame & Factors

**A Data Frame combines different data types.**

```r
nam_s <- c("Bettelsbühl", "Mont Lassoir", "Kappel", "Salem", "Königsbück", 
           "Seltz", "Gießhübel", "Hohmichele")

df <- data.frame(vec_a, vec_b, nam_s)
class(df)
## [1] "data.frame"
str(df)
## 'data.frame':	8 obs. of  3 variables:
##  $ vec_a: num  3 5 2 2 5 8 5 2
##  $ vec_b: num  3 10 6 8 25 48 35 16
##  $ nam_s: Factor w/ 8 levels "Bettelsbühl",..: 1 6 5 7 4 8 2 3
```

*** =pnotes
Here we see some thing funny: Our sites are no character strings, but a factor!

---

## 4. Data Frames, Martices & Arrays | Factors

**Factors are special vectors that represent categorical data.**

```r
df$nam_s
## [1] Bettelsbühl Mont Lassoir Kappel       Salem        Königsbück
## [6] Seltz        Gie�<U+009F>hübel  Hohmichele  
## 8 Levels: Bettelsbühl Gie�<U+009F>hübel Hohmichele Königsbück ... Seltz
str(df$nam_s)
##  Factor w/ 8 levels "Bettelsbühl",..: 1 6 5 7 4 8 2 3
df$nam_s <- as.character(df$nam_s)
df$nam_s
## [1] "Bettelsbühl" "Mont Lassoir" "Kappel"       "Salem"       
## [5] "Königsbück" "Seltz"        "Gie�<U+009F>hübel"  "Hohmichele"
str(df$nam_s)
##  chr [1:8] "Bettelsbühl" "Mont Lassoir" "Kappel" "Salem" ...
```


*** =pnotes
Factors can be ordered or unordered and are important when for modelling functions such as lm() and glm() and also in plot methods.
Factors can only contain pre-defined values.
Factors are pretty much integers that have labels on them. While factors look (and often behave) like character vectors, they are actually integers under the hood, and you need to be careful when treating them like strings. Some string methods will coerce factors to strings, while others will throw an error.

---

## 4. Data Frames, Martices & Arrays | Factors


```r
x <- factor(c("settlement", "grave", "settlement", "settlement", "grave"))
x
## [1] settlement grave      settlement settlement grave     
## Levels: grave settlement
x <- as.character(x)
x
## [1] "settlement" "grave"      "settlement" "settlement" "grave"

y <- factor(c("grave", "grave", "settlement"), levels = c("settlement", "grave"))
y
## [1] grave      grave      settlement
## Levels: settlement grave
```

--- &twocol

## 4. Data Frames, Martices & Arrays | Data Frame

*** =left
You can name elements of a R objects while creating them or using `names()`.


```r
ndf <- data.frame(Imports = vec_a, 
                  Graves = vec_b, 
                  Site = nam_s)
ndf
##   Imports Graves         Site
## 1       3      3 Bettelsbühl
## 2       5     10 Mont Lassoir
## 3       2      6       Kappel
## 4       2      8        Salem
## 5       5     25 Königsbück
## 6       8     48        Seltz
## 7       5     35  Gie�<U+009F>hübel
## 8       2     16   Hohmichele
```

*** =right


```r
names(df) <- c("Imports", "Graves", "Site")
df
##   Imports Graves         Site
## 1       3      3 Bettelsbühl
## 2       5     10 Mont Lassoir
## 3       2      6       Kappel
## 4       2      8        Salem
## 5       5     25 Königsbück
## 6       8     48        Seltz
## 7       5     35  Gie�<U+009F>hübel
## 8       2     16   Hohmichele
```

---

## Summary | Objects in R

> - Vectors
> - Matrices
> - Arrays
> - Lists
> - Data Frames

---

## Summary | Helper Functions

**Obejct**|**Create**|**change to**|**check**|**get names**|**get dimensions**
------|------|------|------|------|------
vector|`c()` or `vector()`|`as.vector`|`is.vector`|`names()`|`lenght()`
matirx|`matrix()`|`as.matrix`|`is.matrix`|`rownames()` or `colnames()`|`dim()`, `nrow()`or `ncol()`
array|`array()`|`as.array`|`is.array`|`dimnames()`|`dim()`
list|`list()`|`as.list`|`is.list`|`names()`|`lenght()`
data frame|`data.frame()`|`as.data.frame()`|`is.data.frame`|`names()`|`dim()`, `nrow()`or `ncol()`


---

##  Exercise 2


```r
# Create a new section in your exercise script
# 1. Use your existing vectors to create a Matirx and transpond it.
# 2. Use your existing vectors to create an array and explore this array.
# 3. Create a data frame using your vectors.
# 4. Explore your data frame.
# 5. Rename all columns of your data frame and save this as a new object.
# 6. Explore function "as.numeric/etc".
```


--- .segue bg:grey

## **Second Part**

--- .segue bg:grey

## 1.  Load Data

---

## 1.  Load Data | Where is your project at home?

<div style='position:absolute;bottom:10%;right:15%'>
<img  height="500" width="750" src='assets/img/RStudio_wd.png' />
</div>

---

## 1.  Load Data | Where is your project at home?


```r
wd <- "C:\\Folder\\Subfolder\\SubSubFolder"
setwd(wd)   

wd <- "/home/xxx/subFolder/SubSubFolder"
setwd(wd)

```

---

## 1.  Load Data | Save your current environement

<div style='position:absolute;bottom:10%;right:15%'>
<img  height="500" width="750" src='assets/img/RStudio_ws.png' />
</div>

---

## 1.  Load Data | Save your current environement

```r
save.image("7ws/name01.rws")
load("7ws/name01.rws")
```

---

## 1.  Load Data | Loading a Data Table


```r
df_mounds <- read.table('2data/gravemounds.csv', header=TRUE)
## Warning in file(file, "rt"): cannot open file '2data/gravemounds.csv': No
## such file or directory
## Error in file(file, "rt"): cannot open the connection

filename <- "2data/gravemounds02.csv"

write.table(df_mounds, file = filename, append = FALSE, quote = FALSE,
sep = ";", eol = "\n", na = "NA", dec = ".", row.names = TRUE, col.names = TRUE)
## Error in is.data.frame(x): object 'df_mounds' not found
```

---

## 1.  Load Data | Loading a Data Table

*** =pnotes
Tabelle laden und prüfen ob alle Splaten richtig angelegt sind. ggf. anpassen

---

## 1.  Load Data | Tidy Data


```r
df_BA <- subset(df_mounds, variable=="colour")
## Error in subset(df_mounds, variable == "colour"): object 'df_mounds' not found
df_BA_INH <- subset(df_mounds, variable=="diameter" |variable=="length")
## Error in subset(df_mounds, variable == "diameter" | variable == "length"): object 'df_mounds' not found
str(df_BA_INH)
## Error in str(df_BA_INH): object 'df_BA_INH' not found
```


--- .segue bg:grey

## 2.  Manipulate Data

---

## 2.  Manipulate Data | Subset


```r
vec_a[4]
## [1] 2
vec_a[3]
## [1] 2
df[1,]
##   Imports Graves         Site
## 1       3      3 Bettelsbühl
df[ ,1]
## [1] 3 5 2 2 5 8 5 2
```


--- &twocol

## 2.  Manipulate Data | Subset

*** =left


```r
vec_a[c(3:5)]
## [1] 2 2 5
df[ c(1:3),c(2,3)]
##   Graves         Site
## 1      3 Bettelsbühl
## 2     10 Mont Lassoir
## 3      6       Kappel
df[3, c(1,3)]
##   Imports   Site
## 3       2 Kappel
# Using subset to change a value
df[3,"Imports"] 
## [1] 2
df[3,"Imports"] <- 1
df[3,"Imports"] 
## [1] 1
```

*** =right


```r
df[c(6,7,8),2] <- NA
df
##   Imports Graves         Site
## 1       3      3 Bettelsbühl
## 2       5     10 Mont Lassoir
## 3       1      6       Kappel
## 4       2      8        Salem
## 5       5     25 Königsbück
## 6       8     NA        Seltz
## 7       5     NA  Gie�<U+009F>hübel
## 8       2     NA   Hohmichele
df$Site
## [1] "Bettelsbühl" "Mont Lassoir" "Kappel"       "Salem"       
## [5] "Königsbück" "Seltz"        "Gie�<U+009F>hübel"  "Hohmichele"
```

---

## 2.  Manipulate Data | Subset

**vector[...]**

**df[ row , col ]**

**subset**|**effect**|Example
------|------|------
positive integer|returns **specified** elements|`c(1,3:4)` or `2`
negative integer|returns **all other** elements|`c(-1,-3:4)` or `-2`
blank spaces| returns **all**
names|return those with **specific names**|`c("name", "type")` or `"name"`
logical|returns elements, that corresponds to **TRUE**|`c(TRUE, FALSE)` or `TRUE`

---

## 2.  Manipulate Data | Combine Data Frames


```r
merge(x, y, by = intersect(names(x), names(y)),
      by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all,
      sort = TRUE, suffixes = c(".x",".y"),
      incomparables = NULL, ...)
```

---

## 2.  Manipulate Data | Combine Data Frames


```r
str(ndf)
## 'data.frame':	8 obs. of  3 variables:
##  $ Imports: num  3 5 2 2 5 8 5 2
##  $ Graves : num  3 10 6 8 25 48 35 16
##  $ Site   : Factor w/ 8 levels "Bettelsbühl",..: 1 6 5 7 4 8 2 3
str(df_mounds)
## Error in str(df_mounds): object 'df_mounds' not found
```

---

## 2.  Manipulate Data | Combine Data Frames


```r
cbind(x,y) # Combines data frames columnwise
rbind(x,y) # Combines data frames rowwise
```

*** =pnotes

If there are several matrix arguments, they must all have the same number of columns (or rows) and this will be the number of columns (or rows) of the result. If all the arguments are vectors, the number of columns (rows) in the result is equal to the length of the longest vector. Values in shorter arguments are recycled to achieve this length (with a warning if they are recycled only fractionally).

---

## 2.  Manipulate Data | Combine Data Frames


```r
cbind(df_mounds, ndf) 
## Error in cbind(df_mounds, ndf): object 'df_mounds' not found
```

---

## 2.  Manipulate Data | Combine Data Frames


```r
rbind(df_mounds, ndf)
## Error in rbind(df_mounds, ndf): object 'df_mounds' not found
```

---

## 2.  Manipulate Data | Merge Data Frames































