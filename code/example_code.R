#Necessary packages
library(tidyverse)
library(ggpubr) #For plotting

#set working directory
setwd("C:/Users/tao_1/OneDrive/Documents/Fall2021/ABE305/Data_csv")

#read csv file
df <- read.csv("266.csv", skip = 7)

#find the maximum load N and corresponding extention
max_load = df$N[which.max(df$N)]
extension = df$mm[which.max(df$N)]

#plot
ggplot(df, aes(x = mm, y = N)) + 
  geom_point(color = "blue") +
  geom_vline(xintercept  = extension) + #add extention line
  geom_hline(yintercept = max_load) +   #add max load line
  ggtitle("Load(N) vs. extension of geotextile material") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("Extension (mm)") +
  ylab("Load (N)")