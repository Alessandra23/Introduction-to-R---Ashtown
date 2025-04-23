

# Test for the mean of a population

data <- c(5.1, 5.3, 5.5, 5.7, 5.9)

t.test(data, mu = 5.5)
t.test(data, mu = 5.5, alternative = "less")
t.test(data, mu = 5.5, alternative = "greater")



# Question 39 --------------------------------------------------------------

# 1)
# Load the airquality dataset
data("airquality")
t.test(airquality$Ozone, mu = 50)


# 2)
# Load the mtcars dataset
data("mtcars")
# Filter data for cars with 6 cylinders
six_cylinder_data <- mtcars |>
  filter(cyl == 6)
# Perform t-test
t.test(six_cylinder_data$mpg, 
       mu = 20, 
       alternative = "less", 
       conf.level = 0.95)


# 3)
# Load the iris dataset
data("iris")
# Filter data for Setosa species
setosa_data <- iris |>
  filter(Species == "setosa")
# Perform t-test
t.test(setosa_data$Sepal.Length,
       mu = 5.0,
       alternative = "two.sided",
       conf.level = 0.95)




# Two populations ---------------------------------------------------------


# Sample data for two groups
group1 <- c(5.1, 5.3, 5.7, 6.0, 6.2)
group2 <- c(6.1, 6.3, 6.5, 7.0, 7.2)


# Two-sample t-test assuming equal variances (Student's t-test)
t.test(group1, group2, var.equal = TRUE)
t.test(group1, group2, var.equal = TRUE, 
       alternative = "greater")
t.test(group1, group2, var.equal = TRUE, 
       alternative = "less")


# Check normality
# Check normality for Group 1
shapiro.test(group1)
# Check normality for Group 2
shapiro.test(group2)

qqnorm(group1) ; qqline(group1)
qqnorm(group2) ; qqline(group2)


# Check if variances are equal
var.test(group1, group2)


# Two-sample t-test assuming unequal variances (Welch's t-test)
t.test(group1, group2, var.equal = FALSE)
t.test(group1, group2, var.equal = FALSE, 
       alternative = "greater")
t.test(group1, group2, var.equal = FALSE, 
       alternative = "less")


# Question 40 --------------------------------------------------------------


# Filter data and select Sepal.Length
setosa_data <- iris |>
  filter(Species == "setosa")

versicolor_data <- iris |>
  filter(Species == "versicolor")

var.test(setosa_data$Sepal.Length, versicolor_data$Sepal.Length)

# Perform t-test
t.test(setosa_data$Sepal.Length, versicolor_data$Sepal.Length,
       alternative = "two.sided",
       var.equal = FALSE,
       conf.level = 0.95)


# -------

# Filter data and select mpg for 4-cylinder and 6-cylinder cars
four_cylinder_data <- mtcars |>
  filter(cyl == 4)

six_cylinder_data <- mtcars |>
  filter(cyl == 6)

var.test(four_cylinder_data$mpg, six_cylinder_data$mpg)

# Perform t-test
t.test(four_cylinder_data$mpg, six_cylinder_data$mpg,
       var.equal = FALSE,
       alternative = "two.sided", 
       conf.level = 0.95)



# ------

# Subset the data for May and September
may_temp <- airquality |>
  filter(Month == 5)

september_temp <- airquality |>
  filter(Month == 9)

var.test(may_temp$Temp, september_temp$Temp)

# Perform an independent two-sample t-test
t.test(may_temp$Temp, september_temp$Temp, var.equal = TRUE)



# One-way ANOVA -----------------------------------------------------------


data(PlantGrowth)

head(PlantGrowth)
names(PlantGrowth)

# boxplot
ggplot(data = PlantGrowth,
       aes(x = group, y = weight))+
  geom_boxplot()


oneway.test(weight ~ group, data = PlantGrowth, var.equal = TRUE)
oneway.test(weight ~ group, data = PlantGrowth, var.equal = FALSE)

# Perform one-way ANOVA using aov

aovPlantGrowth <- aov(weight ~ group, data = PlantGrowth)
summary(aovPlantGrowth)


# Visualisation of residuals analysis
plot(aovPlantGrowth, which = 1) # Residuals vs Fitted
plot(aovPlantGrowth, which = 2) # Normal Q-Q
car::qqPlot(aovPlantGrowth, main = "Normal Q-Q Plot") # Normal Q-Q


# check assumptions
residualsPlantGrowth <- residuals(aovPlantGrowth)
shapiro.test(residualsPlantGrowth)

bartlettPlantGrowth <- bartlett.test(weight ~ group, data = PlantGrowth)
bartlettPlantGrowth

library(car)
levenePlantGrowth <- leveneTest(weight ~ group, data = PlantGrowth)
levenePlantGrowth


# Non-parametric test
kruskalPlantGrowth <- kruskal.test(weight ~ group, data = PlantGrowth)
kruskalPlantGrowth

# Post-hoc test
TukeyHSD(aovPlantGrowth) 

#userfriendlyscience::oneway(weight ~ group, data = PlantGrowth, var.equal = TRUE, posthoc=c("tukey"))



# Question 41 --------------------------------------------------------------

# Load the iris dataset
data(iris)

# Create a box plot
ggplot(iris,
       aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of sepal length by species",
       x = "Species",
       y = "Sepal length") +
  theme_bw()

# 2. Perform one-way ANOVA
anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)  


## Normality Check
# Histogram of residuals
plot(anova_model, which = 1) # Residuals vs Fitted
plot(anova_model, which = 2) # Normal Q-Q

# Shapiro-Wilk Test for normality
shapiro.test(residuals(anova_model))

## Homogeneity of Variances
leveneTest(Sepal.Length ~ Species, data = iris)
# Bartlett’s Test
bartlett.test(Sepal.Length ~ Species, data = iris)

oneway.test(Sepal.Length ~ Species, data = iris)



