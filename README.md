# Pewlett-Hackard Challenge
Data Bootcamp week 7 - SQL

## Overview of Analysis
This challenge builds on guided homework exercises based on a scenario in which a large company (Pewlett Hackard) needs data about the impact of baby boomers' impending retirement from the company, aka the "silver tsunami". The challenge requires importing data from .csv files, building a Postgres database from that data, and writing SQL queries to filter information and answer questions.

This challenge has three tasks:
* Determine the number of employees nearing retirement age by title,
* Identify younger employees who would be eligible to participate in a mentorship program, and
* Analyze the information from the first two tasks to provide management recommendations.

Code to reproduce the tables and queries is available [here](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/queries/Employee_Database_challenge.sql)

## Results

### Potential Retirees
Potential retirees are considered to be current employees who were born between 1952-01-01 and 1955-12-31.

* The total number of potential retirees is 72,458 (as captured in [unique_titles.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/unique_titles.csv)).

* Of that total, 70% of potential retirees are currently either Senior Engineers or Senior Staff, as shown in the table below (and in [retiring_titles.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/retiring_titles.csv)).

![table with potential retirees by title](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/resources/retiring_titles.png)

* An additional 24% of potential retirees are currently either Engineers or Staff.

### Mentorship Eligibility
Employees who are eligible for a mentorship program are considered to be current employees who were born in 1965.

* There are 1,549 employees who could be mentees because they meet the age threshold for mentorship eligibility (as captured in [mentorship_eligibility.csv](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/data/mentorship_eligibility.csv))

## Summary
In requesting this analysis, Pewlett Hackard's leadership presented two key questions. 

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

As stated above, as many as 72,458 employees could be retiring in the near to short term. Since it is unlikely that all retirement-eligible employees will leave at once, we can expect a staggered, but still significant, impact.  

In addition to understanding which title categories are most affected, it also important to look at whether departments may be affected differently. As shown below, Development, Production, and Sales will be most heavily affected.

![table with counts of retiring employees by department](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/resources/ret_count_by_dept.png)

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 

Based on title categories, it would appear that there are sufficient potential retirees to provide mentorship before they depart the company. 

The table below lists the number of employees by current title, first for potential retirees (ret_count) and then for potential mentees (mentee_count). Given that the retirement pool has at least one if not two orders of magnitude more people in it than in the next highest title category (if applicable), it would appear that there are sufficient numbers of people to create a mentorship program.

![title categories with counts by retirees, mentees](https://github.com/larabjork/pewlett-hackard-analysis/blob/main/resources/count_retire_mentor_titles.png)

Given the scale of likely retirements, Pewlett Hackard leadership may want to:

* Expand the pool of potential mentees to a wider age range (birth years 1965 to 1967, for example),
* Identify departments at particular risk of talent loss,
* Develop a complementary mentorship program for to ensure that at all experience levels, there is growth potential and a way to backfill positions if promotions are made at the senior levels, and
* Examine existing systems for institutional memory of processes, procedures, culture, client relationships, and other factors.







