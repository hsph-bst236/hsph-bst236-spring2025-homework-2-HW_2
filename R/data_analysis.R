#' Generate Housing Analysis Figures
#'
#' This function creates a scatter plot with regression line showing the relationship
#' between house prices and number of rooms. The plot includes R² value and is saved
#' as a PNG file.
#'
#' @return Invisible NULL. Creates a PNG file as a side effect.
#' @export
#'
make_figures <- function() {
    # Load data using data() function
    data("model_results", package = "RTemplate", envir = environment())
    
    # Create output directory if it doesn't exist
    output_dir <- "figs"
    dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)
    
    # Set up the PNG device
    png(file.path(output_dir, "housing_analysis.png"),
        width = 8, height = 6, units = "in", res = 300)
    
    # Create the scatter plot
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
    
    # Close the device
    dev.off()
    
    invisible(NULL)
} 