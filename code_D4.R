# code data visualisation

data("diamonds")
data("airquality")
data("iris")
data("mtcars")


# Histogram price diamonds

hist(diamonds$price)

hist(diamonds$price,
     xlab = 'Price')

hist(diamonds$price,
     xlab = 'Price',
     ylab = 'Frequency')

hist(diamonds$price,
     xlab = 'Price',
     ylab = 'Frequency',
     col = 'blue',
     lwd = 1)

hist(diamonds$price,
     main = "Histogram of Diamond Prices",
     xlab = "Price",
     col = "orange",
     border = "black")


# Bar Plot

table_price <- table(diamonds$cut)

barplot(table_price)

barplot(table_price,
        main = "Bar Plot of Diamond Cut",
        xlab = "Cut",
        ylab = "Frequency",
        col = "lightblue")


# Scatter Plot

plot(x = diamonds$carat,
     y = diamonds$price,
     main = "Scatter Plot of Carat vs Price",
     xlab = "Carat",
     ylab = "Price",
     col = "blue",
     pch = 19)

## adding legend
# Create a color vector based on the 'cut' variable
colors <- c("red", "blue", "green", "purple", "orange")  # Define colors for each cut
diamonds$color <- colors[as.numeric(diamonds$cut)]  # Map cuts to colors

# Create the scatter plot
plot(diamonds$carat,
     diamonds$price,
     col = diamonds$color, pch = 16,
     xlab = "Carat", ylab = "Price",
     main = "Carat vs. Price by Cut")

# Add a legend
legend("topright",
       legend = levels(diamonds$cut),
       col = colors,
       pch = 16,
       title = "Cut")


# Line plots


# Line plot of average price by carat
avg_price <- aggregate(price ~ carat, data = diamonds, FUN = mean)
plot(x = avg_price$carat,
     y = avg_price$price,
     type = "l",
     main = "Line Plot of Average Price by Carat",
     xlab = "Carat",
     ylab = "Average Price",
     col = "blue",
     lwd = 2)

# Boxplots

boxplot(diamonds$price)
boxplot(price ~ cut, data = diamonds,
        main = "Boxplot of Diamond Prices by Cut",
        xlab = "Cut",
        ylab = "Price (USD)",
        col = "lightblue",
        border = "black")



# Question 1 --------------------------------------------------------------


# Create the histogram
hist(airquality$Temp,
     col = "lightblue",
     xlab = "Temperature (°F)", ylab = "Frequency",
     main = "Distribution of Temperature")



# Question 2 --------------------------------------------------------------

# Calculate the average ozone by month using dplyr
mean_ozone <- airquality |>
  group_by(Month) |>
  summarise(Average_Ozone = mean(Ozone, na.rm = TRUE))

# View the result
mean_ozone

# Create the bar plot
barplot(mean_ozone$Average_Ozone,
        names.arg = mean_ozone$Month,
        col = rainbow(nrow(mean_ozone)),
        xlab = "Month", ylab = "Average Ozone (ppb)",
        main = "Average Ozone Concentration by Month")



# Question 3 --------------------------------------------------------------

# Create the scatter plot
plot(airquality$Wind,
     airquality$Ozone, col = "darkgreen", pch = 16,
     xlab = "Wind Speed (mph)", ylab = "Ozone Concentration (ppb)",
     main = "Relationship Between Wind Speed and Ozone Concentration")

# Add a trendline
abline(lm(Ozone ~ Wind, data = airquality), col = "red", lwd = 2)




# Question 4 --------------------------------------------------------------


# Create the line plot
plot(airquality$Temp, type = "l", col = "blue", lwd = 2,
     xlab = "Days", ylab = "Temperature (°F)",
     main = "Temperature Variation Over Days")

# Add points to highlight individual values
points(airquality$Temp, col = "red", pch = 16)



# Question 5 --------------------------------------------------------------

# Load the airquality dataset
data("airquality")

# Create a boxplot
boxplot(Ozone ~ Month, data = airquality,
        main = "Distribution of Ozone Levels by Month",
        xlab = "Month",
        ylab = "Ozone Concentration (ppb)",
        col = rainbow(5),  # Different colors for each month
        border = "black")





# plotting in ggplot2 -----------------------------------------------------

library(ggplot2)


# Basic scatter plot

ggplot(data = diamonds,
       aes(x = carat, y = price, color = cut)) +
  geom_point()

ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot of Carat vs Price",
       x = "Carat", y = "Price")


ggplot(data = diamonds,
       aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.6) +
  labs(title = "Diamonds: Carat vs. Price by Cut",
       x = "Carat", y = "Price (USD)") +
  theme_minimal()



# Question 6 --------------------------------------------------------------
names(iris)
iris |>
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, col = Species))+
  geom_point()



# Bar plot ----------------------------------------------------------------

