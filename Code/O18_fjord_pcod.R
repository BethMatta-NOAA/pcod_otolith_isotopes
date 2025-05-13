###Ingrid's fjord Pcod project (O18-genetics)

library(tidyverse)
library(r2symbols)

data <- read.csv("../Data/cleaned_data.csv")

#set color codes for locations
loc.colors <- c("CI-inside" = "#fcba03",
               "CI-outside" = "#eb7310",
               "PWS-inside" = "#14c7e3",
               "PWS-outside" = "#1061ad")


#Data exploration-----------

means.table <- data %>% 
  group_by(location2) %>% 
  summarize(mean.o18 = mean(d_o18),
            sd.o18 = sd(d_o18),
            mean.c13 = mean(d_c13),
            sd.c13 = sd(d_c13),
            count = n())


##Boxplots -----------

lengths.box <- ggplot(data, aes(location2, length_mm, color = location2)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2) +
  scale_color_manual(values = loc.colors) +
  labs(x = "", y = "Length (mm)", color = "Site") +
  theme_bw()

o18.box <- ggplot(data, aes(location2, d_o18, color = location2)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2) +
  scale_color_manual(values = loc.colors) +
  labs(x = "", y = "\u03b4O18 (\u2030 VPDB)", color = "Site",
       title = "Pacific cod otolith \u03b4O18 values") +
  theme_bw()

c13.box <-ggplot(data, aes(location2, d_c13, color = location2)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2) +
  scale_color_manual(values = loc.colors) +
  labs(x = "", y = "\u03b4C13 (\u2030 VPDB)", color = "Site",
       title = "Pacific cod otolith \u03b4C13 values") +
  theme_bw()


#Relationships with fish size

o18.length.lm <- ggplot(data, aes(length_mm, d_o18, color = location2)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = loc.colors) +
  labs(x = "Length (mm)", y = "\u03b4O18 (\u2030 VPDB)", color = "Site",
       title = "Pacific cod otolith \u03b4O18 values vs fish length") +
  theme_bw()

c13.length.lm <-ggplot(data, aes(length_mm, d_c13, color = location2)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = loc.colors) +
  labs(x = "Length (mm)", y = "\u03b4C13 (\u2030 VPDB)", color = "Site",
       title = "Pacific cod \u03b4C13 values vs fish length") +
  theme_bw()




