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

 1. Vectors
 2. Functions
 3. Operators
 4. Data Frames, Martices & Arrays

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
Tabelle laden und pr체fen ob alle Splaten richtig angelegt sind. ggf. anpassen

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
## 1       3      3 Bettelsb체hl
df[ ,1]
## [1] 3 5 1 2 5 8 5 2
```


--- &twocol

## 2.  Manipulate Data | Subset

*** =left


```r
vec_a[c(3:5)]
## [1] 2 2 5
df[ c(1:3),c(2,3)]
##   Graves         Site
## 1      3 Bettelsb체hl
## 2     10 Mont Lassoir
## 3      6       Kappel
df[3, c(1,3)]
##   Imports   Site
## 3       1 Kappel
# Using subset to change a value
df[3,"Imports"] 
## [1] 1
df[3,"Imports"] <- 1
df[3,"Imports"] 
## [1] 1
```

*** =right


```r
df[c(6,7,8),2] <- NA
df
##   Imports Graves         Site
## 1       3      3 Bettelsb체hl
## 2       5     10 Mont Lassoir
## 3       1      6       Kappel
## 4       2      8        Salem
## 5       5     25 K철nigsb체ck
## 6       8     NA        Seltz
## 7       5     NA  Gie�<U+009F>h체bel
## 8       2     NA   Hohmichele
df$Site
## [1] "Bettelsb체hl" "Mont Lassoir" "Kappel"       "Salem"       
## [5] "K철nigsb체ck" "Seltz"        "Gie�<U+009F>h체bel"  "Hohmichele"
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
##  $ Site   : Factor w/ 8 levels "Bettelsb체hl",..: 1 6 5 7 4 8 2 3
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


```r
ndf_mounds <- merge(df_mounds, ndf, all.x=TRUE, all.y=FALSE, by.x=Nekropole,
                    by.y=site)
## Error in merge(df_mounds, ndf, all.x = TRUE, all.y = FALSE, by.x = Nekropole, : object 'df_mounds' not found
```

---

## 2.  Manipulate Data | Unique 

 

```r
unique(x, incomparables = FALSE, fromLast = FALSE, ...)
```

**... `unique()` returns a vector, data frame or array like x but with duplicate elements/rows removed.**


```r
R <- data.frame(V1 = c(1,1,1), V2 = c(2,2,2), V3 = c("A","A","B"))
unique(R)
##   V1 V2 V3
## 1  1  2  A
## 3  1  2  B
uni_v3 <- unique(R$V3)
uni_v3
## [1] A B
## Levels: A B
```

---

## 2.  Manipulate Data | Unique 


```r
duplicated(x, incomparables = FALSE, fromLast = FALSE, nmax = NA, ...)
```

**... `duplicated()` determines which elements of a vector or data frame are duplicates of elements with smaller subscripts, and returns a logical vector indicating which elements (rows) are duplicates.**


```r
R 
##   V1 V2 V3
## 1  1  2  A
## 2  1  2  A
## 3  1  2  B
duplicated(x = R, fromLast = TRUE)
## [1]  TRUE FALSE FALSE
```

--- .segue bg:grey

## 3.  Loops and Restrictions

--- 

## 3.  Loops and Restrictions

Loops repeat statements


```r
# Loops repeat statements
a <- 1
for (i in 1:20){
a <- a+a
}
```

--- 

## 3.  Loops and Restrictions

Loops repeat statements


```r
# Loops repeat statements
a <- 1
for (i in 1:20){
a <- a+a
}

a
## [1] 1048576
```

--- 

## 3.  Loops and Restrictions


```r
# conditions restrict statements
i <- 1
a <- 1

while (a <55){
a <-a+a
i=i+1
}
```

--- 

## 3.  Loops and Restrictions


```r
# conditions restrict statements
i <- 1
a <- 1

while (a <55){
a <-a+a
i=i+1
}

a
## [1] 64
i
## [1] 7
```

--- 

## 3.  Loops and Restrictions


```r
# conditions restrict statements
if (a>55){
a <- a/2
} else {
a <- a*2
}
```

--- 

## 3.  Loops and Restrictions


```r
# conditions restrict statements
a 
## [1] 32

if (a>55){
a <- a/2
} else {
a <- a*2
}
a
## [1] 64
```

--- 

## 3.  Loops and Restrictions

Loops or Restrictions|**starts**|**Condistions**|**Indside**|**Ends**
------|------|------|------|------
Loop|`for`|`(i in **repetition**)`|`{ result <- **functions to apply**`|`}` in a seperate line
Restrictions|`while`|`(i in **condition**)`|`{ result <- **functions to apply**`|`}` in a seperate line
Restrictions|`if` in combination with `else`|`(i in **condition**)`|`{ result <- **functions to apply**`|`}` in a seperate line
Restrictions|`else`|`(i in **condition**)`|`{ result <- **functions to apply**`|`}` in a seperate line

--- .segue bg:grey

## 4.  Package management

---

## 4.  Package management

Package management:


```r
old.packages()                        # Your currently installed packages

update.packages()                     # Update all Packages
update.packages("package-name")       # Update a specific package
```

Loading Packages:


```r
install.packages("package-name")    # Download and install the named package
```

Using Packages:


```r
library(package-name)               # Loading packages every time you restart R!
```

--- .segue bg:grey

## 5.  Plots

---

##  Exercise 3


```r
# 1. Set your working directory.
# 2. Load gravemound.csv
# 3. Save created Dara Frame of Iron Age graves (Note: This is dummy data!)
# 4. 
# 5.
# 6. Download and load all neccessary packages for our next lectrue.
```


