
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


# Read the dataset
df <- read.csv("student_habits_performance 2.csv")

# Question 1: 
# Do high-achieving students (exam score ≥80) spend more time studying per day than the overall average?
# (One-sided one-sample t-test)

# Calculate overall mean study hours
mean_study_hours_overall <- mean(df$study_hours_per_day, na.rm = TRUE)

# Filter high-achieving students
high_achievers <- df[df$exam_score >= 80, ]

# One-sided one-sample t-test: test if mean of high-achievers > overall mean
t_test1 <- t.test(
  high_achievers$study_hours_per_day,
  mu = mean_study_hours_overall,
  alternative = "greater"
)

# Print results
cat("RQ1: High-achieving students vs. overall mean study hours\n")
print(t_test1)

# Question 2:
# Do low-achieving students (exam score <60) spend more time on social media per day than the overall average?
# (One-sided one-sample t-test)

# Calculate overall mean social media hours
mean_social_media_overall <- mean(df$social_media_hours, na.rm = TRUE)

# Filter low-achieving students
low_achievers <- df[df$exam_score < 60, ]

# One-sided one-sample t-test: test if mean of low-achievers > overall mean
t_test2 <- t.test(
  low_achievers$social_media_hours,
  mu = mean_social_media_overall,
  alternative = "greater"
)

# Print results
cat("RQ2: Low-achieving students vs. overall mean social media hours\n")
print(t_test2)

# Question 3:
# Do students who sleep more than 7 hours per night achieve higher average exam scores than those who sleep 7 hours or less?
# (One-sided two-sample t-test)

# Create two groups based on sleep hours
sleep_more <- df[df$sleep_hours > 7, "exam_score"]
sleep_less_equal <- df[df$sleep_hours <= 7, "exam_score"]

# One-sided two-sample t-test: test if mean exam_score of sleep_more > sleep_less_equal
t_test3 <- t.test(
  sleep_more,
  sleep_less_equal,
  alternative = "greater"
)

# Print results
cat("RQ3: Students who sleep >7h vs. <=7h, exam scores\n")
print(t_test3)


