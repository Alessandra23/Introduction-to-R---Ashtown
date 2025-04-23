# Two-Way ANOVA in R: Full Example --------------------------------------



data("ToothGrowth")
head(ToothGrowth)
# Convert 'dose' to a factor 
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

library(dplyr)
summary_stats <- ToothGrowth %>%
  group_by(supp, dose) %>%
  summarise(
    Mean = mean(len),
    SD = sd(len),
    N = n()
  )
summary_stats


library(ggplot2)

# Boxplot of tooth length by supplement and dose
ggplot(ToothGrowth, aes(x = dose, y = len, fill = supp)) +
  geom_boxplot() +
  labs(x = "Dosage (mg/day)",
       y = "Tooth Length",
       fill = "Supplement") +
  theme_bw()

# check for possible interactions
ggplot(ToothGrowth, aes(x = dose, y = len, color = supp, group = supp)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun = mean, geom = "point") +
  labs(x = "Dosage (mg/day)",
       y = "Mean Tooth Length",
       color = "Supplement") +
  theme_bw()

# Perform Two-Way ANOVA
model <- aov(len ~ supp * dose, data = ToothGrowth)
summary(model)


# Normality of Residuals (Q-Q Plot)
qqnorm(resid(model))
qqline(resid(model), col = "red")

# Homogeneity of Variance (Residuals vs. Fitted)
plot(model, which = 1)  # Residuals vs Fitted

# Tests
# Shapiro-Wilk Test for Normality
shapiro.test(resid(model))  # p > 0.05 => normal

# Levene's Test for Homogeneity of Variance
library(car)
leveneTest(len ~ supp * dose, data = ToothGrowth)  # p > 0.05 => equal variances

# Post-Hoc 
# Tukey for pairwise comparisons (if interaction is significant)
TukeyHSD(model, which = c("supp", "dose", "supp:dose"))
# If no interaction, check main effects separately
TukeyHSD(model, which = c("supp", "dose"))



library(emmeans)    # For post-hoc comparisons
# Post-hoc comparisons using emmeans
# estimated marginal means
emm <- emmeans(model, pairwise ~ supp * dose, adjust = "tukey")
emm

emm$emmeans

# Pairwise comparisons with Tukey adjustment
emm$contrasts

# Get comparisons for specific factors:
# Compare supplements at each dose level
emm_supp <- emmeans(model, pairwise ~ supp | dose, adjust = "tukey")
emm_supp$contrasts

# Compare doses for each supplement type
emm_dose <- emmeans(model, pairwise ~ dose | supp, adjust = "tukey")
emm_dose$contrasts

### Plot emm 
# Plot marginal means with confidence intervals
# plot(emm, by = "supp", comparisons = TRUE) +
#   labs(title = "Estimated Marginal Means with 95% CIs",
#        y = "Tooth Length") +
#   theme_bw()




# SIMPLE LINEAR REGRESSION ANALYSIS -------------------------------


library(ggplot2)  
library(car)      
library(ggpubr)   

## Load and inspect data
data(mtcars)
head(mtcars)

# Pearson Correlation
cor_test <- cor.test(mtcars$mpg, mtcars$wt, method = "pearson")
cor_test

# catterplot with correlation
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  stat_cor(method = "pearson", label.x = 3.5, label.y = 30) +  # Add correlation
  labs(x = "Weight (1000 lbs)",
       y = "Miles per Gallon (MPG)") +
  theme_bw()

# Fit Linear Model
model <- lm(mpg ~ wt, data = mtcars)
summary(model)

# Linearity: Residuals vs Fitted plot
plot(model, which = 1)

# Normality: Q-Q plot
plot(model, which = 2)

# Homoscedasticity: Scale-Location plot
plot(model, which = 3)

# Outliers/Cook's Distance
plot(model, which = 4)


# Tests:

# Shapiro-Wilk test for normality
shapiro.test(residuals(model))

# Breusch-Pagan test for homoscedasticity
library(lmtest)
bptest(model)


# confidence Intervals for coefficients
confint(model)

# Predictions
new_data <- data.frame(wt = c(2.5, 3.5, 4.5))
predict(model, newdata = new_data, interval = "predict", level = 0.95)
