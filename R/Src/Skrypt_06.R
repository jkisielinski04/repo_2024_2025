#15.01.25

#Paczki
library(tidyverse)

#wczytywwanie danych

data_1 <- readxl::read_excel("R/Data/data_msu.xlsx", sheet="loi")

data_2 <- readxl::read_excel("R/Data/data_msu.xlsx", sheet="elemental")

data_3<- readxl::read_excel("R/Data/data_msu.xlsx", sheet="bsi")

#Wylistowanie dostępnych arkuszy w pliku excel
readxl::excel_sheets("R/Data/data_msu.xlsx")

#ładowanie ramek (mutating join)
#Left join
dane_left_1 <- dplyr::left_join(x = data_1, y = data_2)

dane_left_2 <- dplyr::left_join(x = data_1, y = data_3)

dane_left_3 <- dplyr::left_join(x = data_1, y = data_3, by=dplyr::join_by(sample.id==sample.id))

dane_left_4 <- dplyr::left_join(dplyr::select(data_1,-mass.mg),
dplyr::rename(data_3, nazwa.id=sample.id), by=dplyr::join_by(sample.id==nazwa.id))

dane_left_5 <- dplyr::left_join(data_1, data_2, by=dplyr::join_by(sample.id)) |>
dplyr::left_join(x=_,y=data_3, by=dplyr::join_by(sample.id))

#łączenie do prawej ramki
#Right join
dane_right_1 <-dplyr::right_join(x=data_1, y=data_2)

dane_right_2 <- dplyr::right_join(data_3, data_1, by=dplyr::join_by(sample.id)) |>
  dplyr::right_join(data_2, by =dplyr::join_by(sample.id))

#łączenie wszystkiego - inner join
dane_inner_1 <- dplyr::inner_join(x=data_1, y=data_2)

#szalone nutki

data_szalone <- dplyr::inner_join(data_1, data_3, by=dplyr::join_by(sample.id)) |>
  dplyr::right_join(dane_right_1)

#łączenie wszystkiego - full join

dane_full_1 <- dplyr::full_join(data_1, data_2)

#Semi join
dane_semi_1 <- dplyr::semi_join(data_1, data_2)

#Anti join
dane_anti_1 <- dplyr::anti_join(data_3, data_1)
