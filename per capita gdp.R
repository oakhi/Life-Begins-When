library(readxl)
library(tidyverse)

df <- read_excel("posts/20230229 dreams of progenitors/south-korea-gdp-per-capita.xlsx", skip = 16)
df

df <- df %>% 
  separate(`date, GDP Per Capita (US $), Annual Growth Rate (%),`, into=c('date', 'gdp', 'growth'), sep = ",")
df

df$date <- as.Date(df$date, format = "%Y-%m-%d")
df$gdp <- as.numeric(df$gdp)
df$growth <- as.numeric(df$growth)

df %>% 
  ggplot(aes(date, growth)) +
  geom_point() +
  geom_smooth()

df %>% 
  ggplot(aes(date, gdp)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = as.Date(c('1962-12-31', '1973-12-31', '1990-12-31', '1998-12-31')))

df %>% 
  ggplot(aes(date, gdp)) +
  geom_point() +
  geom_line() +
  scale_y_continuous(trans = 'log10')

df$country <- 'korea'
df1 <- df

df <- read_excel("posts/20230229 dreams of progenitors/united-states-gdp-per-capita.xlsx", skip = 16)
df

df <- df %>% 
  separate(`date, GDP Per Capita (US $), Annual Growth Rate (%),`, into=c('date', 'gdp', 'growth'), sep = ",")
df

df$date <- as.Date(df$date, format = "%Y-%m-%d")
df$gdp <- as.numeric(df$gdp)
df$growth <- as.numeric(df$growth)

df %>% 
  ggplot(aes(date, growth)) +
  geom_point() +
  geom_smooth()

df %>% 
  ggplot(aes(date, gdp)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = as.Date(c('1962-12-31', '1973-12-31', '1990-12-31', '1998-12-31')))

df %>% 
  ggplot(aes(date, gdp)) +
  geom_point() +
  geom_line() +
  scale_y_continuous(trans = 'log10')


df$country <- 'united states'
df2 <- df

df <- rbind(df1, df2)

df %>% 
  ggplot(aes(date, growth)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~country)

df %>% 
  ggplot(aes(date, gdp, color=country)) +
  geom_point() +
  geom_line(aes(group=country)) +
  geom_vline(xintercept = as.Date(c('1962-12-31', '1973-12-31', '1990-12-31', '1998-12-31')))

df %>% 
  ggplot(aes(date, gdp, color=country)) +
  geom_point() +
  geom_line(aes(group=country)) +
  scale_y_continuous(trans = 'log10') +
  geom_vline(xintercept = as.Date(c('1962-12-31', '1973-12-31', '1990-12-31', '1998-12-31')))

