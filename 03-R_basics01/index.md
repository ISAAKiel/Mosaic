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
> 4. Data Frames, Matrices & Arrays

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

---

## Objects anf Functions?!

To understand computations in R, two slogans are helpful:

- **Everything that exists is an object.**
- **Everything that happens is a function call.**

John Chambers

---

## R Data Structure

R has many data structures. These are the most common ones:

> - atomic vector
> - list
> - matrix
> - data frame
> - factors
> - tables

*** =pnotes

Blah

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
vec01 <- 5                        # "<-" asign vec01 with 5

vec02 = c(4,6,7,2)                # c() is short for combine()

"neolithic" -> vec03 
```

*** =pnotes

Please decide wether you want to use a script for your exercises or use only the 
console

---

## 1.  Vectors | How to create a vector?


```r
vec01 <- 5                        # "<-" asign vec01 with 5
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

seq_var <- seq(10)               # seq() is a function!
                           
seq_var <- seq(1, 9, by = 0.1)    # seq("from", "to", by = "steps")

```

---

## 1.  Vectors | How to create a vector?



```r
seq_var <- 1:10
seq_var
##  [1]  1  2  3  4  5  6  7  8  9 10
seq_var <- seq(10)                # seq() is a function!
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

# With the L suffix, you get an integer
int_var <- c(1L, 6L, 10L)
 
# Use TRUE and FALSE (or T and F) 
# to create logical vectors
log_var <- c(TRUE, FALSE, T, F)

# Use " " for character strings
chr_var <- c("these are", "some strings")
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
# Use " " for character strings
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
- character
- complex
- raw
- date

*** =right


```r
# complex vector
cpl_var <-2i+2     

# use 'as.Date()' to create a vector of type Date
d <- as.Date("2016-09-06")

# Raw vectors are used to store 
# fixed-length sequences of bytes.
raw_var <- raw(10)
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
# complex vector
cpl_var <-2i+2     
cpl_var
## [1] 2+2i
# use 'as.Date()' to create a vector of type Date
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

## 1.  Vectors | Choosing parts of a vector


```r
vec_a[c(1:4)]         
## [1] 3 5 2 2
seq_a[c(1,5,7)]
## [1] 1 5 7
chr_var[3]
## [1] "and some"
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
is.numeric()
is.double()
is.integer()
is.logical()
class()
```

---

##  Exercise 1


```r
# Create a new R Script to document your exercises.
# 1. Create some new vectors of type numeric and character (name those vectors meaningfully)
# 2. Use seq() function to create a vector from 5 to 23 with 0,3 steps.
# 3. Combine two numeric vectors to a new vector.
# 4. Combine vectors of different classes.
# 5. Explore properties of your created vectors.
```

--- .segue bg:grey

## 2.  Functions

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

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

## 2.  Functions | How to adapt an unkown function


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

--- &twocol

## 2.  Functions | Some Examples

*** =left


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

*** =right


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

## 2.  Funtion | How to develop your own function?


```r
name_func <- function(parameter1,parameter2){
  output <- "What ever needs to be done"
  return (output)
}

name_func(parameter1,parameter2)
```

--- &twocol

## 2.  Funtion | How to develop your own function?

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

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
 
</a>

--- &twocol

## 3.  Operators | Some basic Operators

*** =left

Arithmetic Operators


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
7 %% 3 # x mod y
## [1] 1
7 %/% 3 # integer division
## [1] 2
```

*** =right

Logical Operators 


```r
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

--- .segue bg:grey

## 4.  Data Frames, Matrices & Arrays 

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="50" width="50" style='position:absolute;top:5%;right:5%' src='assets/img/ISAAK.png' />
</a>

*** =pnotes

As we allready know: a vector store multiple elements in a one dimensional array
Now we will continue with matrices and arrays as further basic object in R

---

## 4. Data Frames, Matrices & Arrays | Matrices

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

## 4. Data Frames, Matrices & Arrays | Array

**An Array stores multiple elements in more than two dimensions.**

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

## 4. Data Frames, Matrices & Arrays | What are Data Frames for?

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

## 4. Data Frames, Matrices & Arrays | Data Frame

**A Data Frame combines different data types.**

```r
nam_s <- c("Bettelsbuehl", "Mont Lassoir", "Kappel", "Salem", "Koenigsbueck", 
           "Seltz", "Giesshuebel", "Hohmichele")

