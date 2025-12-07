# 1. Check Cholesterol level (using if) 
# Write an If statement to check cholesterol level is greater than 240, 
# if true, it will prints “High Cholesterol”

cholesterol <- 230

if (cholesterol > 240){
  print("High Cholesterol")
  }

# ----------------------------------------------------------------------------------------------------------------

# 2. Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# If false then print: “Blood Pressure is high”

Systolic_bp <- 130
if (Systolic_bp < 120) {
  print("Blood Pressure is normal")
} else {
  print("Blood Pressure is high")
}

# ----------------------------------------------------------------------------------------------------------------

# 3. Automating Data Type Conversion with for loop

# Use patient_info.csv data and metadata.csv
patient_data <- read.csv(file.choose())
meta_data <- read.csv(file.choose())

# Perform the following steps separately on each dataset (patient_info.csv data and metadata.csv)
# Create a copy of the dataset to work on.
clean_patient_data <- patient_data
clean_metadata <- meta_data

# Identify all columns that should be converted to factor type.
str(clean_patient_data)
str(clean_metadata)

# Store their names in a variable (factor_cols).
# Example: factor_cols <- c("gender", "smoking_status")
factor_cols <- c("gender", "diagnosis", "smoker")


factor_cols_meta <- c("height", "gender")
 

# Use a for loop to convert all the columns in factor_cols to factor type.
# Pass factor_cols to the loop as a vector.

for (col in factor_cols) {
   clean_patient_data[[col]] <- as.factor(clean_patient_data[[col]])
 }
str(clean_patient_data)

for (col in factor_cols_meta) {
  clean_metadata[[col]] <- as.factor(clean_metadata[[col]])
}
str(clean_metadata)
# ----------------------------------------------------------------------------------------------------------------

# 4. Converting Factors to Numeric Codes

# Choose one or more factor columns (e.g., smoking_status).
# Convert "Yes" to 1 and "No" to 0 using a for loop.

binary_cols <- c("smoker", "diagnosis")

for (col in binary_cols) {
  if (col == "smoker") {
    clean_patient_data[[col]] <- ifelse(clean_patient_data[[col]] == "Yes", 1, 0)
  } else if (col == "diagnosis") {
    clean_patient_data[[col]] <- ifelse(clean_patient_data[[col]] == "Cancer", 1, 0)
  }
}


str(clean_patient_data)
# ----------------------------------------------------------------------------------------------------------------

#  Verification:
#    Compare the original and modified datasets to confirm changes.
#    str(original_data)
#    str(data)

str(patient_data)
str(clean_patient_data)

str(meta_data)
str(clean_metadata)

# Save file  as CSV in results folder
write.csv(clean_patient_data, file = "clean_data/clean_patient_data.csv")
write.csv(clean_metadata, file = "clean_data/clean_metadata.csv")

# Save the entire R workspace
save.image(file = "Swati_class_Ic_Practice.RData")
# ----------------------------------------------------------------------------------------------------------------

# Final Note:
# All instructions are written as comments.
# For actual code execution, remove the # symbol from each line you want to run.