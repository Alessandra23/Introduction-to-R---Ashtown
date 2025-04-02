# Data frames -------


# Create a simple data frame with 3 variables
students <- data.frame(
  id = c(1, 2, 3, 4),
  name = c("Ana", "Paul", "Charlie", "Taylor"),
  grade = c(85, 92, 78, 88)
)

# Print the data frame
print(students)
View(students)

# structure
str(students)

# number of rows
nrow(students)

#  number of columns
ncol(students)

# both dimensions
dim(students)

# View column names
names(students)
colnames(students)

# access specific columns
students$name
students[["grade"]]
students[, "id"]

# Access specific rows
students[2, ]  # Second row
students[c(1, 3), ]  # First and third rows


# Create a sample data frame
player_data <- data.frame(
  id = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  names = c("Alice", "Paul", "Charlie", "David", "Taylor", "Eva", 'Mark', 'John', 'Maeve', 'Caroline'),
  age = c(25, 30, 35, 28, NA, NA, 36, 29, 32,38),
  city = c("Ashtown", "Dublin", "Dublin", "Cork", "Naas", NA, 'Wexford', 'Dublin', 'Ashtown', 'Cork'),
  score = c(88, 92, 95, 80, 85, 90, 98, 74, 92, 89),
  player = c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE) # Logical column
)

player_data

str(player_data)

#View the first few rows
head(player_data)

# View the last few rows
tail(player_data)

# summary data
summary(player_data)

# Counting 
table(player_data$city)
table(player_data$city, player_data$player)

# ordering
player_data[order(player_data$score), ]
player_data[order(-player_data$score), ]


# Converting a column to a factor
player_data$id <- as.factor(player_data$id)

str(player_data)


# Subset the first three rows and the "Name" and "Age" columns
subset_data <- player_data[1:3, c("names", "age")]
subset_data


# Subsetting with conditions

# Subset rows where age is greater than 30
condition_subset <- player_data[player_data$age > 30, ]
condition_subset


# or

condition_subset <- subset(player_data, age > 30)
condition_subset


# subsetting with two conditions

condition_subset <- player_data[player_data$age <= 30 & player_data$city == "Dublin", ]
condition_subset

# or

condition_subset <- subset(player_data, age <=  30 & city == 'Dublin')
condition_subset


# Check for missing values in the dataset
is.na(player_data)

# Summarise missing values in each column
colSums(is.na(player_data))

player_data[rowSums(is.na(player_data)) > 0,]

player_data[!(rowSums(is.na(player_data)) > 0), ]

# Subsetting NAs

player_data[!is.na(player_data$age), ]
player_data[player_data$age > 30 & !is.na(player_data$age), ]


# Remove rows with missing values
clean_data <- na.omit(player_data)
clean_data


# Replace missing values in the 'Age' column with the mean age
player_data$age[is.na(player_data$age)] <- mean(player_data$age, na.rm = TRUE)
player_data


# Question 5 ---------


# Create the data frame
my_data <- data.frame(
  values = c(sample(1:100, 9), NA), # 9 numbers + 1 NA
  flags = sample(c(TRUE, FALSE), 10, replace = TRUE),
  categories = sample(c("A", "B", "C"), 10, replace = TRUE),
  stringsAsFactors = FALSE
)

str(my_data)

# Show rows with missing values
my_data[!complete.cases(my_data), ]

# Find and replace NA with max value
max_value <- max(my_data$values, na.rm = TRUE)
my_data$values[is.na(my_data$values)] <- max_value

# Verify  NAs 
sum(is.na(my_data))

# Convert to factor
my_data$categories <- factor(my_data$categories)

# Create frequency table
category_counts <- table(my_data$categories)
category_counts




# Lists ----------


# Basic list creation
simple_list <- list(1, "a", TRUE)
simple_list

# Named list
named_list <- list(
  numbers = 1:5,
  letters = c("a", "b", "c"),
  logical = TRUE,
  matrix = matrix(1:4, nrow=2)
)
named_list

# Mixed content list
mixed_list <- list(
  title = "Student Data",
  data = data.frame(
    id = 1:3,
    name = c("Alice", "Bob", "Charlie")
  ),
  summary = list(mean_score = 85.6, passed = TRUE)
)
mixed_list


# Accessing elements by position
named_list[[1]]      # First element
named_list[["letters"]] # By name
named_list$numbers   # Using $ operator

# Accessing multiple elements (returns sublist)
named_list[c(1, 3)]

