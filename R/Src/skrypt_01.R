#Załadowanie paczek
library(tidyverse)

#Dane Nowa Zelandia (z www)
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#Wczytanie z dysku - pełna ścieżka (bezwlgędna)
dane_dysk_full_patch <-readr::read_csv(file = "C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#Wczytanie z dysku - ścieżka względa
dane_dysk_full_patch <-readr::read_csv(file ="R/Data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#Zmiana kolumny teksotwej na liczbowa
dane_dysk_full_patch$Value <- as.numeric(dane_dysk_full_patch$Value)

#Parsowanie tekstu na numer
dane_dysk_full_patch <-readr::read_csv(file ="R/Data/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane_dysk_full_patch$Value <- readr::parse_number(dane_dysk_full_patch$Value)

dane_dysk_full_patch[748,"Value"]
