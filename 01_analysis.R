# 01_analysis.R
# Purpose: Analyze cleaned flights data to compute average delays per airline and measure execution time
# Input: Cleaned dataset 'flights_clean_dt' from 00_clean_dt.R
# Output: Data.table of average departure and arrival delays per airline, printed with runtime info

# Load the cleaned dataset by sourcing the cleaning script
source("00_clean_dt.R")

# Measure execution time for delay summary calculations
dt_time <- system.time({
  # Calculate mean departure and arrival delays grouped by airline
  flights_means_dt <- flights_clean_dt[
    , .(
      mean_dep_delay = mean(dep_delay, na.rm = TRUE),  # Mean departure delay, ignoring NAs
      mean_arr_delay = mean(arr_delay, na.rm = TRUE)   # Mean arrival delay, ignoring NAs
    ),
    by = airline  # Group by airline
  ][order(mean_dep_delay)]  # Order results by ascending mean departure delay
  
  # Print the summary table
  print(flights_means_dt)
})

# Output the timing information of the above calculation
cat("⏱ data.table runtime:\n")
print(dt_time)

# Notes on runtime (example output):
# user  system elapsed 
# 0.009   0.001   0.003  # Demonstrates the efficiency of data.table approach
