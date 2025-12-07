#class_2_practice
getwd()
setwd("C:/Users/swati/OneDrive/Desktop/AI_Omics_Internship_2025/Module_I")

# Calculate BMI of two dataset within loop

# Define input and output folders
input_dir <- "raw_data" 
output_dir <- "results"


# create output folder if not already exist

if(!dir.exists(output_dir)){
  dir.create(output_dir)
}


# List which files to process
files_to_process <- c("BMI_data_1.csv", "BMI_data_2.csv") 
# These must match exactly with the names in your working folder,
# otherwise R will not find them.

# Prepare empty list to store results in R 
result_list <- list()

#defined funcion
calculate_BMI <- function(weight, height){
  # Perform the BMI calculation
  bmi <- weight / (height^2)
  
  # Return the BMI value
  return(bmi)
}

# For each file within a loop:
#       - import data
#       - handle NA values
#       - calculate BMI using calculate_BMI function
#       - save results (both as CSV and inside R list)


for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")
  
  input_file_path <- file.path(input_dir, file_names)
  
  # Import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values...\n")
  
  # handling missing values
  
  if("height" %in% names(data)){
    missing_count <- sum(is.na(data$height))
    
    cat("Missing values in 'height':", missing_count, "\n")
    data$height[is.na(data$height)] <- mean(data$height, na.rm = TRUE)
  }
  
  if("weight" %in% names(data)){
    missing_count <- sum(is.na(data$weight))
    
    cat("Missing values in 'weight':", missing_count, "\n")
    data$weight[is.na(data$weight)] <- mean(data$weight, na.rm = TRUE)
  }
  # calculate BMI
  data$bmi <- calculate_BMI(data$weight, data$height)
  cat("BMI has been calculated successfully.\n")
  
  # save results in R
  result_list[[file_names]] <- data 
  
  # save results in Results folder
  output_file_path <- file.path(output_dir, paste0("BMI_results", file_names))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
}

# The loop repeats until all files are processed.

results_1 <- result_list[[1]] 
results_2 <- result_list[[2]]

save.image(file = "Swati_Class_2_Practice.RData")
