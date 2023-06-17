library(tidyverse)
library(readxl)

df <- read_excel("~/29 e 1230 n.xlsx", sheet = 2)
df

library(ggrepel)

df$`Price/sq ft` <- as.integer(df$`Price/sq ft`)

df %>% 
  ggplot(aes(Price, `Price/sq ft`, label=`Price/sq ft`)) +
  geom_point() +
  geom_line() +
  geom_label_repel() +
  labs(title = "29 East 1230 North Value",
       subtitle = "Baskin Robbins")
