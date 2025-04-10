#Threonine team_2:
#Terry_ngala: https://github.com/Terryida
#Tyler: https://github.com/tylermaire
#Perex: https://github.com/imontepez
#Gracious: https://github.com/Graciousisoah
#Mahpara: https://github.com/mahpara97


#all the tools are installed and available for use already
install.packages("caret")
install.packages("randomForest")
install.packages("ggplot2")

#load the library
library(caret)
library(randomForest)
library(ggplot2)
library(dplyr)

#import the dataset
df_link = 'https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/cpg_methylation_age_data.csv'

df = read.csv(df_link)
head(df)

'''
-We will split the data into 80% training and 20% testing.
Why do we split the data?
We need to train the model on one dataset and test it on unseen data.
This prevents overfitting (when a model memorizes training data but fails on new data).
80% training and 20% testing is a common rule.

'''
set.seed(42)            #keeps the result reproducible 

train_index <- createDataPartition(df$Age, p = 0.8, list = FALSE)

train_data <- df[train_index, ]
test_data <- df[-train_index, ]

# Train the linear regression model
lm_model <- train(Age ~ ., data = train_data,
                  method = "lm",
                  trControl = trainControl(method = "cv", number = 5))     # 5-fold cross-validation

# Print model summary
summary(lm_model$finalModel)

# Train the Random Forest model
rf_model <- train(Age ~ ., data = train_data,
                  method = "rf",
                  trControl = trainControl(method = "cv", number = 5),
                  tuneLength = 3)  # Limited tuning to speed up

# Print model summary
print(rf_model)

'''
How do we measure model performance?
We use Root Mean Squared Error (RMSE): Lower RMSE means better performance.
#model evaluation on test data

'''
# Predict using Linear Regression
lm_predictions <- predict(lm_model, newdata = test_data)

# Predict using Random Forest
rf_predictions <- predict(rf_model, newdata = test_data)

# Compute RMSE (Root Mean Squared Error)
lm_rmse <- RMSE(lm_predictions, test_data$Age)
rf_rmse <- RMSE(rf_predictions, test_data$Age)

# Print RMSE
print(paste("Linear Regression RMSE:", round(lm_rmse, 2)))
print(paste("Random Forest RMSE:", round(rf_rmse, 2)))

#Feature Importance Analysis
# Extract feature importance from Random Forest
rf_importance <- varImp(rf_model)

# Plot top 20 important CpG sites
plot(rf_importance, top = 20)

#Visualizing Predictions vs. True Age
# Combine results for visualization
results <- data.frame(Actual_Age = test_data$Age,
                      Predicted_LM = lm_predictions,
                      Predicted_RF = rf_predictions)

# Plot
ggplot(results, aes(x = Actual_Age)) +
  geom_point(aes(y = Predicted_LM, color = "Linear Regression")) +
  geom_point(aes(y = Predicted_RF, color = "Random Forest")) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  labs(title = "Predicted vs. Actual Age",
       x = "Actual Age",
       y = "Predicted Age") +
  theme_minimal()

# Random Forest
#Feature Selection Using Recursive Feature Elimination (RFE)
# Define control using cross-validation
control <- rfeControl(functions = rfFuncs, method = "cv", number = 5)

# Run Recursive Feature Elimination (RFE)
rfe_result <- rfe(x = df[, -ncol(df)], y = df$Age, sizes = c(10, 20, 50, 100), rfeControl = control)

# Print the selected features
print(rfe_result)

#Selecting the Top Features
#Based on RFE, we select the top 50 CpG sites

top_features <- predictors(rfe_result)

# Keep only selected features
df_selected <- df %>% select(all_of(top_features), Age)

# View the first few rows
head(df_selected)

#Split Data into Training and Testing Sets
train_index <- createDataPartition(df_selected$Age, p = 0.8, list = FALSE)

train_data <- df_selected[train_index, ]
test_data <- df_selected[-train_index, ]

# Train Random Forest model with cross-validation
rf_model <- train(Age ~ ., data = train_data,
                  method = "rf",
                  trControl = trainControl(method = "cv", number = 5),
                  tuneLength = 3)  # Limited tuning to speed up

# Print model summary
print(rf_model)

#Model Evaluation on Test Data
#How do we measure model performance?
#We use Root Mean Squared Error (RMSE): Lower RMSE means better performance.

# Predict using Random Forest
rf_predictions <- predict(rf_model, newdata = test_data)

# Compute RMSE (Root Mean Squared Error)
rf_rmse <- RMSE(rf_predictions, test_data$Age)

# Print RMSE
print(paste("Random Forest RMSE:", round(rf_rmse, 2)))

#Feature Importance Analysis
# Extract feature importance
rf_importance <- varImp(rf_model)

# Plot top 20 important CpG sites
plot(rf_importance, top = 20)

#Visualizing Predictions vs. True Age

'''
Why visualize predictions?
Helps compare model predictions to actual values.
We want points close to the diagonal line (perfect prediction).

'''
# Combine results for visualization
results <- data.frame(Actual_Age = test_data$Age, Predicted_Age = rf_predictions)

# Plot
ggplot(results, aes(x = Actual_Age, y = Predicted_Age)) +
  geom_point(color = "blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Predicted vs. Actual Age",
       x = "Actual Age",
       y = "Predicted Age") +
  theme_minimal()

'''
Key Takeaways:
✅ Feature selection (RFE) reduced CpG sites from 200 to 50, improving model efficiency.

✅ Random Forest captured non-linear methylation-age relationships better than Linear Regression.

✅ Feature importance analysis identified the top CpG sites influencing age prediction.

This tutorial can be extended to real epigenetic datasets for biomedical research.

References:
https://www.datacamp.com/tutorial/linear-regression-R
'''
