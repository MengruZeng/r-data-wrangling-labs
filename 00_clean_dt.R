# 00_clean_dt.R
# Purpose: Clean the 'flights' dataset by selecting key variables and adding airline names
# Input: 'flights' and 'airlines' datasets from nycflights13 package
# Output: A cleaned data.table with airline names and delay variables for further analysis

# Check if required packages are installed, install them if missing
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}
if (!requireNamespace("nycflights13", quietly = TRUE)) {
  install.packages("nycflights13")
}

# Load necessary libraries
library(data.table)
library(nycflights13)

# Convert 'flights' and 'airlines' data.frames to data.tables for efficient processing
flights_dt <- as.data.table(flights)
airlines_dt <- as.data.table(airlines)

# Select relevant columns from flights dataset: carrier, departure delay, arrival delay
# Join with airlines dataset on 'carrier' to add airline full names
# nomatch = 0 excludes unmatched records (keeps only matching carriers)
flights_clean_dt <- flights_dt[, .(carrier, dep_delay, arr_delay)][
  airlines_dt, on = .(carrier), nomatch = 0
][, .(airline = name, dep_delay, arr_delay)]

# Display the first few rows of the cleaned data.table for verification
head(flights_clean_dt)
