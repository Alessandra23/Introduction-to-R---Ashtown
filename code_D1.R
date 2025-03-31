'Hello World!'

# This is a comment and won't affect the code.


# Operations -----------

2+2
2-2
2*2
2^2
(2+2^2)/2

NA + 3

# Assigning a number to a variable ------------
x <- 10    # You can also use x = 10
y <- 5

# Printing the value of a variable
print(x)

# or simply
x

# or

x <- 10; x

# or

(x <- 10)



# Another way to assign a value to a variable:
assign("x", 9)
x



# Creating a new variable combining previous variables

z <- x + y
z


# Listing the variables

ls()

# Removing variables
rm(x)
x

# Removing all variables

rm(list = ls())


# --------------- Question 1 -------------
3.14 * 25^2 * 120

volume <- 3.14 * 25^2 * 120
volume


# Type of variables ----------------

# Numeric
num_var <- 42
num_var

# Integer
int_var <- 4L
int_var

# Character (text)
char_var <- "Chocolate"
char_var

# Logical (boolean)
bool_var <- TRUE
bool_var


# Checking class and structure

class(num_var)
str(num_var)

class(int_var)
str(int_var)

class(char_var)
str(char_var)

class(bool_var)
str(bool_var)


# Representing infinity
1/0



# Logical operations --------------

1 > 5

10 < 100

10 != 10

10 == 10 # Note: this is not the same as =

10 <= 10

5 >= 10

# Assigning and logical operators

is_greater <- 5 > 3
is_less <- 5 < 3
is_equal <- 5 == 3
not_equal <- 5 != 3

# Printing the results
is_greater
is_less
is_equal
not_equal




# Logical expressions ----------------
x <- 10
y <- 5

and_condition <- (x > 5) & (y < 10)  # Both conditions must be TRUE
or_condition <- (x > 5) | (y > 10)   # At least one condition must be TRUE
not_condition <- !(x == y)           # Negates the condition

# Printing the results
and_condition
or_condition
not_condition




# ----- Question 2 -----

# Assign scores
participant1 <- 85
participant2 <- 50
participant3 <- 75

# 1. Check if all participants scored above 40 (and)
(participant1 > 40) & (participant2 > 40) & (participant3 > 40)  # TRUE

# 2. Check if any participant scored exactly 50 (or)
(participant1 == 50) | (participant2 == 50) | (participant3 == 50)  # TRUE

# 3. Check if none of the participants scored less than 30 (not)
!((participant1 < 30) | (participant2 < 30) | (participant3 < 30))  # TRUE





# Objects ---------



# Vectors

x <- c(10, 20, 30, 40, 50)
x

# Create a vector of a sequence of numbers we can use the : operator.
y <- c(1:10)
y

# Create a vector of a sequence of numbers.
z <- seq(from = 2, to = 12, by = 2)
z


# Create a vector of a repeated numbers.
w <- rep(2, times = 10)
w


# Create a character vector
fruits <- c("apple", "banana", "cherry")
fruits

# Create a vector of a sequence of letters
lowercase <- letters[1:10]
lowercase

uppercase <- LETTERS[1:5]
uppercase


# accessing elements


z[1]
z[1:2]
z[c(1,2,5)]
z[-1]


z*3
z>10
z[z >= 10]

# Find the positions
which(z >= 10)


# Basic function

mean(z)
sd(z)
min(z)
max(z)
var(z)
range(z)
log(z)
z - mean(z)




# Question 3 ------------

scores <- c(12, 45, 67, 89, 34, 23, 50, 8, 62)
filter_scores <- scores[scores < 50]
mean(filter_scores)    
sd(filter_scores)      


# Matrices ---------- 

m <- matrix(
  c(1, 2, 3, 4), nrow = 2
)

m+m
m*3
m > 2

# Create a 3x3 matrix
my_matrix <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
my_matrix

colnames(my_matrix) <- c('Col 1', 'Col 2', 'Col 3')
rownames(my_matrix) <- c('Row 1', 'Row 2', 'Row 3')

my_matrix

# accessing elements of the matrix

my_matrix[1,1]
my_matrix[1,]
my_matrix[,1]
my_matrix[1:3,1]
my_matrix[1,1:3]
my_matrix[c(1,3),1]
my_matrix[c(1,3),c(2,3)]

my_matrix[ ,'Col 1']
my_matrix['Row 1', ]

mean(my_matrix)
sum(my_matrix[1,])
mean(my_matrix[,1])

# Joining matrices

m1 <- matrix(seq(from = 1, to = 10, by = 1), nrow = 2, ncol = 5) ; m1
colnames(m1) <- c('Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5')
rownames(m1) <- c('Rep 1', 'Rep 2')

m2 <- matrix(seq(from = 1, to = 15, by = 1), nrow = 3, ncol = 5) ; m2
colnames(m2) <- c('Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5')
rownames(m2) <- c('Rep 1', 'Rep 2', 'Rep 3')


m1_m2 <- rbind(m1, m2)
m1_m2

cbind(m1, m2) # Problem??



# Question 4 ---------

# Create the matrix (filled by row)
sales_data <- matrix(
  c(15, 23, 42, 31, 8, 12, 50, 27, 20, 35, 10, 18),
  nrow = 3,
  byrow = TRUE
)

# Rename rows and columns
rownames(sales_data) <- c("Store_A", "Store_B", "Store_C")
colnames(sales_data) <- c("Jan", "Feb", "Mar", "Apr")

# 1. Highest in March:
rownames(sales_data)[which.max(sales_data[, "Mar"])]  # "Store_B"

# 2. Total for Store_B:
sum(sales_data["Store_B", ])  # 97

# 3. Values > 30:
sales_data[sales_data > 30]   # c(42, 31, 50, 35)



