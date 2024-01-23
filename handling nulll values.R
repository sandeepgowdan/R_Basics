##handling NA values

yield <- runif(10, min = 10, max = 60)
yield

# Generate random numbers with some intentional NA values
df <- c(runif(7, min = 10, max = 60), NA, NA, runif(1, min = 10, max = 60))
gg <- c(runif(3, min = 5, max= 10), NA, NA, NA, NA, runif(3, min= 6, max = 8))


yield <- data.frame(df, gg)
yield
# Assuming your data frame is named 'df'
num_null_values <- sum(is.na(yield))
print(num_null_values)
##specific column
num_null_values1 <- sum(is.na(yield$df))
num_null_values1



# Check if there are any null values in the entire data frame
any_null_values <- any(is.na(yield))
print(any_null_values)

# Check if there are any null values in a specific column (e.g., 'column_name')
any_null_values_column <- any(is.na(yield$df))
print(any_null_values_column)


# Remove rows where the number of null values exceeds a threshold (e.g., 3)
df <- yield[rowSums(is.na(yield)) <= 3, ]
# Remove columns where the number of null values exceeds a threshold (e.g., 5)
df <- yield[, colSums(is.na(yield)) <= 5]


# Remove rows where 'column_name' has null values
neww <- yield[complete.cases(yield$df), ]

# Remove rows where 'column_name' has null values
neww <- yield[complete.cases(yield$df), ]

