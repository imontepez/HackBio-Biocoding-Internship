 #Hackbio task 2.7 Public Health
#githublink: https://github.com/imontepez/HackBio-Biocoding-Internship/tree/main/stage_2
# link to the linkedin profile:
https://www.linkedin.com/in/peter-imonte-biomedical-reseacher-data-analyst/
#Threonine team_2:
#Terry_ngala: https://github.com/Terryida
#Tyler: https://github.com/tylermaire
#Perex: https://github.com/imontepez
#Gracious: https://github.com/Graciousisoah
#Mahpara: https://github.com/mahpara97

'''
 NHANES is a program run by the CDC to assess the health and nutritional status of adults and children in the US. 
 It combines survey questions and physical examinations, including medical and physiological measurements 
 and laboratory tests, and examines a representative sample of about 5,000 people each year. 
 The data is used to determine the prevalence of diseases and risk factors, 
 establish national standards, and support epidemiology studies and health sciences research. 
 This information helps to develop public health policy, design health programs and services, 
  #and expand the nation's health knowledge.

'''
 #load libraries
 library(ggplot2)
 library(ggpubr)
 library(dplyr)
 
#Load the dataset using its URL link into i dataframe
task4 = read.csv("https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/nhanes.csv", header = TRUE, sep = "," )
head(task4)

#Check for Missing Values

summary(factor(is.na(task4)))


colSums(is.na(task4))


#Process all NA (either by deleting or by converting to zero)
# Handle Missing Values  by Replacing NAs in data frame with 0
task4[is.na(task4)] <- 0

# View data frame
task4

#Verify Missing Values After Replacement
summary(factor(is.na(task4)))

# Visualize the distribution of BMI, Weight, Weight in pounds (weight *2.2) and Age with an histogram.
ggplot(task4, aes(BMI)) +
  geom_histogram(binwidth = 3, color = "brown") +
  labs(x = "BMI(Kgs/m2)", y = "Frequency") +
  theme_classic() +
  theme(text = element_text(size = 12, face = "bold"))
ggplot(task4, aes(Weight)) +
  geom_histogram(binwidth = 3, color = "blue") +
  labs(x = "Weight(Kgs)", y = "Frequency") +
  theme_classic() +
  theme(text = element_text(size = 12, face = "bold"))
ggplot(task4, aes(Weight*2.2)) +
  geom_histogram(binwidth = 3,color = "green") +
  labs(x = "Weight(pounds)", y = "Frequency") +
  theme_classic() +
  theme(text = element_text(size = 12, face = "bold"))
ggplot(task4, aes(Age)) +
  geom_histogram(binwidth = 3, color ="yellow") +
  labs(x = "Age(Years)", y = "Frequency") +
  theme_classic() +
  theme(text = element_text(size = 12, face = "bold"))
  
  
#What’s the mean 60-second pulse rate for all participants in the data?
mean(task4$Pulse)

# What’s the range of values for diastolic blood pressure in all participants? (Hint: see help for min(), max()).
range(task4$BPDia)

# What’s the variance and standard deviation for income among all participants?
var(task4$Income)

sd(task4$Income)

# Visualize the relationship between weight and height ?
# Color the points by
# gender
# diabetes
# smoking status

ggscatter(task4, 
         x = "Weight", 
         y ="Height",
     color = "Gender", 
     shape = 17, 
      size = 3, # Points color, shape and size
       add = "reg.line",  # Add regressin line
add.params = list(color = "black", fill = "lightgray"), # Customize reg. line
  conf.int = TRUE, # Add confidence interval
  cor.coef = TRUE, # Add correlation coefficient. see ?stat_cor
cor.coeff.args = list(method = "pearson", label.y=250, label.x =120,
                                label.sep = "\n")) +
labs(x = "Weight(in Kgs)", 
    y = "Height(in cm)")+
theme(text = element_text(size = 10))


ggscatter(task4, 
         x = "Weight", 
         y ="Height",
     color = "Diabetes", #shape = 21, size = 3, # Points color, shape and size
       add = "reg.line",  # Add regressin line
add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
  conf.int = TRUE, # Add confidence interval
  cor.coef = TRUE, # Add correlation coefficient. see ?stat_cor
cor.coeff.args = list(method = "pearson", label.y=250, label.x =120,
                                label.sep = "\n")) +
  labs(x = "Weight(in Kgs)", 
  y = "Height(in cm)")+
  theme(text = element_text(size = 10))
  
ggscatter(task4, 
         x = "Weight", 
         y ="Height",
     color = "SmokingStatus", #shape = 21, size = 3, # Points color, shape and size
       add = "reg.line",  # Add regressin line
add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
  conf.int = TRUE, # Add confidence interval
  cor.coef = TRUE, # Add correlation coefficient. see ?stat_cor
cor.coeff.args = list(method = "pearson", label.y=250, label.x =120,
                                label.sep = "\n")) +
  labs(x = "Weight(in Kgs)",
       y = "Height(in cm)")+
  theme(text = element_text(size = 10))
  
  
''' 
 Conduct t-test between the following variables and make conclusions on the relationship between them based on P-Value
 Age and Gender
 BMI and Diabetes
 Alcohol Year and Relationship Status

'''
 
# Independent t-test
t.test(Age ~ Gender, data = task4)

# Since the p-value (p=0.08022) is greater than 0.05, we fail to reject the null hypothesis and conclude that there is no statistically significant difference in age between females and males.
  
 #t.testBMI <- task4 %>%filter(!Diabetes %in% "0")
  #t.test(BMI ~ Diabetes, data = t.testBMI)  OR
  
t.testBMI <- task4 %>% filter(Diabetes %in% c("Yes", "No"))
t.test(BMI ~ Diabetes, data = t.testBMI)

#print(t.testBMI)

# Since the p-value is less than 0.05 (p<2.2×10 −16), we reject the null hypothesis and conclude that there is a statistically significant difference in BMI between individuals with and without diabetes.


t.testAlcohol <- task4 %>% filter(RelationshipStatus %in% c("Single", "Committed"))
t.test(AlcoholYear ~ RelationshipStatus, data = t.testAAlcohol)

# Since the p-value (p=3.388×10−8) is less than 0.05, we reject the null hypothesis and conclude that there is a statistically significant difference in yearly alcohol consumption between individuals who are in a committed relationship and those who are single.

