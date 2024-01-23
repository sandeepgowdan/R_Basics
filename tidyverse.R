rm(list=ls())
## tidyverse and Pipe Operator %>%
# Using the pipe operator
result <- iris %>% 
  select(Sepal.Length, Species) %>% 
  group_by(Species) %>% 
  summarise(avg_length = mean(Sepal.Length))

print (result)

result_2 <- iris %>%
  filter(Sepal.Length > 5 & Petal.Length > 1.5)

library(dplyr)

# Group by Species and calculate the number of individuals in each species
individual_counts <- iris %>%
  group_by(Species) %>%
  summarise(number_of_individuals = n())

# Print the result
print(individual_counts)



new <- apply(iris, 2, function(x) sum(!is.na(x)))

new <- apply(iris, 2, colsums= mean)


new_5 <- iris
  
mean_sepal_length <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal_length = mean(Sepal.Length))
mean_sepal_length



mean_values <- iris %>%
  group_by(Species) %>%
  summarise_all(mean, na.rm = TRUE) %>%
  select(-Species)

mean_values



## summarise function 


# Load the dplyr package
library(dplyr)

# Using the iris dataset
data(iris)

# Example 1: Calculate the mean of Sepal.Length
result_mean_sepal_length <- summarise(iris, mean_sepal_length = mean(Sepal.Length))
print(result_mean_sepal_length)

# Example 2: Grouped summarization - Calculate mean and median for each species
result_grouped <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal_length = mean(Sepal.Length),
            median_sepal_length = median(Sepal.Length))
print(result_grouped)

# Example 3: Multiple summary statistics
result_multiple <- summarise(iris,
                             mean_sepal_length = mean(Sepal.Length),
                             median_sepal_length = median(Sepal.Length),
                             total_count = n())
print(result_multiple)


## group by
# Grouping by 'Species'
iris_grouped <- group_by(iris, Species)
iris_grouped

iris_grouped_multiple <- group_by(iris, Species, Petal.Length)
iris_grouped_multiple



result_combined <- iris %>%
  group_by(Species) %>%
  filter(Sepal.Length > mean(Sepal.Length)) %>%
  summarise(mean_sepal_length = mean(Sepal.Length))
result_combined


##select function
selected_columns <- select(iris, Species, Sepal.Length, Sepal.Width)
selected_columns

##filter
filtered_data <- filter(iris, Sepal.Length > 5 & Species == "setosa")
filtered_data


##arrange 
arranged_data <- arrange(iris, Sepal.Length, desc(Sepal.Width))
arranged_data


##mutate
mutated_data <- mutate(iris, Sepal.Area = Sepal.Length * Sepal.Width)
mutated_data


##distinct
unique_species <- distinct(iris, Species)
unique_species


##rename
renamed_data <- rename(iris, sepal_length = Sepal.Length, sepal_width = Sepal.Width)
renamed_data



# Load required libraries
library(dplyr)

# Using the iris dataset
data(iris)

# Create two modified datasets
iris1 <- iris
iris2 <- iris %>% 
  mutate(Sepal.Width = Sepal.Width + 0.1)  # Modify one column in iris2

# Check if the two data frames have similar dimensions, column names, and row names
dim(iris1)[1] == dim(iris2)[1]  ## row match number of rows
dim(iris1)[2] == dim(iris2)[2]  ## column match number of columns
all(names(iris1) == names(iris2))   ## column names match
all(rownames(iris1) == rownames(iris2)) ## eow names match



