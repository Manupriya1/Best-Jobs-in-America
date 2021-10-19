# Best-Jobs-in-America

# Movie Recommendation Project
Designing a Movie Recommendation System
## Click here for [*Data*](https://www.kaggle.com/susant4learning/bestjobsin2021)

## Dimensional Modelling
*Business Value*: To explore what is the best jobs in the USA in 2021

*Grain:* Jobs postings in the month of April and May for Year 2021.

### Dimensions
- Dim_Address > address, postalCode, country, latitude, longitude, locality, region
- Dim_Jobs > education, description, title, skills, experiece, id, company, employment_type
### Facts:
1. FK_1_address_id
3. FK_2 job_id
4. posted_at
5. salary

## Logical Model
![Logical Data Model-jobs(BIMarathon 2021)](https://user-images.githubusercontent.com/69255270/137607326-472f9da3-ef40-4108-825d-f75f912163cf.png)


## Physical Model

![Physical Data Model-jobs (Template BIMarathon 2021)](https://user-images.githubusercontent.com/69255270/137607935-4bf627e4-d86b-47c3-af4a-8a61e6f2bd6c.png)
