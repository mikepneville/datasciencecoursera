---
title: "README"
author: "Mike Neville"
date: "February 19, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
Institution: Johns Hopkins Coursera
 Program: Certificate in Data Science
 Course: Getting and Cleaning Data
 Assignment: Week 4 Course Project
 Title: run_analysis.R
 Purpose: Demonstrate ability to collect, work with, and 
 clean a data set. 
 Goal: Prepare tidy data that can be used for later 
 analysis.

The run_analysis.R code will perform a series of actions
to create a dataset called 'TidyData' for analysis.  The
Source or raw data come from the UCI machine learning repo
located at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data consist of measurements taken across 30 subjects
while wearing a Samsung Galaxy S attached at the hip.
Subjects performed several actions, such as sitting, standing
walking, etc.  The Samsung smartphone gathered triaxial 
data from its built in gyroscope and accelerometer.  These
data were further processed to produce the source dataset.

The run_analysis.R code will check if the data files are 
present and if not, systematically download the data
from its source at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip the files and prepare the data for analysis.

Specifically, the data exist in several separate files.  The files are combined into a single large dataset called 'MData' and then a subset of the features (variables) are returned to another dataset called 'sub_MData'.  Variables for Activity and Subject are renamed as such to be intelligible and the measurement data are grouped by Activity and Subject calculating the mean of each.  The final results are stored in a dataset called 'TidyData'.  The first 10 rows and 4 columns are printed to the console.

Citation:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
