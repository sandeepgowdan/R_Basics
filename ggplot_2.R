
rm(list = ls())   ## clean the worksapce

set.seed(123)
my_data <- data.frame(
  height = rnorm(100),
  weight = rnorm(100),
  group = sample(c("A", "B"), 100, replace = TRUE)
)

my_data

library(ggplot2)
ggplot(data =my_data, 
       mapping = aes(x= height, y= weight, color=group))+
  geom_point(color = "red", ##color of the dots
             shape = 8,  ## shape of the dots
             alpha = 0.8, ## color brightness/transparebcy
             size = 2) + ##size of dots
  geom_smooth(method = "lm",
              se = TRUE, ##adds the shaded area to the lines
              size = NULL , 
              linetype = 1,  ## width of the line
              linewidth = 2)+ ##width of the line
  labs(title = "Relationship between height and weight",
       subtitle = "US Census Data 2013",
       caption = "source: https://gauaban.abahan.com",
       x = " height (cm)",
       y = "weight (g)",
       color = "group")+
  
  #facet_wrap(~group)+
  facet_wrap(~group, scales = "free",   ## adds scales to each small graph
             strip.position = "bottom")  ## adds the group names to bottom

#theme_minimal() ##+ theme_classic() + + theme_light() + theme_dark() + + theme_void()


theme(
  axis.title.x = element_text(color = "blue"), ## change color of x and y axis
  axis.title.y = element_text(color = "red"),
  plot.title = element_text(size = 15))




# Generate some sample data
set.seed(123)
data <- data.frame(
  values = rnorm(100),
  category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Load ggplot2 library
library(ggplot2)

# Histogram using ggplot2
ggplot(data, aes(x = values, fill = category)) +
  geom_histogram(binwidth = 0.5, position = "dodge", color = "red", alpha = 0.9) +
  labs(title = "Histogram", x = "Values", y = "Frequency") +
  theme_minimal()+
  theme(
    plot.title = element_text(hjust = 0.5, size = 15))

# Line chart using ggplot2
ggplot(data, aes(x = seq_along(values), y = values, group = category, color = category)) +
  geom_line(alpha = 6,
            linetype =4) +
  labs(title = "Line Chart", x = "Index", y = "Values") +
  theme_minimal()





url <- "https://tinyurl.com/mtktm8e5"
insurance <- read.csv(url)

# create an obesity variable
insurance$obese <- ifelse(insurance$bmi >= 30, 
                          "obese", "not obese")

# specify dataset and mapping
library(ggplot2)
ggplot(data = insurance,
       mapping = aes(x = age, y = expenses))

# add points
ggplot(data = insurance,
       mapping = aes(x = age, y = expenses)) +
  geom_point()

# make points blue, larger, and semi-transparent
ggplot(data = insurance,
       mapping = aes(x = age, y = expenses)) +
  geom_point(color = "cornflowerblue",
             alpha = 0.8, ## color brightness/transparebcy
             size = 2) ##size of dots

# add a line of best fit.
ggplot(data = insurance,
       mapping = aes(x = age, y = expenses)) +
  geom_point(color = "cornflowerblue",
             alpha = .5,
             size = 2) +
  geom_smooth(method = "lm")



# indicate sex using color
ggplot(data = insurance,
       mapping = aes(x = age, 
                     y = expenses,
                     color = smoker)) +
  geom_point(alpha = .5,
             size = 2) +
  geom_smooth(method = "lm", 
              se = TRUE, ## to include shaded arera around lines
              size = 0.8) ## size of lines


# modify the x and y axes and specify the colors to be used
ggplot(data = insurance,
       mapping = aes(x = age, 
                     y = expenses,
                     color = smoker)) +
  geom_point(alpha = .5,
             size = 2) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1.5) +
  scale_x_continuous(breaks = seq(0, 70, 10)) +
  scale_y_continuous(breaks = seq(0, 60000, 20000),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", 
                                "cornflowerblue"))



# reproduce plot for each obsese and non-obese individuals
ggplot(data = insurance,
       mapping = aes(x = age, 
                     y = expenses,
                     color = smoker)) +
  geom_point(alpha = .5) +
  geom_smooth(method = "lm", 
              se = FALSE) +
  scale_x_continuous(breaks = seq(0, 70, 10)) +
  scale_y_continuous(breaks = seq(0, 60000, 20000),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", 
                                "cornflowerblue"))+
  facet_wrap(~obese)


# add informative labels
ggplot(data = insurance,
       mapping = aes(x = age, 
                     y = expenses,
                     color = smoker)) +
  geom_point(alpha = .5) +
  geom_smooth(method = "lm", 
              se = FALSE) +
  scale_x_continuous(breaks = seq(0, 70, 10)) +
  scale_y_continuous(breaks = seq(0, 60000, 20000),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", 
                                "cornflowerblue")) +
  facet_wrap(~obese) +
  labs(title = "Relationship between patient demographics and medical costs",
       subtitle = "US Census Bureau 2013",
       caption = "source: http://mosaic-web.org/",
       x = " Age (years)",
       y = "Annual expenses",
       color = "Smoker?")


# use a minimalist theme
ggplot(data = insurance,
       mapping = aes(x = age, 
                     y = expenses,
                     color = smoker)) +
  geom_point(alpha = .5) +
  geom_smooth(method = "lm", 
              se = FALSE) +
  scale_x_continuous(breaks = seq(0, 70, 10)) +
  scale_y_continuous(breaks = seq(0, 60000, 20000),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", 
                                "cornflowerblue")) +
  facet_wrap(~obese) +
  labs(title = "Relationship between age and medical expenses",
       subtitle = "US Census Data 2013",
       caption = "source: https://github.com/dataspelunking/MLwR",
       x = " Age (years)",
       y = "Medical Expenses",
       color = "Smoker?") +
  theme_minimal()



