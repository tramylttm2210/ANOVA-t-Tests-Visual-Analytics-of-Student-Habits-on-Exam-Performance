
# Load libraries
library(ggplot2)
library(gmodels)
library(dplyr)

# Import dataset
data <- read.csv("student_habits_performance.csv", stringsAsFactors = FALSE)

# Data Cleaning and Transformation
# Rename data
data <- rename(data, study_hours_per_week = study_hours_per_day)

# Drop unnecessary variables 
data <- select(data, -student_id)

# Keep only relevant variables 
data <- select(data, gender, study_hours_per_week, exam_score, part_time_job, 
               diet_quality)

#Clean text with gsub()
data$diet_quality <- gsub(" ", "_", data$diet_quality)

# Apply appropriate data structures
data$gender <- as.factor(data$gender)
data$exam_score <- as.numeric(data$exam_score)
data$part_time_job <- as.factor(data$part_time_job)
data$study_hours_per_week <- as.numeric(data$study_hours_per_week)

#  Histograms

# a - Histogram of exam_score
ggplot(data, aes(x = exam_score)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Exam Scores", x = "Exam Score", y = "Frequency")

# b - Histogram of exam_score by diet_quality
ggplot(data, aes(x = exam_score, fill = diet_quality)) +
  geom_histogram(position = "dodge", bins = 10, color = "black") +
  labs(
    title = "Exam Score Distribution by Diet Quality",
    x = "Exam Score",
    y = "Number of Students",
    fill = "Diet Quality",
    caption = "Source: Student Habits Survey"
  ) +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    legend.position = "right"
  )
# c - Boxplot of exam_score by gender
ggplot(data, aes(x = gender, y = exam_score, fill = gender)) +
  geom_boxplot() +
  labs(title = "Exam Score by Gender", x = "Gender", y = "Exam Score")

#d - Boxplot of exam_score by part_time_job
ggplot(data, aes(x = part_time_job, y = exam_score, fill = part_time_job)) +
  geom_boxplot() +
  labs(title = "Exam Score by Part-Time Job Status", x = "Part-Time Job", 
       y = "Exam Score")
#e - Study_hours_per_week Scatter Plot 

ggplot(data, aes(x = study_hours_per_week, y = exam_score)) +
  geom_point(alpha = 0.5, color = "steelblue") +
  geom_smooth(method = "lm", color = "darkred", se = FALSE) +
  labs(
    title = "Relationship between Study Hours per Week and Exam Score",
    x = "Study Hours per Week",
    y = "Exam Score"
  ) +
  theme_minimal()


# ANOVA
anova_model <- aov(exam_score ~ study_hours_per_week + gender + part_time_job 
                   + diet_quality, data = data)
summary(anova_model)


