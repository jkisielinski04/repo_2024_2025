#Load packages
library(tidyverse)

data <- iris

#Średnia długośc płatka

sredni_platek <- mean(data$Petal.Length)

mediana_platek <- median(data[,1])

sd_platek <- sd(data$Petal.Length)

#Średnie dla gatunków

sredni_platek_setosa <- mean(data[1:50,4])

sredni_platek_versi <- mean(data[51:100,4])

sredni_platek_virgi <- mean(data[101:150,4])

#średnia dla gatunku po nazwie

sredni_platek_setosa_nazwa <- mean(data[data$Species=="setosa",4])

#Podsumowanie

podsumowanie <- summary(data)
podsumowanie <- print(summary(data))

#podsumowanie dla 2 kolumn

podsumowanie_2_kolumny <- summary(data[,1:2])
podsumowanie_2_kolumny <- print(summary(data[,1:2]))

#Suma długości

data$Suma.dlugosci <- data$Sepal.Length+data$Petal.Length

#Frakcja

data$Frkacja <- (data$Sepal.Length+data$Petal.Length)/data$Sepal.Width

#Srednia jako kolumna

data$srednia <- mean(c(data$Sepal.Length, data$Petal.Length))

#Ramka danych dla setosa

data_setosa <- data[1:50,]

#Ramka danych tylko setosa po nazwie

data_setosa_nazwa <- data[data$Species=="setosa",]

#Ramka danych dla setosa i versi po nazwie

data_setosa_versi_nazwa <- data[data$Species==c("setosa","versicolor"),]

#Ramka danych tylko oryginalne kolumny

data_oryginalne <- dplyr::select(data, Sepal.Length:Species)

data_oryginalne_tylko_sepal <- dplyr::select(data,Sepal.Length, Sepal.Width)
print(data_oryginalne_tylko_sepal <- dplyr::select(data,Sepal.Length, Sepal.Width))

#Wybór zmiennych według nazwy z zapisem od do

data_oryginalne_tylko_sepal <- dplyr::select(data,Sepal.Length, Sepal.Width)

#Wybór zmiennych według nazwy z zapisem sklejanym

data_oryginalne_tylko_sepal_2 <- dplyr::select(data,c(Sepal.Length, Sepal.Width))

#Wybór zmiennych według nazwy z zapisem według początku

data_oryginalne_tylko_sepal_3 <- dplyr::select(data,starts_with("Petal"))

#Wybór zmiennych według nazwy od końca

data_oryginalne_tylko_sepal_4 <- dplyr::select(data,ends_with("Length"))
data_oryginalne_tylko_sepal_4

#Wybór zmiennych według nazwy z zapisem dowolnych znaków wspólnych

data_oryginalne_tylko_sepal_5 <- dplyr::select(data, contains("al"))
data_oryginalne_tylko_sepal_5

#Wybór zmiennych według nazwy z zapisem według początku-negacja

data_oryginalne_tylko_sepal_6 <- dplyr::select(data, !starts_with("Petal"))
data_oryginalne_tylko_sepal_6

#####Wybór wierszy

#Wybór wierszy z gatunkiem setosa

data_wiersze_1 <- dplyr::filter(data,Species=="setosa")

#Wybór wierszy z nie gatunkiem setosa

data_wiersze_2 <- dplyr::filter(data,!Species=="setosa")

#Wybór wierszy gdzie Petal.Length jest większe od 5.0

data_wiersze_3 <- dplyr::filter(data, Petal.Length>5.0)

#Wybór wierszy gdzie Petal.Length jest większe od 5.0 i mniejsze od 6.0

data_wiersze_4 <- dplyr::filter(data, Petal.Length>5.0&Petal.Length<6.0)

#Działania na zbiorach | || & &&