# placing color mapping in the geom_point function
ggplot(insurance,
       aes(x = age, 
           y = expenses)) +
  geom_point(aes(color = smoker),
             alpha = .5,
             size = 2) +
  geom_smooth(method = "lm",
              se = FALSE, 
              size = 1.5)



# create scatterplot and save it
myplot <- ggplot(data = insurance,
                 aes(x = age, y = expenses)) +
  geom_point()

# plot the graph
myplot

# make the points larger and blue
# then print the graph
myplot <- myplot + geom_point(size = 2, color = "blue")
myplot

# print the graph with a title and line of best fit
# but don't save those changes
myplot + geom_smooth(method = "lm") +
  labs(title = "Mildly interesting graph")

# print the graph with a black and white theme
# but don't save those changes
myplot + theme_bw()



# Clear the entire workspace
rm(list = ls())

# load libraries
library(tidyverse)

# load data
CIP <- read_csv("./data/CIP.csv", na = "NA")

# Initial exploration of the dataset 'CIP'
glimpse(CIP)

# Display the contents of the 'CIP' dataset in a spreadsheet-like view
View(CIP)

# Calculating the average total root weight per plot, excluding NA values
mean(CIP$trw, na.rm = TRUE)

# Calculating the average weight of non-commercial storage roots per plot, excluding NA values
mean(CIP$ncrw, na.rm = TRUE)

# Calculating the average weight of commercial storage roots per plot, excluding NA values
mean(CIP$crw, na.rm = TRUE)

# Counting the number of occurrences per 'trial' and displaying distinct rows of 'trial', 'harvest', and count
CIP %>%
  add_count(trial) %>%
  select(trial, harvest, n) %>% 
  distinct() %>% View()


# convert release column into factor
CIP$release <- factor(CIP$release)

# Generating a summary of the 'CIP' dataset, including statistics for each variable
summary(CIP)

# Creating a scatter plot of vine weight vs. weight of commercial storage roots using ggplot2
ggplot(CIP, aes(x = vw, y = nocr)) +
  geom_point() +
  labs(title = "Scatter Plot of Vine Weight vs Commercial Root Weight",
       x = "Weight of vines per plot (kg)", 
       y = "Weight of Commercial storage roots per plot (kg)")

# Creating a scatter plot of vine weight vs. weight of commercial storage roots using base R
plot(CIP$vw, CIP$nocr, 
     xlab = "Weight of vines per plot (kg)", 
     ylab = "Weight of Commercial storage roots per plot (kg)", 
     pch = 19, col = "blue")

# Creating a scatter plot of commercial root weight vs. total root weight using ggplot2
ggplot(CIP, aes(x = crw, y = trw)) +
  geom_point() +
  labs(title = "Scatter Plot of Commercial vs Total Root Weight",
       x = "Weight of Commercial roots (kg)", 
       y = "Weight of total roots (kg)")

# Creating a scatter plot with a linear model fit of commercial root weight vs. total root weight using ggplot2
ggplot(CIP, aes(x = crw, y = trw)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Scatter Plot with Linear Fit: Commercial vs Total Root Weight",
       x = "Weight of Commercial roots (kg)", 
       y = "Weight of total roots (kg)")

# Creating a bar plot of genotype vs. mean total root weight per plot using ggplot2
ggplot(CIP, aes(x = geno, y = trw)) +
  geom_bar(stat = "summary") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Mean Total Root Weight per Genotype",
       x = "Genotype", y = "Mean of total root weight per plot")

# Creating a faceted bar plot of genotype vs. commercial root weight for each trial using ggplot2
ggplot(CIP, aes(x = geno, y = crw)) +
  facet_wrap(~trial) +
  geom_bar(stat = "summary") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Mean Commercial Root Weight per Genotype Across Trials",
       x = "Genotype", y = "Mean of commercial root weight per plot")

# Creating a histogram of total root weight per plot using ggplot2
ggplot(CIP, aes(x = trw)) +
  geom_histogram(bins = 10, fill = "green", color = "black") +
  labs(title = "Histogram of Total Root Weight per Plot", x = "Total weight per plot")

# Creating a faceted histogram of total root weight per plot for each trial using ggplot2
ggplot(CIP, aes(x = crw)) +
  facet_wrap(~trial) +
  geom_histogram(bins = 10, fill = "green", color = "black") +
  labs(title = "Faceted Histogram of Total Root Weight per Plot", x = "Total weight per plot")

# Creating a boxplot of commercial root weight by genotype using ggplot2
ggplot(CIP, aes(x = geno, y = crw)) +
  geom_boxplot(fill = "orange") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Boxplot of Commercial Root Weight by Genotype", y = "Commercial root weight")

# Creating a boxplot of commercial root weight by genotype using ggplot2
ggplot(CIP, aes(x = geno, y = crw)) +
  facet_wrap(~trial) +
  geom_boxplot(fill = "orange") +
  #
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Boxplot of Commercial Root Weight by Genotype", y = "Commercial root weight")



# Exercises: fix the following code (there are errors)
ggplot(CIP, aes(x = vw, y = nocr)) +
  geom_point() +
  labs(title = "Scatter Plot of Vine Weight vs Commercial Root Weight",
       x = "Weight of vines per plot (kg)", 
       y = "Weight of Commercial storage roots per plot (kg)")


ggplot(CIP, aes(x = geno, y = trw)) +
  geom_bar(stat = "summary") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Genotype", y = "Mean of total root weight per plot")

ggplot(CIP, aes(x = trw)) +
  geom_histogram(bins = 10, fill = "green", color = "black") +
  labs(title = "Histogram of trw", x = "Total weight per plot")







