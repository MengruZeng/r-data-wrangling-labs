# 00_clean.R
# Purpose: Clean the flights dataset using data.table for further analysis
# Input: 'flights' and 'airlines' datasets from nycflights13 package
# Output: Cleaned data.table with airline names and delay information

# Load or install required packages if not already installed
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}
if (!requireNamespace("nycflights13", quietly = TRUE)) {
  install.packages("nycflights13")
}

# Load libraries
library(data.table)
library(nycflights13)

# Convert 'flights' and 'airlines' data frames to data.table format for efficient data manipulation
flights_dt <- as.data.table(flights)
airlines_dt <- as.data.table(airlines)

# Select relevant columns from flights: carrier code, departure delay, arrival delay
# Join with airlines_dt on 'carrier' to get full airline names
# 'nomatch = 0' ensures only matching carriers are kept
flights_clean_dt <- flights_dt[, .(carrier, dep_delay, arr_delay)][
  airlines_dt, on = .(carrier), nomatch = 0
][, .(airline = name, dep_delay, arr_delay)]

# Display the first few rows of the cleaned data.table for inspection
head(flights_clean_dt)
