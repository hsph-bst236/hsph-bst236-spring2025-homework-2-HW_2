# Analysis script
# This script performs the main statistical analysis
library(here)

# Set up project path
here::i_am("src/02_analysis.R")

# TODO: Load data

# Perform analysis
# TODO: Fit the linear model for MEDV ~ RM

# TODO: Save fitting results to data/, make sure your data name and structure is consistent with src/02_make_figures.R
save(model_summary, file = here("data", "model_results.rda"))
