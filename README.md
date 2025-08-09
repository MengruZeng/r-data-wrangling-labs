# r-data-wrangling-labs
Hands-on data wrangling labs in R, focusing on practical cleaning techniques and tidy data principles.

# Flights Delay Analysis Project

## Project Overview
This project analyzes the NYC flights dataset (from the `nycflights13` R package) to explore airline departure and arrival delays. The project demonstrates data cleaning, aggregation, and performance benchmarking using both base R and data.table approaches.

## Key Features
- Data cleaning and preprocessing with base R and data.table for comparison.
- Calculation of average departure and arrival delays per airline.
- Performance measurement of base R vs data.table methods.
- Well-commented, modular scripts to ensure reproducibility and clarity.
- Clear documentation facilitating collaboration and maintenance.

## Project Structure

| Script Name       | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| `00_clean.R`      | Clean flights dataset using base R; select key columns and join airline names for clarity.       |
| `01_analysis.R`   | Analyze cleaned data with base R; calculate average delays and measure execution time.            |
| `00_clean_dt.R`   | Clean flights dataset using data.table for efficient data manipulation and joining airline names.|
| `01_analysis_dt.R`| Analyze cleaned data using data.table; compute average delays per airline and benchmark performance.|

## How to Run
1. Install required packages if needed: `data.table`, `nycflights13`.
2. Run cleaning scripts first:
   ```
   source("00_clean.R")
   source("00_clean_dt.R")
   ```
3. Then run analysis scripts:
  ```
  source("01_analysis.R")
  source("01_analysis_dt.R")
  ```
4.Check console outputs for summaries and runtime comparisons.

## Highlights
- Demonstrates proficiency in both base R and data.table for data manipulation.
- Provides performance benchmarks showcasing `data.table` efficiency.
- Includes detailed English comments in scripts to improve readability.
- Modular approach facilitates easy comparison and understanding of different methods.
- Reflects strong analytical and coding skills relevant to data science roles.

