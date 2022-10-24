# Pewlett-Hackard Challenge
Data Bootcamp week 7 - SQL

## Overview of Analysis
This challenge builds on guided homework exercises based on a scenario in which a large company (Pewlett Hackard) needs data about the impact of baby boomers' impending retirement from the company, aka the "silver tsunami". The challenge requires importing data from .csv files, building a Postgres database from that data, and writing SQL queries to filter information and answer questions.

This challenge has three tasks:
* Determine the number of employees nearing retirement age by title,
* Identify younger employees who would be eligible to participate in a mentorship program, and
* Analyze the information from the first two tasks to provide management recommendations.

Code to reproduce the tables and queries is available here: INSERT SQL FILE 

## Results

### Potential Retirees
Potential retirees are considered to be current employees who were born between 1952-01-01 and 1955-12-31.

* The total number of potential retirees is 72,458 (as captured in [unique_titles.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/unique_titles.csv)).

* Of that total, 70% of potential retirees are currently either Senior Engineers or Senior Staff, as shown in the table below (and in  [retiring_titles.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/retiring_titles.csv)). 

* An additional 24% of potential retirees are currently either Engineers or Staff.

### Mentorship Eligibility
Employees who are eligible for a mentorship program are considered to be current employees who were born in 1965.

* There are 1,549 employees who meet the age threshold for mentorship eligibility (as captured in [mentorship_eligibility.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/mentorship_eligibility.csv))

## Summary
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 


