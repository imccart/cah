# Meta --------------------------------------------------------------------
## Title:         CAH Data
## Author:        Ian McCarthy
## Date Created:  6/20/2023
## Date Edited:   6/21/2023


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(data.table, tidyverse, janitor, here, readxl)


# Import Individual CAH Files ---------------------------------------------
cah.final <- tibble()
for (y in 2004:2020){

    if (y==2004) {
    month.list <- c("oct")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- 1
    var.names <- c('name','city','state','zip','eff_date','beds')
    
  } else if (y==2007) {
    month.list <- c("aug")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_1.xlsx'))
    }
    skip <- 2
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')

  } else if (y==2008) {
    month.list <- c("apr","sep")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2009) {
    month.list <- c("jan","jul","dec")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2010) {
    month.list <- c("mar","jun","sep","dec")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2,2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2011) {
    month.list <- c("mar")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- 2
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2012) {
    month.list <- c("mar","jun","sep","dec")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2,2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2013) {
    month.list <- c("mar","jun")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2014) {
    month.list <- c("feb","jun","nov")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,1,2)
    var.names <- c('name','city','state','zip','eff_date','beds','dpu_psyc_beds','dpu_psyc_date','dpu_rehab_beds','dpu_rehab_date')
    
  } else if (y==2015) {
    month.list <- c("oct","dec")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- c(2,2)
    var.names <- c('name','city','state','zip','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } else if (y==2016) {
    month.list <- c("apr")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- 2
    var.names <- c('name','city','state','zip','other','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } else if (y==2017) {
    month.list <- c("jul")
    m.step <- 0
    for (m in month.list) {
      m.step <- m.step+1
      assign(paste0('cah.path.',m.step), paste0('data/input/cah-historical-data/',y,'-',m,'-cah-list_0.xlsx'))
    }
    skip <- 2
    var.names <- c('name','city','state','zip','other','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } else if (y==2018) {
    m.step <- 0
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_04_16_18_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_07_27_18_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_10_19_18_0.xlsx')
    skip <- c(2,2,2)
    var.names <- c('name','city','state','zip','other','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } else if (y==2019) {
    m.step <- 0
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_01_31_19_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_04_18_19_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_07-19-19_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_10_11_19_corrected2_0.xlsx')
    skip <- c(2,2,2,2)
    var.names <- c('name','city','state','zip','other','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } else if (y==2020) {
    m.step <- 0
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_1_17_2020_0.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_04_28_2020.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_07_28_2020.xlsx')
    m.step <- m.step+1
    assign(paste0('cah.path.',m.step), 'data/input/cah-historical-data/cah_list_10-15-2020.xlsx')
    skip <- c(2,2,2,2)
    var.names <- c('name','city','state','zip','other','eff_date','beds','swing_bed_license','dpu_psyc_beds','dpu_rehab_beds')
    
  } 
  for (s in 1:m.step) {
    cah.data <- read_excel(get(paste0('cah.path.',s)), col_names=var.names, skip=skip[s]) %>%
      mutate(year_version=s,
             year=y,
             across(any_of(c('eff_date')), ~ as.character(.)))
    
    cah.final <- bind_rows(cah.final, cah.data)
  }
}


# Remove clear duplicates and save ----------------------------------------

cah.final <- cah.final %>% filter(! year %in% c(2005, 2006), !is.na(city), name!="0") %>%
  mutate(zip5=substr(zip,1,5)) %>%
  group_by(name, state, zip5) %>%
  select(-zip) %>%
  rename(zip=zip5) %>%
  slice_tail(n=1) %>%
  ungroup() %>%
  write_csv('data/output/cah_data.csv')