# Solution

# Question 1

growth_stages <- c("Seedling", "Vegetative", "Flowering", "Harvest")
second_stage <- growth_stages[2]
second_stage

# Question 2

plant_heights <- c(45, 60, 72)
grown_heights <- plant_heights + 10
grown_heights

# Question 3

yield_data <- matrix(c(3.2, 3.5, 4.1, 4.4),
                     nrow = 2,
                     byrow = FALSE,
                     dimnames = list(c("Field A", "Field B"),
                                     c("Wheat", "Corn")))

corn_field_a <- yield_data["Field A", "Corn"]
corn_field_a

# or

wheat <- c(3.2, 3.5)
corn <- c(4.1, 4.4)
yield_matrix <- cbind(Wheat = wheat, Corn = corn)
rownames(yield_matrix) <- c("Field A", "Field B")
yield_matrix["Field A", "Corn"]


# Question 4

rainfall <- c(45, 75, 30)
names(rainfall) <- c("Region 1", "Region 2", "Region 3")

above_50 <- rainfall > 50
regions_above_50 <- names(rainfall)[above_50]
length(rainfall[rainfall == 30]) > 0
any(rainfall == 30)


# Question 5

pH_levels <- c(6.8, 7.2, 5.9)
all_greater_than_6 <- pH_levels[1] > 6 & pH_levels[2] > 6 & pH_levels[3] > 6
any_less_than_6 <- pH_levels[1] < 6 | pH_levels[2] < 6 | pH_levels[3] < 6

# Question 6

mean(yield_data)

# Question 7

x <- seq(from = -10, to = 10)

negatives <- x[x < 0]
non_negatives <- x[x >= 0]


transformed_negatives <- negatives * -2

positions_neg <- which(transformed_negatives > 8)
positions_non_neg <- which(non_negatives > 8)
