
# **STAGE ZERO TASK: Organizing "Threonine Team 2" Members' Data With R**  
***
## **Introduction**

  The Hackbio Biocoding Internship is an intensive 5-week program that focuses on learning coding and applying machine learning algorithms to life sciences. Participants are divided into teams of five, each named after different amino acids. My team, the second **"Threonine Team-2,"** consists of 5 members represented by the codons **ACA, ACT, ACC, and ACG**. For the stage zero task, we were tasked with using R to organize and present details of our team members in a clear and logical format. This includes their ***first name, last name, Slack username, email, hobby, country, discipline, and preferred programming language***.
  
***
### **METHOD**
**R Studio Setup**

**R Version:** I used R version 4.1.0 for this task.

**IDE:** RStudio was used as the integrated development environment for coding and executing the R script.

#### ***Data Collection***
Each team member provided their details on our team's Slack channel, which were then manually entered into our coding environment for computation.

#### ***Steps In Coding:***
***1. Combining Data into a List:***

 We began by creating a list named "details" where each member's information was grouped under headings. Vectors were used for each attribute (first names, last names, Slack usernames, etc.) to represent the data for each member of Threonine Team-2.
 ***
```
details <- list(
  first_name = c("Tyler", "Mahpara", "Peter", "Gracious", "Terry"),
  last_name = c("Maire", "Abid", "Imonte", "Isoah", "Ngala"),
  slack_username = c("Tyler", "Mahpara", "Perex", "Gracious", "Terry"),
  email = c("tam357a@gmail.com", "mahparaabid97@gmail.com", "imontepez@gmail.com", "isoahgracious@gmail.com", "terryngala9@gmail.com"),
  hubby = c("Carpentry", "Enjoying nature", "Playing music", "Reading", "Travelling"),
  country = c("United States", "Pakistan", "Nigeria", "Nigeria", "Kenya"),
  discipline = c("Bioinformatics", "Biotechnology", "Biomedical Technology", "Microbiology", "Biochemistry"),
  programming_language = c("R", "R", "R", "R", "R")
)
print(Interns_data)
```



#### ***2. Creating a DataFrame:***
Next, we converted the list into a data frame, named **"interns_data"**, to organize the information into a table format. Each column in the data frame represents one of the attributes, and each row corresponds to a team member.

#### ***3. Final print statement***
The final step involves displaying content of the organized data dataframe using the print () function. The output displayed is a table with  8 columns and 5 rows, where the rows represent different information heading and the 5 rows is for each team member of the Threonine team-2.
***

```
#insert the list above into a data frame then print
Interns_data <- data.frame(
  FirstName = details$first_name,
  LastName = details$last_name,
  Slack_UserName = details$slack_username,
  Email = details$email,
  Hubby = details$hubby,
  Country = details$country,
  Discipline = details$discipline,
  Programming_Language = details$programming_language
)
print(Interns_data)

```
***
#### **CONCLUSION**
This task illustrates basic data management in R, showcasing how to collect, organize, and display information systematically. Starting with a list allowed for flexible data entry, while transforming it into a data frame provided a structured view, suitable for further analysis or modifications. This method was straightforward, focusing on essential R functionalities without employing complex programming constructs.

