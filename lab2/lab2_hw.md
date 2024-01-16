---
title: "Lab 2 Homework"
author: "Hugo Mahatdejkul"
date: "2024-01-16"
output:
  html_document: 
    theme: spacelab
    keep_md: true
---

## Instruction
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

1. What is a vector in R?  
A vector in R is just a way of organizing the same data type stored into a variable

2. What is a data matrix in R?  
A data matrix is a list of multiple vectors stored in a stacked manner.

3. Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs. Run this code chunk to create the vectors.  

```r
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

4. Build a data matrix that has the springs as rows and the columns as scientists.  

```r
temp <-c(spring_1,spring_2,spring_3,spring_4,spring_5,spring_6,spring_7,spring_8)
```


```r
Temp_matrix<-matrix(temp,nrow=8,ncol=3)
Temp_matrix
```

```
##       [,1]  [,2]  [,3]
## [1,] 36.25 29.20 30.65
## [2,] 35.40 39.70 29.75
## [3,] 35.30 40.05 32.90
## [4,] 35.15 38.65 32.50
## [5,] 35.35 31.85 32.80
## [6,] 33.35 31.40 36.80
## [7,] 30.70 29.30 36.45
## [8,] 29.65 30.20 33.15
```


5. The names of the springs are 1.Bluebell Spring, 2.Opal Spring, 3.Riverside Spring, 4.Too Hot Spring, 5.Mystery Spring, 6.Emerald Spring, 7.Black Spring, 8.Pearl Spring. Name the rows and columns in the data matrix. Start by making two new vectors with the names, then use `colnames()` and `rownames()` to name the columns and rows.

```r
spring_names<-c("Bluebell spring","opal spring", "Riverside spring", "too hot spring", "mystery spring", "emerald spring","black spring", "pearl spring")
```


```r
scientist_names<-c("Jill","steve","susan")
```


```r
rownames(Temp_matrix)<-spring_names   #rownames(our matrix we want)<- gets the names we assigned to a variable already
colnames(Temp_matrix)<-scientist_names
```


```r
Temp_matrix
```

```
##                   Jill steve susan
## Bluebell spring  36.25 29.20 30.65
## opal spring      35.40 39.70 29.75
## Riverside spring 35.30 40.05 32.90
## too hot spring   35.15 38.65 32.50
## mystery spring   35.35 31.85 32.80
## emerald spring   33.35 31.40 36.80
## black spring     30.70 29.30 36.45
## pearl spring     29.65 30.20 33.15
```

6. Calculate the mean temperature of all eight springs.

```r
mean_temp<-rowMeans(Temp_matrix) #the rowMeans command will give means of each row and we just assign it to a new variable 
mean_temp
```

```
##  Bluebell spring      opal spring Riverside spring   too hot spring 
##         32.03333         34.95000         36.08333         35.43333 
##   mystery spring   emerald spring     black spring     pearl spring 
##         33.33333         33.85000         32.15000         31.00000
```
The mean temp is above

7. Add this as a new column in the data matrix.  

```r
new_matrix<-cbind(Temp_matrix,mean_temp) #cbind(matrix we want, new col we want to add)
new_matrix
```

```
##                   Jill steve susan mean_temp
## Bluebell spring  36.25 29.20 30.65  32.03333
## opal spring      35.40 39.70 29.75  34.95000
## Riverside spring 35.30 40.05 32.90  36.08333
## too hot spring   35.15 38.65 32.50  35.43333
## mystery spring   35.35 31.85 32.80  33.33333
## emerald spring   33.35 31.40 36.80  33.85000
## black spring     30.70 29.30 36.45  32.15000
## pearl spring     29.65 30.20 33.15  31.00000
```


8. Show Susan's value for Opal Spring only.


```r
susan_value<-new_matrix[2,3]
susan_value
```

```
## [1] 29.75
```


9. Calculate the mean for Jill's column only.  

```r
Jill_mean<-new_matrix[,1]
Jill_mean
```

```
##  Bluebell spring      opal spring Riverside spring   too hot spring 
##            36.25            35.40            35.30            35.15 
##   mystery spring   emerald spring     black spring     pearl spring 
##            35.35            33.35            30.70            29.65
```


10. Use the data matrix to perform one calculation or operation of your interest.

```r
steve_median<-median(new_matrix[,2])
steve_median
```

```
## [1] 31.625
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
