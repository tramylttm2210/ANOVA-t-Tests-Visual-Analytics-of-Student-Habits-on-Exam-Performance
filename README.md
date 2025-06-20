# Student Performance Analysis

## Purpose  
To analyze the behavioral and lifestyle factors that influence academic performance using a 5,000-record dataset on student habits. The project combines data cleaning, exploratory visualizations, and hypothesis testing to identify which modifiable behaviors—such as study hours, sleep, and social media use—predict exam success, and provides data-driven recommendations for academic support.

## Tools & Packages  
**Data Cleaning & Transformation:** `dplyr`, `stringr`, `forcats`  
**Visualization:** `ggplot2`  
**Statistical Testing:** One-way ANOVA, One-sample and Two-sample t-tests (`stats`)  

## Project Overview  
- Cleaned and standardized 5,000 student records:  
  - Renamed variables for clarity  
  - Converted daily study hours to weekly totals  
  - Re-coded gender and job-status as factors  
  - Standardized label casing and text values  
- Segmented behavioral variables based on performance thresholds:
  - High-achievers: Exam score ≥ 80  
  - Low-achievers: Exam score < 60  
  - Sufficient sleep: >7 hours/night  

## Exploratory Data Analysis  

### Distributions & Group Comparisons  
- **Histograms:** Showed bell-curve exam score distribution (~70–75)  
- **Boxplots:** Revealed no meaningful performance differences across gender, diet, or part-time job status  
- **Scatter Plot:** Highlighted a strong positive relationship between weekly study hours and exam scores  

### Key Behavioral Insights  
- High-performing students tend to study ~5 hrs/day  
- Low-performing students spend ~2.7 hrs/day on social media  
- Students who sleep >7 hours perform better than those who sleep less  

## Statistical Testing  

### One-Way ANOVA  
- **Study Hours vs. Exam Score**  
  - F = 2135.882, p < 0.001  
  - Confirmed significant impact of weekly study hours on exam outcomes  
  - Other factors (gender, job, diet) showed no significant effects  

### One-Sample & Two-Sample T-Tests  
- **Study Time (High Achievers):**  
  - t = 23.40, p ≪ 0.001  
  - High scorers studied significantly more than average  
- **Social Media (Low Achievers):**  
  - t = 3.36, p < 0.001  
  - Low scorers used social media significantly more than average  
- **Sleep Duration (>7h vs ≤7h):**  
  - t = 3.16, p < 0.001  
  - Longer sleepers scored significantly higher  

## Forecasting & Actionable Insight  
- **+1 hour of study/day** → likely score increase  
- **+1 hour of sleep/night** → measurable performance boost  
- **–0.23 hour of social media/day** → associated with improved outcomes  
- Time-use strategies (e.g., structured study plans, healthy sleep routines) can help students sustainably improve performance

## Recommendations  
- Encourage students to study at least 5 hrs/day for academic excellence  
- Promote healthy sleep (>7 hrs/night) through scheduling and mental health support  
- Reduce unproductive social media time while respecting its social or emotional roles  
- Avoid overemphasizing demographic factors (e.g., gender, diet, job), which showed no direct performance impact

## Data Source  
Dataset: [Kaggle – Student Habits vs Academic Performance](https://www.kaggle.com/datasets/jayaantanaath/student-habits-vs-academic-performance)
