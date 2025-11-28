# Depression Analysis Report (2012–2018)
Power BI • SQL • Data Modelling • Confidence Interval Analysis  
Author: **Joseph Innocent**

---

## Overview

This project analyzes depression percentages, frequencies, and confidence interval (CI) spreads across multiple demographic strata from **2012 to 2018**.  
The objective is to identify:

- Key demographic factors influencing depression  
- How depression changes over time  
- Groups with high stability vs high uncertainty  
- Age, income, sex, race, and education patterns  
- Year-to-year trends and anomalies  

The analysis is supported by SQL queries for exploration and Power BI dashboards for visualization.

---

## Dataset Information

The dataset includes:

- Depression Percent  
- Frequency (number of cases)  
- Upper 95% Confidence Limit  
- Lower 95% Confidence Limit  
- Demographic strata (Age, Sex, Race/Ethnicity, Education, Income)  
- Year: 2012–2018  

---

# Tools Used

| Tool | Purpose |
|------|---------|
| SQL | Data cleaning, exploration, transformation |
| Power BI | Data modelling, visualization, dashboard creation |
| Excel/CSV | Data manipulation |
| DAX | KPI and calculated measures |

---
## Project Structure

📦 Depression-Analysis-2012-2018
┣ 📊 PowerBI-Dashboard.pbix
┣ 📁 Data
┃ ┗ depression_data.csv
┣ 📄 SQL_Queries.sql
┣ 📄 README.md
---
## VISUALIZATION 

# Dashboard 3 — Trend Analysis (2012–2018)
![VISUALIZATION 1](https://github.com/user-attachments/assets/d85caf76-4da3-40a4-8138-7ecb53336c80)
### Trend KPIs
- **Minimum Percent Year:** 2015 (3.97%)  
- **Maximum Percent Year:** 2017 (33.09%)  

### Observations
- Depression percent gradually increased from 2012 to 2014.  
- 2015 shows a temporary decline.  
- Strong upward spike between 2016 and 2017 (peak year).  
- Slight decline in 2018.  
- Frequency trends differ from percent trends, suggesting possible changes in population or reporting.

---
# Dashboard 2 — Comparison Across Strata

![VISUALIZATION 2](https://github.com/user-attachments/assets/38b1dca0-78ee-453b-926a-8fb0e4d0bd06)

### Findings
- **Income** contributes the largest portion of depression percent.  
- **Age** is the second-highest contributor.  
- Age group **55–64 years** reports the highest depression percent.  
- **Females** have the highest frequency of depression cases.  
- **White** individuals also report high frequencies.  
- Income-based strata show varying patterns across years.

These results indicate strong socioeconomic and demographic influences.

---
# Dashboard 3 — Distribution & CI Spread Analysis

![VISUALIZATION 1](https://github.com/user-attachments/assets/5e2c99b1-751a-4e80-8d27-b80970d1152b)

### Key KPIs
- **Max CI Spread:** 23.73  
- **Min CI Spread:** 1.26  
- **Strata with Maximum CI Spread:** Other  
- **Strata with Minimum CI Spread:** Multiple stable demographic groups  

### Insights
- High CI Spread indicates low certainty or inconsistent data.  
- Low CI Spread suggests stable, trustworthy values.  
- The **"Other"** category shows extremely high uncertainty.  
- Most sex and age groups show small CI spreads, meaning consistent estimation.

  ---

# Key Insights Summary

- **Income** and **Age** have the strongest association with depression levels.  
- Depression is highest among individuals aged **45–64 years**.  
- **Females** record the highest frequency of cases.  
- Most demographic groups show **low CI spreads**, meaning consistent data.  
- The **“Other”** group has the highest uncertainty and may require data review.  
- 2017 marks the peak year for depression in the dataset.

---

# Recommendations

### Public Health Stakeholders
- Prioritize interventions for **middle-aged adults (45–64)**.  
- Address income-related mental-health stressors.  
- Improve data quality for high-uncertainty groups.

### Researchers
- Investigate reasons behind the 2017 spike.  
- Conduct deeper analysis on gender-based trends.




