## Using loops in R
#################FOR LOOP  ##############
###for loop is used to iterate over a sequence (vector, list, etc.) 
#and execute a block of code for each element in the sequence


#syntax

for (variable in sequence) {
  # Code to be executed for each element
}

##example

for (i in 1:5) {
  square <- i^2
  print(square)
}

for (i in 2:6) {
  cube <- i^3
  print(cube)
}

######  WHILE Loop      ############
##while loop in R continues to execute a block 
#of code as long as a specified condition is true. The syntax is:

while (condition) {
  # Code to be executed as long as the condition is true
}


i <- 1
while (i^2 < 10) {
  square <- i^2
  print(square)
  i <- i + 1
}



number <- 1

while (number^2 <= 50) {
  square_value <- number^2
  print(paste("Square of", number, "is", square_value))  ##The paste() function combines these components 
  number <- number + 1                                   #into a single string, and the result is printed
}                                                        ## using the print() function. 
  


n <- 1
factorial_value <- 1

while (factorial_value <= 1000) {
  factorial_value <- factorial_value * n
  print(paste("Factorial of", n, "is", factorial_value))
  n <- n + 1
}


### loops for dataframe 
data <- lentil_blocked



# Create a new column 'PRODUCT' to store the results
data$results <- numeric(nrow(data)) ##creats a new column named 'results' in the dataframe data 
                                      ##and initializing it with a numeric vector of the same length as 
                                       #the number of rows in the dataframe.data 


# Using a for loop to calculate the product of 'YIELD' and 'NITROGEN'
for (i in 1:nrow(data)) {
  data$results[i] <- data$YIELD[i] * data$NITROGEN[i]
}

print(data)
data

## plots using for loop

# Columns to include in the boxplot
columns_to_plot <- c("YIELD", "NITROGEN", "results")
columns_to_plot

# Create a new window for the boxplot
par(mfrow = c(1, length(columns_to_plot)))  ## create new window with multiple rows 

# Using a for loop to create boxplots for each column
for (col in columns_to_plot) {
  boxplot(data[[col]], main = col, ylab = col)  ##col repersents column
}

## par and mfrow function uses
# Set up a 2x2 layout for multiple plots
par(mfrow = c(1, 4))   ## rows and columns

# Create and plot some example data
plot(1:10, main = "Plot 1")
plot(1:10, main = "Plot 2")
plot(1:10, main = "Plot 3")
plot(1:10, main = "Plot 4")


### while loops

# Create a new column 'PRODUCT' to store the results
data$result <- numeric(nrow(data))

# Initialize a counter
counter <- 1

# Using a while loop to calculate the product of 'YIELD' and 'NITROGEN'
while (counter <= nrow(data)) {
  data$result[counter] <- data$YIELD[counter] * data$NITROGEN[counter]
  counter <- counter + 1
}

# Display the updated dataframe
print(data)



#### loops for SNP data ###

# Set a seed for reproducibility
set.seed(123)

# Number of markers and individuals
num_markers <- 50
num_individuals <- 20

# Generate SNP data (0, 1, or 2) randomly
snp_data <- matrix(sample(0:2, num_markers * num_individuals, replace = TRUE), nrow = num_individuals, ncol = num_markers)

# Convert the matrix to a data frame for better readability
snp_df <- as.data.frame(snp_data)

# Print the generated SNP data
print(snp_df)




set.seed(123)

# defining Function to calculate Minor Allele Frequency (MAF)
calculate_maf <- function(genotypes) {
  allele_freq <- table(genotypes) / length(genotypes)
  maf <- min(allele_freq)
  return(maf)
}


# Function to calculate heterozygotes
calculate_heterozygotes <- function(genotypes) {
  heterozygotes <- sum(genotypes == 1) / sum(genotypes)
  return(heterozygotes)
}

# Function to calculate missing value percentage
calculate_missing_percentage <- function(genotypes) {
  missing_percentage <- sum(is.na(genotypes)) / length(genotypes) * 100
  return(missing_percentage)
}

# Initialize variables to store results
maf_results <- numeric(ncol(snp_df))
heterozygotes_results <- numeric(ncol(snp_df))
missing_percentage_results <- numeric(ncol(snp_df))

# Loop through each column (SNP marker) in the dataframe
for (col in 1:ncol(snp_df)) {
  genotypes <- snp_df[, col]
  
  # Calculate MAF
  maf_results[col] <- calculate_maf(genotypes)
  
  # Calculate heterozygotes
  heterozygotes_results[col] <- calculate_heterozygotes(genotypes)
  
  # Calculate missing value percentage
  missing_percentage_results[col] <- calculate_missing_percentage(genotypes)
}

# Display the results
results_df <- data.frame(
  Marker = colnames(snp_df),
  MAF = maf_results,
  Heterozygotes = heterozygotes_results,
  MissingPercentage = missing_percentage_results
)

print(results_df)




# Example data frame
set.seed(123)  # Setting seed for reproducibility
my_data_frame <- data.frame(
  trial_name = rep(c("A", "B", "C"), each = 30),
  trait1 = rnorm(90, mean = 10, sd = 2),
  trait2 = rnorm(90, mean = 15, sd = 3),
  trait3 = rnorm(90, mean = 20, sd = 4)
)

my_data_frame
# Example trait_wanted vector
trait_wanted <- c("trait1", "trait2", "trait3")

##seq_along is a function that generates a sequence of integers from 1 to the length of a 
##given vector or list. It is commonly used in conjunction with loops to iterate over
## elements of a vector or list.

##seq_along(x) returns a sequence of the same length as the object x.
##It is often used in for loops to iterate over the indices of a vector or list.


# Loop to create box-and-violin plots
for (i in seq_along(trait_wanted)) {
  plot_box <- ggplot(my_data_frame, aes_string(x = "trial_name", y = trait_wanted[i])) +
    geom_violin(trim = FALSE, fill = "red") +
    geom_boxplot(width = 0.2, color = "blue", fill = "orange") +
    coord_cartesian(ylim = c(0, max(my_data_frame[[trait_wanted[i]]], na.rm = TRUE) * 1.2)) +
    theme_minimal() +
    labs(y = trait_wanted[i])
  print(plot_box)
}


## instead of seq along we can use 1:length
## 1:length(x) generates a sequence of integers from 1 to the length of the object x

for (i in 1:length(trait_wanted)) {
  plot_box <- ggplot(my_data_frame, aes_string(x = "trial_name", y = trait_wanted[i])) +
    geom_violin(trim = FALSE, fill = "red") +
    geom_boxplot(width = 0.2, color = "gray") +
    coord_cartesian(ylim = c(0, max(my_data_frame[[trait_wanted[i]]], na.rm = TRUE) * 1.2)) +
    theme_minimal() +
    labs(y = trait_wanted[i])
  print(plot_box)
}



# Example vector
my_vector <- c("apple", "orange", "banana", "grape", "kiwi")

# Using 1:length to iterate over indices
for (i in 1:length(my_vector)) {
  print(paste("Element at index", i, "is:", my_vector[i]))
}







