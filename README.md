# Student Performance Analysis - ANOVA, t-Tests & Visual Analytics of Student Habits on Exam Performance

## Purpose  
To investigate how daily habits (study time, sleep, social media use) and demographic/lifestyle factors (gender, diet quality, part-time job) influence exam outcomes among university students. This R-based analysis combines data cleaning, exploratory visualization, ANOVA and t-tests to generate actionable recommendations for student support.

---

## Tools & Packages  
- **Data cleaning & wrangling:** `tidyverse` (`dplyr`, `readr`), `janitor`, `lubridate`  
- **Visualization:** `ggplot2`  
- **Statistical analysis:** base `stats` (ANOVA, one-sample & two-sample t-tests)  

---

## Project Overview  
1. **Data Preparation**  
   - Renamed variables for clarity  
   - Converted daily study hours to weekly totals  
   - Recoded `gender` & `job_status` as factors  
   - Standardized text labels  

2. **Exploratory Profiling**  
   - Frequency tables & histograms for exam scores, study hours, diet quality, gender, job status  
   - Boxplots comparing score distributions by gender, diet & job  
   - Scatter plot of study hours vs. exam score  

3. **Statistical Validation**  
   - **One-way ANOVA**: effect of weekly study hours on exam outcomes (F = 2135.882, p < 0.001)  
   - **One-sample t-test**:  
     - High-achievers (score ≥ 80) study time (t = 23.40, p ≪ 0.001)  
     - Low-achievers (score < 60) social-media use (t = 3.36, p < 0.001)  
   - **Two-sample t-test**:  
     - Sleep > 7 h vs. ≤ 7 h on exam scores (t = 3.16, p < 0.001)
     
      ## Insights  
- **Study Time**: Each additional hour of weekly study is associated with an estimated score gain of **X** points.  
- **Sleep**: Increasing daily sleep by 1 hour predicts an average score improvement of **Y** points.  
- **Social Media**: Reducing social media use by ~0.23 hours/day yields a modest but significant score increase.  
- **Demographics**: Gender, diet quality, and part-time job status showed no meaningful impact on exam performance.

---

**Actionable Insights**  
   - +1 h/week study → estimated score gain  
   - +1 h sleep/day or –0.23 h social media → measurable improvements  
