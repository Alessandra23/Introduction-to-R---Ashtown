library(dplyr)

# 1. Import the dataset
data <- read.csv('sbd.csv', sep = ',')
str(data) # using base R
glimpse(data) # using dplyr

# 2. Summarise the dataset
summary_stats <- data |>
  summarise(
    mean_temperature = mean(Temperature.C., na.rm = TRUE),
    median_temperature = median(Temperature.C., na.rm = TRUE),
    sd_temperature = sd(Temperature.C., na.rm = TRUE),
    mean_bike_rentals = mean(Rented.Bike.Count, na.rm = TRUE),
    median_bike_rentals = median(Rented.Bike.Count, na.rm = TRUE),
    sd_bike_rentals = sd(Rented.Bike.Count, na.rm = TRUE)
  )
summary_stats

# 3. Count seasonal data
season_count <- data |>
  count(Seasons)
season_count

# 4. Filter by time
filtered_data <- data |>
  filter(Hour >= 6 & Hour <= 9)
filtered_data

# 5. Create a new column
data <- data |>
  mutate(Temperature_F = Temperature.C. * 9 / 5 + 32)
head(data)

# 6. Rename a column
data <- data |>
  rename(Bike_Rentals = Rented.Bike.Count)
head(data)

# 7. Select specific columns
selected_data <- data |>
  select(Date, Hour, Seasons, Bike_Rentals)
head(selected_data)

# 8. Group by and summarise
grouped_summary <- data |>
  group_by(Seasons) |>
  summarise(
    avg_bike_rentals = mean(Bike_Rentals, na.rm = TRUE),
    avg_temperature = mean(Temperature.C., na.rm = TRUE)
  )
grouped_summary

# 9. Arrange by temperature
arranged_data <- data |>
  arrange(desc(Temperature.C.))
head(arranged_data, 10)

# 10. Subset by weather conditions
subset_data <- data |>
  filter(Humidity... > 80 & Solar.Radiation..MJ.m2. == 0)
subset_data


  
  
  
  
  
  