# Accessing nested elements
mixed_list$data$name
mixed_list[[2]][[2]]  # Second element of second component


# Adding new elements
named_list$new_item <- "Hello World"
named_list[["another_item"]] <- 42

# Modifying existing elements
named_list$letters <- c("x", "y", "z")

# Removing elements
named_list$logical <- NULL

# Check if object is a list
is.list(named_list)

# Number of elements in list
length(named_list)

# Names of list elements
names(named_list)

# Convert list to vector (if possible)
unlist(list(1, 2, 3))

# Apply function to each list element
lapply(named_list, length)

# Flattening lists
nested_list <- list(a = list(1, 2), b = list(3, 4))
flattened <- unlist(nested_list)
flattened


# Question 6 --------


my_city <- list(
  name = "Ceará",
  population = 50000,
  capital = TRUE,
  districts = c("Fortaleza", "Quixadá", "Jericoacara")
)
my_city

# Three different ways to access the population:
my_city$population
my_city[["population"]]
my_city[[2]]  # If population is the 2nd element

my_city$area <- 232.1  # Area in km2
# Alternative:
my_city[["area"]] <- 232.1
my_city




# Functions ---------------------------------------------------------------

# Simple function without arguments
say_hello <- function() {
  print("Hello, World!")
}
say_hello()

# Function with one argument
square <- function(x) {
  x^2
}
square(5)  

# Function with multiple arguments
add_numbers <- function(a, b) {
  a + b
}
add_numbers(3, 7)  


# Explicit return statement
calculate_bmi <- function(weight, height) {
  bmi <- weight / (height^2)
  return(bmi)
}
calculate_bmi(70, 1.75)  



# Returning a list for multiple outputs
circle_stats <- function(radius) {
  area <- pi * radius^2
  circumference <- 2 * pi * radius
  return(list(radius = radius, 
              area = area, 
              circumference = circumference))
}

# Using the function
results <- circle_stats(5)
results
results$area          
results$circumference 


circle_stats(c(3,4))


# Question 7 -------


convert_to_kg <- function(yield_tons) {
  yield_kg <- yield_tons * 1000
  return(yield_kg)
}

convert_to_kg(25)



# If else -----------------------------------------------------------------

# Simple if statement
x <- 10
if (x > 5) {
  print("x is greater than 5")
}


# Using if/else with a single value
x <- 10
if (x > 5) {
  result <- "Greater than 5"
} else {
  result <- "Not greater than 5"
}
print(result)


# Example 2:

temperature <- 23
if (temperature > 30) {
  print("Hot day")
} else {
  print("Not too hot")
}

# Using ifelse for vectorized operations
numbers <- 1:10; numbers
result_vector <- ifelse(numbers/2 >3 , "Yes", "No")
result_vector



# Multiple conditions with else if
score <- 85
if (score >= 90) {
  grade <- "A"
} else if (score >= 80) {
  grade <- "B"
} else if (score >= 70) {
  grade <- "C"
} else {
  grade <- "F"
}
print(paste("Your grade is:", grade))



# Question 8 --------------------------------------------------------------

check_number <- function(x) {
  if (x > 0) {
    "Positive"
  } else if (x < 0) {
    "Negative"
  } else {
    "Zero"
  }
}

check_number(10)   
check_number(-1)  
check_number(0)   


# Loops -------------------------------------------------------------------


# Simple numeric range loop
for(i in 1:5) {
  print(i)
}

for(i in 1:5) {
  print(paste("Iteration", i))
}

# Looping through a vector
fruits <- c("apple", "banana", "cherry")
for(i in fruits) {
  print(toupper(i)) # Convert to uppercase
}

# Looping with index and value
n <- length(fruits)
for(i in 1:n) {
  print(paste("Fruit", i, "is", fruits[i]))
}


numbers <- c(1,2,3)
numbers

previous <- numbers[1]

for (num in numbers) {
  # Calculate sum
  previous <- previous + num
  
}
previous


# Nested for loops (multiplication table)
for(i in 1:3) {
  for(j in 1:3) {
    print(paste(i, "x", j, "=", i*j))
  }
}




# While loop example
count <- 1
while (count <= 5) {
  print(paste("Count is", count))
  count <- count + 1
}


# question 

numbers <- sample(1:100, 10)
numbers

total_sum <- 0
largest <- numbers[1] # Start with first number

for (num in numbers) {
  # Calculate sum
  total_sum <- total_sum + num
  
  # Find largest
  if (num > largest) {
    largest <- num
  }
}

total_sum
largest


sum(numbers)
max(numbers)
