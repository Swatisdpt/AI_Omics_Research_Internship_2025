# 1. Set Working Directory
# Create a new folder on your computer "AI_Omics_Internship_2025".
# 2. Create Project Folder
# In RStudio, create a new project named "Module_I" in your "AI_Omics_Internship_2025" folder.
# Inside the project directory, create the following subfolders using R code:
# raw_data, clean_data, scripts, results or Tasks, plots etc

dir.create("raw_data")     # For storing raw data files
dir.create("clean_data")   # For storing clean data files
dir.create("scripts")      # For saving R scripts
dir.create("results")      # For saving analysis outputs

# ---------------------------------------------------------------------------
# 3. Download "patient_info.csv" dataset from GitHub repository

# load the dataset into your R environment

patient_data <- read.csv(file.choose())

# Inspect the structure of the dataset using appropriate R functions

View(patient_data)
str(patient_data)

# Identify variables with incorrect or inconsistent data types.

# Convert variables to appropriate data types where needed

patient_data$gender <- as.factor(patient_data$gender)
patient_data$diagnosis <- as.factor(patient_data$diagnosis)
patient_data$smoker <- as.factor(patient_data$smoker)

# Create a new variable for smoking status as a binary factor:
# 1 for "Yes", 0 for "No"

patient_data$smoking_status <- factor(patient_data$smoker,
                                      levels = c("Yes", "No"),
                                      labels = c(1, 0))



# Save the cleaned dataset in your clean_data folder with the name patient_info_clean.csv

write.csv(patient_data, file = "clean_data/patient_info_clean.csv")

# Workspace

save.image(file = "Swati_Class_Ib_Assignment.RData")

# Save your R script in your script folder with name "class_Ib"
# Upload "class_Ib" R script into your GitHub repository