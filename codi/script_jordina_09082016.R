#0. Kaggle 03-08-2015####

  setwd("/Volumes/Jordina/KAGGLE")


#1. Packages####

  require('dplyr')
  require('lubridate')
  require('ggplot2')
  require('data.table')
  require('data.table')

#2. Load data####

  #train
  train <- fread("input/gender_age_train.csv", colClasses=c("character", "character", "integer", "character"))

  #test
  test <- fread("input/gender_age_test.csv", colClasses=c("character"))

  #app
  app_label <- fread("input/app_labels.csv", colClasses=rep("character", 1))
  categories_label <- fread('input/label_categories.csv', colClasses=c("character", "character"))

  app_events <- fread("input/app_events.csv", colClasses=rep("character", 4))  #app_events <- read.csv("input/app_events.csv")
  
  #device
  brand <- fread("input/phone_brand_device_model.csv", colClasses=c("character", "character", "character"))

  #events
  events <- fread("input/events.csv", colClasses=c("character", "character", "character", "numeric", "numeric"))


#3. Preprocessing####

  #get the joined dataset
  s1 <- left_join(events, app_events)
  s2 <- left_join(s1, brand)
  s3 <- inner_join(s2, train)
  s4 <- left_join(s3, app_label)
  s5 <- left_join(s4, categories_label) %>% data.frame()
  saveRDS(s5, "output/sortida_jordina.csv")

 
#4. Others####

  #length(unique(events$event_id)) #3.252.950

  #length(unique(app_events$event_id)) #1.488.096

  #length(unique(events$device_id)) #60.865
  
  #length(unique(brand$device_id)) #186.716
  
  #length(unique(train$device_id)) #74.645

  #length(unique(app_events$app_id)) #19.237

  #length(unique(app_label$app_id)) # 108.162

  #length(unique(app_label$label_id)) # 507

  #length(unique(app_label$label_id)) # 507
  
  #length(unique(categories_label$label_id)) # 930
  