df <- data.frame(vec_a, seq_a, nam_s)
class(df)
## [1] "data.frame"
str(df)
## 'data.frame':	8 obs. of  3 variables:
##  $ vec_a: num  3 5 2 2 5 8 5 2
##  $ seq_a: int  1 2 3 4 5 6 7 8
##  $ nam_s: Factor w/ 8 levels "Bettelsbuehl",..: 1 6 4 7 5 8 2 3
```

---

## 4. Data Frames, Matrices & Arrays | Data Frame

**A data frame is a two diomensional group of R objects.**

```r
df
##   vec_a seq_a        nam_s
## 1     3     1 Bettelsbuehl
## 2     5     2 Mont Lassoir
## 3     2     3       Kappel
## 4     2     4        Salem
## 5     5     5 Koenigsbueck
## 6     8     6        Seltz
## 7     5     7  Giesshuebel
## 8     2     8   Hohmichele
```

*** =pnotes
Here we see some thing funny: Our sites are no character strings, but a factor!

---

## 4. Data Frames, Matrices & Arrays | Factors

**Factors are special vectors that represent categorical/nominal data.**

```r
df$nam_s
## [1] Bettelsbuehl Mont Lassoir Kappel       Salem        Koenigsbueck
## [6] Seltz        Giesshuebel  Hohmichele  
## 8 Levels: Bettelsbuehl Giesshuebel Hohmichele Kappel ... Seltz
str(df$nam_s)
##  Factor w/ 8 levels "Bettelsbuehl",..: 1 6 4 7 5 8 2 3
df$nam_s <- as.character(df$nam_s)
df$nam_s
## [1] "Bettelsbuehl" "Mont Lassoir" "Kappel"       "Salem"       
## [5] "Koenigsbueck" "Seltz"        "Giesshuebel"  "Hohmichele"
str(df$nam_s)
##  chr [1:8] "Bettelsbuehl" "Mont Lassoir" "Kappel" "Salem" ...
```


*** =pnotes
Factors can be ordered or unordered and are important when for modelling functions such as lm() and glm() and also in plot methods.
Factors can only contain pre-defined values.
Factors are pretty much integers that have labels on them. While factors look (and often behave) like character vectors, they are actually integers under the hood, and you need to be careful when treating them like strings. Some string methods will coerce factors to strings, while others will throw an error.

---

## 4. Data Frames, Matrices & Arrays | Factors


```r
x <- factor(c("settlement", "grave", "settlement", "settlement", "grave"))
x
## [1] settlement grave      settlement settlement grave     
## Levels: grave settlement
as.character(x)
## [1] "settlement" "grave"      "settlement" "settlement" "grave"


y <- factor(c("grave", "grave", "settlement"), levels = c("settlement", "grave"))
y
## [1] grave      grave      settlement
## Levels: settlement grave
```

--- &twocol

## 4. Data Frames, Matrices & Arrays | Data Frame

*** =left
You can name elements of a R objects while creating them or using `names()`.


```r
ndf <- data.frame(Imports = vec_a, 
                  Graves = seq_a, 
                  Site = nam_s)
ndf
##   Imports Graves         Site
## 1       3      1 Bettelsbuehl
## 2       5      2 Mont Lassoir
## 3       2      3       Kappel
## 4       2      4        Salem
## 5       5      5 Koenigsbueck
## 6       8      6        Seltz
## 7       5      7  Giesshuebel
## 8       2      8   Hohmichele
```

*** =right


```r
names(df) <- c("Imports", "Graves", "Site")
df
##   Imports Graves         Site
## 1       3      1 Bettelsbuehl
## 2       5      2 Mont Lassoir
## 3       2      3       Kappel
## 4       2      4        Salem
## 5       5      5 Koenigsbueck
## 6       8      6        Seltz
## 7       5      7  Giesshuebel
## 8       2      8   Hohmichele
```


---

## Summary | Objects in R

**Obejct**|**Create**|**change to**|**check**|**get names**|**get dimensions**
------|------|------|------|------|------
vector|`c()` or `vector()`|`as.vector`|`is.vector`|`names()`|`lenght()`
matrix|`matrix()`|`as.matrix`|`is.matrix`|`rownames()` or `colnames()`|`dim()`, `nrow()`or `ncol()`
array|`array()`|`as.array`|`is.array`|`dimnames()`|`dim()`
list|`list()`|`as.list`|`is.list`|`names()`|`lenght()`
data frame|`data.frame()`|`as.data.frame()`|`is.data.frame`|`names()`|`dim()`, `nrow()`or `ncol()`

--- &twocol

## Summary | Operators

*** =left

Arithmetic Operators

**Operator**|Description
------|------
+|addition
-|subtraction
*|multiplication
/|division
^ or **|exponentiation
x %% y|modulus (x mod y) 5%%2 is 1
x %/% y|integer division 5%/%2 is 2 

*** =right

Logical Operators 

**Operator**|Description
------|------
<|less than
<=|less than or equal to
>|greater than
>=|greater than or equal to
==|exactly equal to
!=|not equal to
!x|Not x
x | y|x OR y
x & y|x AND y
isTRUE(x)|test if X is TRUE 

---

##  Exercise 2


```r
# Create a new section in your exercise script.
# 1. Use your existing vectors to create a Matirx and transpond it.
# 2. Use your existing vectors to create an array and explore this array.
# 3. Create a data frame using your vectors.
# 4. Explore your data frame.
# 5. Rename all columns of your data frame and save this as a new object.
# 6. Explore function "as.numeric/etc".
```

---

<a class="btn btn-primary btn-large" href='https://isaakiel.github.io/index.html'>
 <img  height="300" width="300" style='position:absolute;top:20%;right:35%' src='assets/img/ISAAK.png' />
 
</a>
