#Script for SimulationSimulation Study with Raj-yRajRaj

#load packages

  #Analysis Methods
  #Random Forest: Ranger in "ranger" package
  install.packages("ranger")
  library(ranger)

  #CART: conditional inference trees in "partykit" package
  install.packages("partykit")
  library(partykit)
  
  #Lasso: glmnet in 'glmnet' package
  install.packages("glmnet")
  library(glmnet)
  
  #ss or sm (depending on number of covariate) for smoothing splines from nate's npreg package
  install.packages("npreg")
  library(nprep)
  
  #Data Generation Methods:
  #MASS - generating data from the multivariate normal distribution using the mvrnorm function. 
  install.packages("MASS")
  library(MASS)
  

#simulation conditions
Conditions=list(
  #1) Sample Size
  
  "SampleSize"=c(outer(c(1,5),10^(2:6),FUN="*")), #100 to 5 millie in 10 steps
  
  #2) Factor Characteristics
  #2a) Number of Factors,
  "Number_of_Factors"=2^(1:6), #2 to 64 in 6 steps
  #2b) Factor Levels & 
  "Factor_Levels"=2^(2^(0:4)), #dichotomous to highly granular (e.g., continuous)
  #2c) Percent of Unimportant Factors 
  "Percent_Unimportant_Factors"= c(0,25,50,100), #0 (no unimportant) to 100% none of the factors are related to the outcome
  #3) Structure of Factors (independence/interactions)
  "Factor_Structure"=c("independent_zero_interrelations, uniform true variable importance","dependence/interaction between factors, skewed true variable importance"),
  #4) Distribution of Outcome
  "Distribution of Outcome"=c("Dichotomous","Categorical","ContinuousTightSD","ContinuousLargeSD"))

Conditions=expand.grid(Conditions)

#generate data

# Fed into MVR norm:
# ---Sample Size (SampleSize)
# ---Number of Factors (Number_of_Factors + 1)
# ---Building the interior matrix (Factor_Structure & Percent Unimportant Factors)
# ---Adjust outcome SD via 'Distribution of Outcomes'

# Post processing of MVR norm output: 
# ---Factor levels (polychotomizing MVR factor output)
# ---Distribution of Outcome (polychotomizing MVR Outcome output)