ggplot(data = diamonds, aes(x = cut)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Bar Plot of Diamond Cut", x = "Cut", y = "Frequency")


# ex 2
diamonds_summary <- aggregate(price ~ cut, data = diamonds, mean)

# Create the bar plot
ggplot(diamonds_summary, aes(x = cut, y = price, fill = cut)) +
  geom_bar(stat = "identity", col = 'black') +
  labs(
    title = "Average price of diamonds by cut",
    x = "Cut",
    y = "Average price"
  )


# Question 7 --------------------------------------------------------------

iris_summary <- aggregate(Petal.Length ~ Species, data = iris, mean)

# Create the bar plot
ggplot(iris_summary,
       aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Average Petal Length by Species",
    x = "Species",
    y = "Average Petal Length"
  )


# Histogram ---------------------------------------------------------------


ggplot(data = diamonds, aes(x = price)) +
  geom_histogram(binwidth = 1000, fill = "orange", color = "black") +
  labs(title = "Histogram of Diamond Prices", x = "Price", y = "Count")


ggplot(diamonds, aes(x = price, fill = cut)) +
  geom_histogram(binwidth = 500, alpha = 0.7) +
  #facet_wrap(~cut) +
  labs(title = "Distribution of Price (Faceted by Cut)",
       x = "Price (USD)", y = "Count") +
  theme_minimal()




# Question 8 --------------------------------------------------------------

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(alpha = 0.6, bins = 15) +
  labs(
    title = "Distribution of Sepal Length by Species",
    x = "Sepal Length",
    y = "Count"
  ) +
  scale_fill_manual(values = c("setosa" = "steelblue",
                               "versicolor" = "darkorange",
                               "virginica" = "darkgreen"))






# Line plots --------------------------------------------------------------

avg_price <- aggregate(price ~ carat, data = diamonds, FUN = mean)

ggplot(data = avg_price, aes(x = carat, y = price)) +
  geom_line() +
  labs(title = "Average Price by Carat (Faceted by Cut)",
       x = "Carat",
       y = "Average Price (USD)")



# Question 9 --------------------------------------------------------------

ggplot(airquality,
       aes(x = Day, y = Ozone, color = factor(Month))) +
  geom_line() +
  labs(
    title = "Daily Ozone Levels by Month",
    x = "Day of the Month",
    y = "Ozone Levels (ppb)",
    color = "Month"
  )


# Box plots
ggplot(airquality,
       aes(x = Month, y = Ozone, color = factor(Month))) +
  geom_boxplot() +
  labs(
    x = "Month",
    y = "Ozone Levels (ppb)",
    color = "Month"
  )

ggplot(airquality,
       aes(x = Month, y = Ozone, color = factor(Month))) +
  geom_boxplot() +
  labs(
    x = "Month",
    y = "Ozone Levels (ppb)",
    color = "Month"
  ) +
  theme(legend.position = 'none')




# Question 10 -------------------------------------------------------------

ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_boxplot() +
  labs(
    title = "Distribution of Petal Width by Species",
    x = "Species",
    y = "Petal Width"
  )



# Customising Plots -------------------------------------------------------

# Customising titles and axis labels
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue") +
  labs(
    title = "Scatter Plot of Carat vs Price",
    subtitle = "Data from the diamonds dataset",
    x = "Carat (size of diamond)",
    y = "Price (in US dollars)",
    caption = "Source: ggplot2 diamonds dataset"
  )



# Applying different themes
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot with Custom Theme") +
  theme_bw() # Apply the bw theme


# Scatter plot with customised scales
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +  # Colour points by cut
  labs(title = "Price vs Carat Coloured by Cut") +
  scale_x_continuous(limits = c(0, 3)) +  # Set limits for the x-axis
  scale_color_brewer(palette = "Dark2") +  # Apply a custom colour palette
  theme_bw()


# Facet scatter plot by cut
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  labs(title = "Faceted Plot of Price vs Carat by Cut") +
  facet_wrap(~cut) + # Create a facet for each level of cut
  theme_bw()



# Scatter plot with annotation
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue") +
  labs(title = "Annotated Scatter Plot of Carat vs Price") +
  annotate("text", x = 1, y = 15000, label = "High Value", color = "black", size = 10) +  # Add a text annotation
  annotate("rect", xmin = 1, xmax = 1.5, ymin = 5000, ymax = 10000, alpha = 0.5, fill = "yellow") + # Highlight an area
  theme_bw()


# Scatter plot with a regression line and points
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue", alpha = 0.5) +  # Add points with transparency
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add a regression line
  labs(title = "Scatter Plot of Carat vs Price with Multiple Layers", x = "Carat", y = "Price") +
  theme_bw()




# Tasks -------------------------------------------------------------------


# Step 1: Data Summarisation
airquality_summary <- airquality %>%
  group_by(Month) %>%
  summarise(
    mean_ozone = mean(Ozone, na.rm = TRUE),
    mean_wind = mean(Wind, na.rm = TRUE),
    n = n()
  )
print(airquality_summary)

# Step 2: Scatter Plot
scatter_plot <- ggplot(airquality, aes(x = Wind, y = Ozone, color = factor(Month))) +
  geom_point(size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(
    title = "Relationship Between Wind and Ozone Levels",
    x = "Wind Speed (mph)",
    y = "Ozone Level (ppb)",
    color = "Month"
  ) +
  theme_minimal()

# Step 3: Add Annotations
scatter_plot <- scatter_plot +
  geom_hline(
    data = airquality_summary,
    aes(yintercept = mean_ozone, color = factor(Month)),
    linetype = "dotted"
  ) +
  annotate("text", x = 10, y = 100, label = "Mean Ozone levels (dotted lines)", size = 4, color = "black")

# Step 4: Facets
scatter_plot_with_facets <- scatter_plot +
  facet_wrap(~ Month) +
  labs(title = "Faceted Scatter Plot of Ozone vs Wind by Month") +
  theme_minimal()

