#Necessary packages
library(tidyverse)
library(ggpubr) #For plotting

#set working directory
setwd("C:/Users/tao_1/OneDrive/Documents/Fall2021/ABE305/Data_csv")

colors <- c("Control" = "blue", "Moisture" = "red", "Frozen" = "yellow", "Warm" = "green")

#read data

#Recycle 
rec_c <- read.csv("269.csv", skip = 7)
rec_m <- read.csv("285.csv", skip = 7)
rec_f <- read.csv("297.csv", skip = 7)
rec_w <- read.csv("310.csv", skip = 7)

rec_c$mm <- rec_c$mm / 75
rec_c$N <- rec_c$N / (0.1 * 43.95) 
rec_m$mm <- rec_m$mm / 75
rec_m$N <- rec_m$N / (0.1 * 43.95) 
rec_f$mm <- rec_f$mm / 75
rec_f$N <- rec_f$N / (0.1 * 43.95) 
rec_w$mm <- rec_w$mm / 75
rec_w$N <- rec_w$N / (0.1 * 43.95)

#find the maximum load N and corresponding extention
max_load = rec_w$N[which.max(rec_w$N)]
extension = rec_w$mm[which.max(rec_w$N)]


#High 
high_c <- read.csv("267.csv", skip = 7)
high_m <- read.csv("287.csv", skip = 7)
high_f <- read.csv("301.csv", skip = 7)
high_w <- read.csv("312.csv", skip = 7)

high_c$mm <- high_c$mm / 75
high_c$N <- high_c$N / (0.13 * 38.92)
high_m$mm <- high_m$mm / 75
high_m$N <- high_m$N / (0.13 * 38.92)
high_f$mm <- high_f$mm / 75
high_f$N <- high_f$N / (0.13 * 38.92)
high_w$mm <- high_w$mm / 75
high_w$N <- high_w$N / (0.13 * 38.92)

#find the maximum load N and corresponding extention
max_load = high_w$N[which.max(high_w$N)]
extension = high_w$mm[which.max(high_w$N)]


#Econ 
econ_c <- read.csv("277.csv", skip = 7)
econ_m <- read.csv("292.csv", skip = 7)
econ_f <- read.csv("306.csv", skip = 7)
econ_w <- read.csv("315.csv", skip = 7)

econ_c$mm <- econ_c$mm / 75
econ_c$N <- econ_c$N / (0.13 * 42.37)
econ_m$mm <- econ_m$mm / 75
econ_m$N <- econ_m$N / (0.13 * 42.37)
econ_f$mm <- econ_f$mm / 75
econ_f$N <- econ_f$N / (0.13 * 42.37)
econ_w$mm <- econ_w$mm / 75
econ_w$N <- econ_w$N / (0.13 * 42.37)

#find the maximum load N and corresponding extention
max_load = econ_w$N[which.max(econ_w$N)]
extension = econ_w$mm[which.max(econ_w$N)]

#Plastic
pla_c <- read.csv("278.csv", skip = 7)
pla_m <- read.csv("294.csv", skip = 7)
pla_f <- read.csv("303.csv", skip = 7)
pla_w <- read.csv("317.csv", skip = 7)

pla_c$mm <- pla_c$mm / 75
pla_c$N <- pla_c$N / (0.05 * 42.33)
pla_m$mm <- pla_m$mm / 75
pla_m$N <- pla_m$N / (0.05 * 42.33)
pla_f$mm <- pla_f$mm / 75
pla_f$N <- pla_f$N / (0.05 * 42.33)
pla_w$mm <- pla_w$mm / 75
pla_w$N <- pla_w$N / (0.05 * 42.33)

#find the maximum load N and corresponding extention
max_load = pla_w$N[which.max(pla_w$N)]
extension = pla_w$mm[which.max(pla_w$N)]

#plot data
ggplot() +
  geom_point(data = rec_c, aes(x = mm, y = N, color = "Control"), size = 0.7) +
  geom_point(data = rec_m, aes(x = mm, y = N, color = "Moisture"), size = 0.7) +
  geom_point(data = rec_f, aes(x = mm, y = N, color = "Frozen"), size = 0.7) +
  geom_point(data = rec_w, aes(x = mm, y = N, color = "Warm"), size = 0.7) +
  labs(x = "Strain",
       y = "Stress (MPa)",
       color = "Legend") +
  scale_color_manual(values = colors) +
  ggtitle("Recycle : Stress (MPa) vs Strain") +
  theme(plot.title = element_text(hjust = 0.5)) 


ggplot() +
  geom_point(data = high_c, aes(x = mm, y = N, color = "Control"), size = 0.7) +
  geom_point(data = high_m, aes(x = mm, y = N, color = "Moisture"), size = 0.7) +
  geom_point(data = high_f, aes(x = mm, y = N, color = "Frozen"), size = 0.7) +
  geom_point(data = high_w, aes(x = mm, y = N, color = "Warm"), size = 0.7) +
  labs(x = "Strain",
       y = "Stress (MPa)",
       color = "Legend") +
  scale_color_manual(values = colors) +
  ggtitle("High : Stress (MPa) vs Strain") +
  theme(plot.title = element_text(hjust = 0.5)) 


ggplot() +
  geom_point(data = econ_c, aes(x = mm, y = N, color = "Control"), size = 0.7) +
  geom_point(data = econ_m, aes(x = mm, y = N, color = "Moisture"), size = 0.7) +
  geom_point(data = econ_f, aes(x = mm, y = N, color = "Frozen"), size = 0.7) +
  geom_point(data = econ_w, aes(x = mm, y = N, color = "Warm"), size = 0.7) +
  labs(x = "Strain",
       y = "Stress (MPa)",
       color = "Legend") +
  scale_color_manual(values = colors) +
  ggtitle("Economics : Stress (MPa) vs Strain") +
  theme(plot.title = element_text(hjust = 0.5)) 

ggplot() +
  geom_point(data = pla_c, aes(x = mm, y = N, color = "Control"), size = 0.7) +
  geom_point(data = pla_m, aes(x = mm, y = N, color = "Moisture"), size = 0.7) +
  geom_point(data = pla_f, aes(x = mm, y = N, color = "Frozen"), size = 0.7) +
  geom_point(data = pla_w, aes(x = mm, y = N, color = "Warm"), size = 0.7) +
  xlim(0,0.5) +
  labs(x = "Strain",
       y = "Stress (MPa)",
       color = "Legend") +
  scale_color_manual(values = colors) +
  ggtitle("Plastic : Stress (MPa) vs Strain") +
  theme(plot.title = element_text(hjust = 0.5)) 
