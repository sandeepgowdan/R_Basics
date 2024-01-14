# Clear the entire workspace
rm(list = ls())

getwd()  ##get the working directory
setwd("F:/Statstical Analysis in Plant Breeding")
# Accessing Help in R
help()
help(sd) # Get help about the standard deviation function
help(lapply) ##Apply a Function over a List or Vector
?mean # Get help about the mean function
sd(1:2) ^ 2
?round()

help.search("regression") ## regression
??regression

# Setting a seed number for reproducibility
set.seed(123)
random_numbers <- sample(100:999, 8)
random_numbers

# Creating a sequence of numbers with the seq function
w <- seq(from = 1, to = 100, by = 3)
w

# Working with objects
# Creating a numeric object
x <- c(1, 2, 3, 4, 5)
x

# Checking the class of an object
class(x)

# Creating a character object
x1 <- c("1", "2", "3", "4", "5")
x1
class(x1)

# Removing an object from the workspace
rm(x1)

# Performing basic numeric operations
# Addition
2 + 2

# Subtraction
3 - 4

# Multiplication
4 * 6

# Exponentiation
2^3

# Equality operators
3 == 3

# Greater Than or Equal
4 >= 2
4 >= 5

# Greater than
5 > 1

# Less Than or Equal
7 <= 10

# Not equal
1 != 2

# Working with factors - Converting character vectors into factors
x <- c("A", "B", "A", "C", "A", "C")
class(x)

# Converting into a factor
fx <- factor(x)
fx
class(fx)
levels(fx) # Identifying the levels of the factor vector

# Creating a frequency table
table(fx)

# Accessing specific vector elements with "[ ]"
x <- c(1, 2, 56, 78, 5, 47, 7, 8)

# Accessing the fourth position of vector "x"
x[4]

# Accessing all elements except the fifth
x[-5]

# Accessing the third and sixth elements
x[c(3, 6)]

# Accessing elements from the fifth to eighth
x[5:8]

# Accessing elements greater than 3
x[x > 3]

rm(list = ls())

# Working with matrices
x <- c(1, 2, 3, 4, 5, 6) # Numerical vector
x1 <- c(1.2, 1.3, 1.8, 2.9, 10.5, 0.9) # Numerical vectors
y <- c("Sarah", "Tracy", "Jon", "Marcio", "Felipe", "Matias") # Vector of characters
z <- c(TRUE, TRUE, FALSE, FALSE) # Logical vector

# Creating a matrix from numeric vectors
m1 <- matrix(c(x, x1), 6, 2)
m1

# Working with lists
# Creating a list containing vectors
my_list <- list(x = x, x1 = x1, y = y, z = z)
my_list
names(my_list)
my_list$x1

# Working with dataframes
# Example in Genomics
x <- c("snp1", "snp2", "snp3", "snp4", "snp5", "snp6")
y <- c(1, 1, 2, 2, 3, 3)
z <- c(10, 20, 100, 400, 150, 200)
ind1 <- c("AA", "AA", "aa", "Aa", "aa", "AA")
ind2 <- c("AA", "AA", "aa", "Aa", "AA", "AA")
ind3 <- c("Aa", "AA", "aa", "Aa", "Aa", "aa")
ind4 <- c("aa", "AA", "Aa", "aa", "AA", "AA")

# Creating a dataframe
snp_data <- data.frame(name = x, chr = y, pos = z, ind1, ind2, ind3, ind4)
snp_data

# Getting the dimensions of the dataset
dim(snp_data)

# Subsetting the data [row, col]
snp_data[1,] # Selecting the first row
snp_data[, 4] # Selecting the column for ind1
snp_data[, -2] # Deleting the chr column
snp_data[, 4:7] # Selecting only the columns for individuals

# Subsetting data using the dplyr package
# install.packages("dplyr")
library(dplyr)
snp_data %>% filter(chr == 1) # Selecting only rows where chr equals 1
snp_data %>% filter(chr == 2 & pos == 100) # Selecting rows where chr equals 2 and pos equals 100
snp_data %>% select(name, chr, pos) # Selecting specific columns: name, chr, and pos


# Exercises

x <- c(1, 2, 56, 78, 5, 47, 7, 8)
# Access elements Less Than or Equal 70 in vector "x"
x[x <= 70]

# Access elements not equal to 100
x[x != 100]

# Access elements equal to 47
x[x ==  47]

# Suppose you have a vector x with the following values: "A", "B", "A", "C", 
# "A", "C". Convert this vector into a factor and store it in a variable fx. 
# Then, create a frequency table for fx to count the occurrences of each factor level.

x <- c("A", "B", "A", "C", "A", "C")
class(x)
fx <- factor(x)
class(fx)

# Consider the snp_data dataframe created in the code. Write R code to 
# accomplish the following tasks:

# a. Extract the rows from snp_data where the chromosome (chr) is equal to 2.
#ctr + shift + m
snp_data %>% filter(chr == 2) 

# b. Extract the rows from snp_data where the chromosome (chr) is equal to 3 
# and the position (pos) is equal to 150.
snp_data %>% filter(chr == 3 & pos == 150)

# c. Create a new dataframe snp_subset containing only the columns name, 
# ind1, and ind2 from snp_data.

snp_subset <- snp_data %>% select(ind1, ind2)
snp_subset

##importing data files
 
my_data <- read.csv(file = file, header = TRUE, sep = ",")
?read.csv
my_data <- read.table(file = data,... )

##read the data from the folder
setwd("F:/Statstical Analysis in Plant Breeding")

my_data <- read.csv("data/data_ge.csv", header = TRUE, sep = ",")  ## data is the folder in working directoty and data_ge is file

