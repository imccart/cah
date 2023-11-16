# Meta --------------------------------------------------------------------
## Title:         CAH Data
## Author:        Ian McCarthy
## Date Created:  6/20/2023
## Date Edited:   6/21/2023


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(data.table, tidyverse, janitor, here, readxl)


# Import state designations ------------------------------------------------

st.xwalk <- tibble(state=state.name) %>%
  bind_cols(tibble(abb=state.abb)) %>%
  bind_rows(tibble(state="District of Columbia", abb="DC"))


state.data.full <- read_excel('data/input/cah-designation.xlsx', sheet="State Information") %>%
  select(cah_year="Earliest Year State Hospital CAH Designation",
         state="State", cah_date="CAH Designation Date") %>%
  left_join(st.xwalk, by="state")

state.data.confirm <- read_excel('data/input/cah-designation.xlsx', sheet="Finalized") %>%
  select(state="State", cah_date="Date") %>%
  mutate(cah_year=year(cah_date)) %>%
  left_join(st.xwalk, by="state")



# Remove clear duplicates and save ----------------------------------------

cah.state <- 

  write_csv('data/output/cah_states.csv')