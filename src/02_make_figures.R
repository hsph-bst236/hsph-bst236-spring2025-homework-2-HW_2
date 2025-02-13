# Figure generation script
# This script creates figures from analysis results
# This script is only used for creating figures from the analysis results.
# You do not need to run the model fitting if you only need to change plot style here.

library(here)

here::i_am("src/02_make_figures.R")

# Load model fitting results 
load(here("data", "model_results.rda"))

# Create the scatter plot with regression line using base R
png(here("figs", "housing_analysis.png"), 
    width = 8, height = 6, units = "in", res = 300)

plot(model_summary$model_data$rm, 
     model_summary$model_data$medv,
     pch = 19, col = rgb(0,0,0,0.5),
     xlab = "Average Number of Rooms",
     ylab = "Median House Value ($1000s)",
     main = "House Price vs Number of Rooms")

# Add regression line
lines(model_summary$model_data$rm, 
      model_summary$model_data$predicted,
      col = "red", lwd = 2)

# Add R² value
mtext(sprintf("R² = %.3f", model_summary$r_squared),
      side = 1, line = 4, adj = 1)

dev.off()