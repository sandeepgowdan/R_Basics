function_name <- function(parameter1, parameter2, ...) {
  # Function body - code to be executed
  # It may include statements, calculations, loops, etc.
  
  # Return statement (optional)
  return(result)
}




##define the user definrf functions
my_function <- function(arg1, arg2) {
  result <- arg1 + arg2
  return(result)
}

# usage of the function
result_value <- my_function(3, 5)
print(result_value)




library(dplyr)
complex_function <- function(data_frame) {
# Filter data_frame for specific condition
filtered_data <- data_frame %>%
filter(column_name > 10)
  
# Loop through each row and perform a calculation
result <- numeric(nrow(filtered_data))
for (i in 1:nrow(filtered_data)) {
result[i] <- filtered_data$column_name[i] * 2
 }
  
# Return the final result
return(result)
}

# usage with a sample data frame
sample_data <- data.frame(column_name = c(5, 15, 8, 20))
final_result <- complex_function(sample_data)
print(final_result)

