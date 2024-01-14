rm(list=ls())

## creating and sequwnce and different sequence operations
#seq(from, to, by = increment)

sequence <- seq(1, 10)
print(sequence)


sequence <- seq(0, 20, by = 2)
print(sequence)

sequence <- seq(1, 5, by = 0.5)
print(sequence)

##Generate a sequence with a specified length
sequence <- seq(1, 10, length.out = 5)
print(sequence)

## Generate a sequence along with an existing vector:

existing_vector <- c(2, 5, 8)
sequence <- seq(along.with = existing_vector)
print(sequence)

## REMOVING THE COLUMNS
new_data <- iris[, -c(1, 3)]  # Remove columns 1 and 3

library(dplyr)
new_data <- select(iris, -sw)   ## using dplyr

new_data <- select(iris, -sw)

darare <- iris[-c(1, 3), ]  # Remove rows 1 and 3

# Creating two sample data frames
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(ID = c(2, 3, 4), Age = c(25, 30, 22))

# Merging based on the "ID" column
merged_data <- merge(df1, df2, by = "ID")

# Display the merged data
print(merged_data)


# Load the dplyr package
library(dplyr)

# Creating two sample data frames
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(ID = c(2, 3, 4), Age = c(25, 30, 22))

# Inner join based on the "ID" column
merged_data <- inner_join(df1, df2, by = "ID")

# Display the merged data
print(merged_data)


### different types of joins in R

# Create two sample data frames
df1 <- data.frame(ID = c(1, 2, 3, 4),
                  Name = c("Alice", "Bob", "Charlie", "David"))

df2 <- data.frame(ID = c(2, 3, 4, 5),
                  Age = c(25, 30, 22, 28))
df1
df2
library(dplyr)
inner_merged_data <- inner_join(df1, df2, by = "ID")  ##innerjoin

inner_merged_data

full_merged_data <- full_join(df1, df2, by = "ID")  ##full_join data

full_merged_data

left_merged_data <- left_join(df1, df2, by = "ID")  ##leftjoindata

left_merged_data

right_merged_data <- right_join(df1, df2, by = "ID") #rightjoindata

right_merged_data

unmatched_data <- anti_join(df1, df2, by = "ID")  ##anti_join

unmatched_data

matching_data <- semi_join(df1, df2, by = "ID")  ##semi_join

matching_data


### dealing with missing values in dataframes
# Create a sample dataset (a 3x4 matrix)
my_matrix <- matrix(1:12, nrow = 3, ncol = 4)
rownames(my_matrix) <- c("Row1", "Row2", "Row3")
colnames(my_matrix) <- c("Col1", "Col2", "Col3", "Col4")

# Display the dataset
print("Original Matrix:")
print(my_matrix)

# Calculate column sums
col_sums_result <- colSums(my_matrix)
print(col_sums_result)

# Calculate row sums
row_sums_result <- rowSums(my_matrix)
print(row_sums_result)


# Create a sample dataset with NA values
my_matrix <- matrix(c(1, 4, 7, 10, 2, NA, 8, 11, 3, 6, 9, NA), nrow = 3, ncol = 4)
rownames(my_matrix) <- c("Row1", "Row2", "Row3")
colnames(my_matrix) <- c("Col1", "Col2", "Col3", "Col4")

# Display the dataset
print(my_matrix)

# Create a sample dataset with NA values
my_matrix <- matrix(c(1, 4, 7, 10, 2, NA, 8, 11, 3, 6, 9, NA), nrow = 3, ncol = 4)
rownames(my_matrix) <- c("Row1", "Row2", "Row3")
colnames(my_matrix) <- c("Col1", "Col2", "Col3", "Col4")

# Display the dataset
print(my_matrix)


# Check and count NA values in columns
na_cols <- colSums(is.na(my_matrix))
print(na_cols)

# Check and count NA values in rows
na_rows <- rowSums(is.na(my_matrix))
print(na_rows)


# Create a sample data frame with missing values
my_data <- data.frame(
  Name = c("Alice", "Bob", NA, "David", "Eve"),
  Age = c(25, 30, NA, 22, 28),
  Score = c(90, 85, 78, NA, 95)
)

print(my_data)

# 1. is.na() and !is.na()
is_na_vector <- is.na(my_data)
not_na_vector <- !is.na(my_data)
print(is_na_vector)
print(not_na_vector)

# 2. na.omit()
cleaned_data_omit <- na.omit(my_data)
print(cleaned_data_omit)

# 3. complete.cases()
complete_cases_vector <- complete.cases(my_data)
print(complete_cases_vector)

# 4. na.exclude()
cleaned_data_exclude <- na.exclude(my_data)
print(cleaned_data_exclude)

# 5. na.rm argument in functions
mean_age <- mean(my_data$Age, na.rm = TRUE)
print(mean_age)

# 6. replace()
my_data$Score <- replace(my_data$Score, is.na(my_data$Score), 0)
print(my_data)

# 7. tidyr package functions
library(tidyr)

# Drop rows with NA values
cleaned_data_tidyr <- drop_na(my_data)
print(cleaned_data_tidyr)

# Replace NA values with a specific value
my_data_replaced <- replace_na(my_data, list(Age = 0, Score = 100))
print(my_data_replaced)



# Creating a dataframe with three columns: Name, Age, and City
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 22),
  City = c("New York", "San Francisco", "Los Angeles")
)

# Display the created dataframe
print(data)

data<- iris

## change the cl=olumn names
# Assuming 'your_data' is your dataset
colnames(iris) <- c("SL", 
                    "sw", 
                    "PL",
                    "PW",
                    "SPP")
#changes only the name of the second column in the iris dataset
# Display the original column names
print(colnames(iris))

# Change the name of the second column
colnames(iris)[2] <- "sw"

# Display the updated column names
print(colnames(iris))








