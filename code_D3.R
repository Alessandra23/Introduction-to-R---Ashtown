## ------------- Code Day 3 ----------  ##


# Packages

install.packages("dplyr")
install.packages("tidyr")
install.packages("lme4")
install.packages("tidyverse")

# Load the packages
library(dplyr)
library(tidyr)
library(lme4)
library(tidyverse)

# look at vignettes

vignette("dplyr")
?tidyr

# Tells the current directory you are currently in -----
getwd()

# Modifying the working directory that R is "seeing" at the moment
setwd("INSERT THE PATH TO YOUR FOLDER HERE, ALWAYS IN QUOTES")

# mine
setwd("/Users/alessalemos/Documents/GitHub/IntroToR")


# Read the csv data -------

library(readxl)

data1 <- read.csv('sbd.csv', header = TRUE, sep = ',')
data1


# read the xlsx data --------


library(readxl)

data2 <- read_excel("sample_data.xlsx")
data2



# Checking NAs -----------


is.na(data2)

sum(is.na(data2))

colSums(is.na(data2))

data2_clean <- na.omit(data2)

which(is.na(data2), arr.ind = TRUE)
data2[5,3] <- 35

mean(data2$Age, na.rm = TRUE)
sd(data2$Age, na.rm = TRUE)


# Question 11 -----------

is.na(data1)
colSums(is.na(data1))
mean(data1$Rainfall.mm.)


# Question 12 -----------

# Using the 'data2' dataset, replace the missing values related to Frank.

# Frank's Age with the mean of the Age column.
data2$Age[is.na(data2$Age) & data2$Name == 'Frank'] <- round(mean(data2$Age, na.rm = TRUE),0)
data2$Age

# Frank's City with 'Dublin'.

data2$City[is.na(data2$City) & data2$Name == 'Frank'] <- 'Dublin'

data2

#  Native Pipe Operator -------

x <- data2$Score
x

# rounding the mean of x to 2 decimal places (base R)

round(mean(x), digits = 2)

# rounding the mean of x to 2 decimal places (using pipe)

x |>
  mean() |>
  round(digits = 2)


# Package dplyr ---------

library(dplyr)


# View data and structure ---------

View(data2)
str(data2)
glimpse(data2)
names(data2)


View(data1)
str(data1)
glimpse(data1)
names(data1)


# select ---------

select(data2, ID, Age)

data2 |>
  select(ID, Age)

data2 |>
  dplyr::select(ID)

data2 |>
  dplyr::select(-c(Date,Hour))

# Question 14 -------

# Creating a new object with selected columns
data1_new <- data1 |>
  dplyr::select(Date, Rented.Bike.Count, Hour, Seasons)
data1_new




# rename ----------

data2 <- data2 |>
  rename(Person = 'Name')


# Question 16 -------


data1 <- data1 |>
  rename(
    RBC = 'Rented.Bike.Count',
    Temp = 'Temperature.C.',
    Humidity = 'Humidity...',
    SR = 'Solar.Radiation..MJ.m2.',
    Rainfall = 'Rainfall.mm.',
    Snowfall = 'Snowfall..cm.'
  )

names(data1)


# mutate ---------

data_mutated <- data2 |>
  mutate(Score_Adjusted = Score + 10)
data_mutated



#----

data2$Person <- as.factor(data2$Person)


# Another way ---- using dplyr
data2_new <- data2 |>
  mutate_at('Person', as.factor)

data2_new <- data2 |>
  mutate_at(c('Person', 'City'), as.factor)



# 
data1 |> 
  dplyr::mutate(Humidity_new= Humidity... /100)

data1 |> 
  dplyr::mutate_at(c('Seasons', 'Holiday'), as.factor)



# filter -----


data1_filtered <- data2 |> 
  filter(Age > 25) |> 
  filter(Score > 90)
data1_filtered


# Question 20 ----




# Filter rows with Rainfall above 25mm
filtered_data1 <- data1 |>
  filter(Rainfall > 25)
filtered_data1

filtered_data1_2 <- data1 |>
  filter(Rainfall > 25, Seasons == "Spring")
filtered_data1_2





# summarise -------

data_summary <- data2 |>
  summarise(Mean_Score = mean(Score),
            SD_Score = sd(Score),
            Mean_Age = mean(Age, na.rm = TRUE),
            SD_Age = sd(Age, na.rm = TRUE),
            Median_Score = median(Score))
data_summary



# group_by --------


data_grouped <- data2 |>
  group_by(Is_Active) |>
  summarise(Mean_Score = mean(Score))
data_grouped


data_age_name_count <- data2 |>
  group_by(Person, Is_Active) |>
  count()
data_age_name_count


# Arrange -----

data_sorted <- data2 |> arrange(Score)
data_sorted


data_sorted <- data2 |> arrange(desc(Score))
data_sorted


# question ------

sorted_data <- data1 %>%
  arrange(Temp)
sorted_data


# -------


