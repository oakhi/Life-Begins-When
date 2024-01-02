library(tidyverse)
library(readxl)

getwd()

df <- read_excel("~/29 e 1230 n.xlsx", sheet = 2)
df

library(ggrepel)

df$`Price/sq ft` <- as.integer(df$`Price/sq ft`)
df

df %>%  
  ggplot(aes(Price, `Price/sq ft`, label=`Price/sq ft`, color=`Sq Foot`)) +
  geom_point() +
  geom_line(aes(group=`Sq Foot`)) +
  geom_label_repel() +
  labs(title = "29 East 1230 North Value",
       subtitle = "Baskin Robbins")

df %>% 
  ggplot(aes(Price, `Price/sq ft`, label=`Price/sq ft`)) +
  geom_point() +
  geom_line() +
  facet_wrap(~`Sq Foot`) +
  geom_label_repel() +
  labs(title = "29 East 1230 North Value",
       subtitle = "Baskin Robbins")

