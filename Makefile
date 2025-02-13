# Makefile for data analysis pipeline

# TODO: Based on the help below, fill in the corresponding targets to complete the pipeline


# Data analysis workflow
data_analysis: clean_data analysis make_figures

clean_data:
	Rscript src/R/00_clean_data.R

analysis: 
	Rscript src/R/01_analysis.R

make_figures: 
	Rscript src/R/02_make_figures.R


# Help target
help:
	@echo "Available targets:"
	@echo "  all          - Run the complete workflow"
	@echo "  init         - Initialize Git repository and push to GitHub"
	@echo "  sync         - Sync local changes with GitHub and restore R environment"
	@echo "  push         - Snapshot R environment and push changes to GitHub"
	@echo "  renv_init    - Initialize R environment with renv"
	@echo "  renv_update  - Update renv snapshot"
	@echo "  data_analysis- Run the complete data analysis workflow"
	@echo "  clean_data   - Run data cleaning script"
	@echo "  analysis     - Run analysis script (requires clean data)"
	@echo "  make_figures - Generate figures (requires analysis)"
	@echo "  help         - Show this help message"
