# 01_clean_dt.R
# Purpose: Load cleaned flight data and analyze average delays per airline, measuring execution time
# Input: Cleaned dataset 'flights_clean_dt' from "00_clean_dt.R"
# Output: Printed table of mean departure and arrival delays per airline, with runtime info

# Load the cleaned dataset by sourcing the cleaning script
source("00_clean_dt.R")

# Measure execution time for calculating average delays
dt_time <- system.time({
  # Calculate mean departure and arrival delays for each airline
  flights_means_dt <- flights_clean_dt[
    , .(
      mean_dep_delay = mean(dep_delay, na.rm = TRUE),  # Average departure delay, ignoring missing values
      mean_arr_delay = mean(arr_delay, na.rm = TRUE)   # Average arrival delay, ignoring missing values
    ),
    by = airline  # Group by airline name
  ][order(mean_dep_delay)]  # Sort results by ascending average departure delay
  
  # Display the resulting summary table
  print(flights_means_dt)
})

# Print the runtime for the above operation
cat("⏱ data.table runtime:\n")
print(dt_time)

# Example runtime output (data.table):
# user  system elapsed 
# 0.009   0.002   0.004  # Demonstrates efficient performance of data.table
