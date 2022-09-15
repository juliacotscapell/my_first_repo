# Set-up your script ------------------------------------------------------

install.packages(c("tidyverse", "gapminder", "pacman")) # uncomment if already installed
library(tidyverse)
library(gapminder)
library(pacman)

pacman::p_load(tidyverse, gapminder)


# Load your Data into R ---------------------------------------------------

data(gapminder)
head(gapminder)


# Clean your Data ---------------------------------------------------------

gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)


# Include only countries in the Americas -----------------------------------

gapminder_Americas <- subset(gapminder_clean, continent=="Americas")


# Rich / poor countries

median(gapminder_Americas$gdp_per_cap) #to know the median value of all countries
gapminder_Americas$economy <- ifelse(gapminder_Americas$gdp_per_cap>=5465.51, "rich", "poor")


