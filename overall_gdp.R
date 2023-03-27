library(tidyverse)

df <- read_csv("posts/20230229 dreams of progenitors/API_NY.GDP.PCAP.CN_DS2_en_csv_v2_4770524.csv", skip = 3)
df
df <- df[-c(3,4)]
df

df %>% 
  gather(key, value, -c(1,2)) %>% 
  ggplot(aes(as.numeric(key), value)) +
  geom_point()

df %>% 
  gather(key, value, -c(1,2)) %>% 
  ggplot(aes(as.numeric(key), value)) +
  geom_point() +
  facet_wrap(~`Country Code`)

df %>% 
  gather(key, value, -c(1,2)) %>% 
  ggplot(aes(as.numeric(key), value)) +
  geom_point() +
  facet_wrap(~`Country Code`, scales = 'free')

df %>% 
  gather(key, value, -c(1,2)) %>% 
  filter(grepl('A', `Country Code`)) %>% 
  ggplot(aes(as.numeric(key), value)) +
  geom_point() +
  facet_wrap(~`Country Code`, scales = 'free')

df %>% 
  gather(key, value, -c(1,2)) %>% 
  filter(grepl('KOR', `Country Code`)) %>% 
  ggplot(aes(as.numeric(key), value)) +
  geom_point() +
  facet_wrap(~`Country Code`, scales = 'free')

df %>% 
  gather(key, value, -c(1,2)) %>% 
  filter(`Country Code`==c('KOR', 'USA', 'JPN')) %>% 
  ggplot(aes(as.numeric(key), value, color=`Country Code`)) +
  geom_point() 

df %>% 
  gather(key, value, -c(1,2)) %>% 
  group_by(`Country Code`) %>% 
  mutate(max=max(value)) %>% 
  ggplot(aes(max,`Country Code`)) +
  geom_point() +
  scale_x_continuous(trans = 'log10')


