# ROC-Curve-Comparison-Logistic-Regression-vs.-Random-Forest-in-Predicting-Obesity-from-Weight
This R script demonstrates binary classification of obesity status using logistic regression and random forest based on weight measurements. It showcases model fitting using glm() for logistic regression and visualizes model performance with ROC curves using the pROC package. Customizations include percent-based axes, color-coded curves, partial AUC polygons, and comparison of model discrimination ability. The script extracts and filters threshold-based sensitivity/specificity insights for further performance evaluation.
What’s Happening in the Code
Here’s a breakdown of the key steps:

Data Generation:

Simulates weight data from a normal distribution.

Creates obese as a binary outcome increasing with ranked weight (higher weight → more likely obese).

Logistic Regression Model:

Fits a binary logistic regression (glm) to predict obese based on weight.

Adds the predicted values as a smooth curve to a scatterplot.

ROC Curve Visualization:

Uses roc() from the pROC package to plot ROC curves for the logistic model.

Includes customized labels, colored lines, and percent-based axes.

Extracts ROC curve data into a dataframe for exploring thresholds vs sensitivity/specificity.

AUC Display:

Displays area under curve (AUC), including partial AUC highlighting high-sensitivity regions.

Random Forest Comparison:

(Note: Your script calls rf.model but doesn't define it — you'd need to train a random forest model first).

Plots the random forest ROC curve beside logistic regression for visual comparison.

Adds a legend to differentiate models.
