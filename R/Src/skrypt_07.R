#ggplot intro 29.01.2025

#paczki
library(tidyverse)

#dane hydrochemia 
zab_hydrochemia <- read.csv("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/zab_hydrochemistry-lake.csv") |> 
  mutate(date=lubridate::ymd(date))

#wykres: x= czas, y=wartosc Ca
ggplot2::ggplot(zab_hydrochemia, aes(date, ca))+
  geom_line()

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=depth))+
  geom_line()

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc jako wartosci dyskretne 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=factor(depth)))+
  geom_line()

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc jako wartosci dyskretne 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=factor(depth)))+
  geom_line()+
  facet_wrap(vars(depth))

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc jako wartosci dyskretne 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=factor(depth)))+
  geom_line()+
  facet_wrap(vars(depth), ncol = 1)

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc jako wartosci dyskretne 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=factor(depth)))+
  geom_line()+
  facet_wrap(vars(depth), ncol = 1)+
  theme_dark()

#wykres: x= czas, y=wartosc Ca- serie pokmolorawne - glebokosc jako wartosci dyskretne 
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color=factor(depth)))+
  geom_line()+
  facet_wrap(vars(depth), ncol = 1)+
  theme(panel.background = element_blank())

#wczytaj dane zab_temterature_daily
zab_temp <- read.csv("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/zab_temperature-daily.csv") |> 
  mutate(day=lubridate::ymd(day))

#wykres temperatury wody w czasie, temperatura na pierwszym metrze, punkty, linia, wygładzone 
ggplot2::ggplot(zab_temp, aes(day, temp_01))+
  geom_point()+
  geom_line(color="red")+
  geom_smooth()

#wykres z seriami rozbitymi na panele, wszystkie glebokosci  
zab_temp |>  tidyr::pivot_longer(cols = starts_with("temp_"), names_to = "glebokosc", values_to = "temperatura") |> 
ggplot2::ggplot(aes(day, temperatura))+
  geom_line()+
  facet_wrap(vars(glebokosc),ncol=1, scales="free")

#wczytaj dane dot. pułapki sedymentacyjnej 
zab_trap <- read.csv("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/zab_sediment-trap_hypolimnion.csv") |> 
 mutate(date= lubridate::ymd(date))

#wykres kolumnowy tempa akumulacji masy
zab_trap |> 
  ggplot(aes(date,mar))+
  geom_col()

zab_trap |> 
  ggplot()+
  geom_rect(aes(xmin=lag(date), xmax=(date), ymin= 0, ymax=mar))

#Boxplot
ggplot(zab_hydrochemia)+geom_boxplot(aes(y=ca,group = factor(depth)))

#violin plot 
ggplot(zab_hydrochemia)+ geom_violin(aes(x = factor(depth),y=ca))

ggplot(zab_hydrochemia)+geom_histogram(aes(ca, fill= factor(depth)))  
