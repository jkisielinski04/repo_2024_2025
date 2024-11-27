#27.11.2024
library(tidyverse)
library(readxl)

#Wczytywanie danych
ramka <- readxl::read_excel("R/Data/Analiza.xlsx", sheet = "Arkusz1")

#Zmiana nazw zmiennych
# ramka <- dplyr::rename(ramka, ilosc_krokow=...3)
# ramka <- dplyr::rename(ramka,procent_baterii_w_telefonie = ...5)
# ramka <- dplyr::rename(ramka,spalone_kalorie=...7)
ramka<- dplyr::rename(ramka, ilosc_krokow = ...3,procent_baterii_w_telefonie = ...5,spalone_kalorie = ...7)

#Zmiana nazwy z wielkiej na mała
ramka_2 <- dplyr::rename_with(ramka,.cols = everything(),\(i)toupper(i))

#Zmiana nazwy z wielkiej na mała
ramka_3 <- dplyr::rename_with(ramka,.cols = dplyr::starts_with("data"),\(i)tolower(i))
ramka_4 <- dplyr::rename_with(ramka,.cols = dplyr::starts_with("spalone_kalorie"),\(i)toupper(i))

#wczytywanie danych 2 próba
ramka <- readxl::read_excel("R/Data/Analiza.xlsx", sheet = "Arkusz1")

#Operacje na kolumnach
ramka$kolumna8 <- ramka[,3]/ramka[,2]

#Operacje na kolumnach mutate
ramka_5 <- dplyr::mutate(ramka, wynik_dzielenia = spalone_kalorie_12/spalone_kalorie_end)

ramka_6 <- dplyr::mutate(ramka, wynik_dodawania = ilosc_krokow_end+500)

ramka_7 <- dplyr::mutate(ramka, ilosc_krokow_12=ilosc_krokow_12-987)

ramka_8 <- dplyr::mutate(ramka, ilosc_krokow_12=ilosc_krokow_12-987, .keep="none")

#przesuniecie danych

ramka_9 <- dplyr::relocate(ramka_5, ilosc_krokow_end, .before=1)