my_data2 <- read_excel("data/data_ge.xlsx", sheet = 1)

## Write the table or dataframe

data<- data.frame(ID = c(1,2,3), Name = c("sasa", "asa", "dsk"))

write.table(data, "results.txt", sep= "\t", row.names = FALSE)

write.csv(data, "results.CSV", row.names = FALSE)

selected_file <- file.choose() ## select the file 



ggsave(paste0("images\\boxplot_", trial_interest, Sys.Date(), ".png"), 
       plot = plot_bxp, units = "in", dpi = 300, width = 12, height = 10)


# import data from a comma delimited file
Salaries <- read.csv("data/salaries.csv")

# import data from a tab delimited file
Salaries <- read_tsv("data/salaries.txt")


# import data from an Excel workbook
Salaries <- read_excel("data/salaries.xlsx", sheet=1)           

library(haven) ##haven package provides functions for importing data from a variety of statistical packages.

# import data from Stata
Salaries <- read_dta("data/salaries.dta")

# import data from SPSS
Salaries <- read_sav("data/salaries.sav")

# import data from SAS
Salaries <- read_sas("data/salaries.sas7bdat")


library(dplyr)

View(starwars)  ##starwars dataset

# keep the variables name, height, and gender
newdata <- select(starwars, name, height, gender)

# keep the variables name and all variables 
# between mass and species inclusive
newdata <- select(starwars, name, mass:species)

# keep all variables except birth_year and gender
newdata <- select(starwars, -birth_year, -gender)


##The filter function allows you to limit your dataset to observations (rows) meeting a specific criteria.
##Multiple criteria can be combined with the & (AND) and | (OR) symbols.

# select females
newdata <- filter(starwars, 
                  sex == "female")

# Select females from Alderaan using the "sex" column
# Filter females from Alderaan using the "sex" column
newdata2 <- dplyr::filter(starwars, 
                          sex == "female" & 
                            homeworld == "Alderaan")

###generating random numbers
# Syntax: runif(n, min = 0, max = 1)  ### runif() - Random Uniform Distribution:
# Generate 5 random numbers between 0 and 1
random_uniform <- runif(5, min = 0, max = 1)
print(random_uniform)

# Syntax: rnorm(n, mean = 0, sd = 1) #### rnorm() - Random Normal Distribution:
# Generate 5 random numbers from a normal distribution with mean 0 and standard deviation 1
random_normal <- rnorm(5, mean = 0, sd = 1)
print(random_normal)

# Syntax: sample(x, size, replace = FALSE, prob = NULL)  ###sample() - Random Sampling:
# Sample 3 values randomly from the vector
random_sample <- sample(c("A", "B", "C", "D", "E"), size = 3, replace = TRUE)
print(random_sample)


### seq function##
seq(from, to, by, length.out, along.with)
# Generate a sequence from 1 to 10
sequence <- seq(1, 10)
sequence

# Generate a sequence from 0 to 1 with a step size of 0.2
sequence <- seq(0, 1, by = 0.2)
sequence

# Generate a sequence from 1 to 10 with 5 elements
sequence <- seq(1, 10, length.out = 5)
sequence


## sample function##
# Sample 3 values from the set 1 to 10 without replacement
random_sample <- sample(1:10, 3)
random_sample


# Create a vector of numbers from 1 to 5
original_vector <- 1:5
# Sample 5 values with replacement
sampled_values <- sample(original_vector, 5, replace = TRUE)
# Print the result
print(sampled_values)


##table function to calculate the frequency
##table(x)
# Create a vector with categorical data
categories <- c("A", "B", "A", "C", "B", "A", "C", "A")

# Generate a frequency table
freq_table <- table(categories)

# Print the frequency table
print(freq_table)


##sum() function

# Create a vector of numbers
numbers <- c(1, 2, 3, 4, 5)

# Calculate the sum
result_sum <- sum(numbers)

# Print the result
print(result_sum)


### COL AND ROW FUNCTION ###
# Creating a matrix
mat <- matrix(1:6, nrow = 2, ncol = 3)

# Extracting column names
col_names <- colnames(mat)
print(col_names)

# Setting new column names
colnames(mat) <- c("A", "B", "C")
print(mat)


###nrow function in R is used to get the number of rows in a matrix or data frame

num_rows <- nrow(mat)
print(num_rows)


##ncol function in R is used to get the number of columns in a matrix or data
# Getting the number of columns
num_cols <- ncol(mat)
print(num_cols)


##dim function in R is used to get or set the dimensions (number of rows and columns) of an object, 
##such as a matrix or data frame.

# Getting dimensions
dimensions <- dim(mat)
print(dimensions)

# Setting new dimensions
dim(mat) <- c(3, 2)
print(mat)

### The rowSums and colSums functions can be used to calculate the sum of
##each row and column, respectively.
# Creating a matrix
mat <- matrix(c(1, 2, NA, 4, NA, 6, 7, 8, 9), nrow = 3, ncol = 3, byrow = TRUE)

# Sum of each row
row_sums <- rowSums(mat, na.rm = TRUE)
print(row_sums)

# Sum of each column
col_sums <- colSums(mat, na.rm = TRUE)
print(col_sums)


# Counting NAs in each row
na_count_rows <- apply(mat, 1, function(row) sum(is.na(row)))
print(na_count_rows)

# Counting NAs in each column
na_count_cols <- apply(mat, 2, function(col) sum(is.na(col)))
print(na_count_cols)


# Creating a data frame
df <- data.frame(A = c(1, 2, NA), B = c(4, NA, 6), C = c(7, 8, 9))

# Length of each column
col_lengths <- sapply(df, length)
print(col_lengths)

