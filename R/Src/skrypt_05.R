#Paczki
library(tidyverse)
pingwiny <- palmerpenguins::penguins
#test_potokowanie 
#1. stowrzyć wektor 2. policzyć sumę skumulowaną 3. policzyć średnią  
#Nadpisywanie kolejnymi wartościami
dane_nadpisane <- c(6,7,8,9)

dane_nadpisane <- cumsum(dane_nadpisane)

dane_nadpisane <- mean(dane_nadpisane)


#zapis z zagnieżdżoną funkcją 

dane_funkcja <- mean(cumsum(c(6,7,8,9)))

#zapis z użyciem potokowania 

dane_potok <- c(6,7,8,9) |> 
#komentarz 
  cumsum() |>
#komentarz 2
 mean()

#tidyr####
data <- iris

#zmiana formatu long na wide 
l_2_w <- data |> 
  tidyr::pivot_wider(names_from = Species,values_from = Sepal.Length:Petal.Width)

#zmiana formatu long na wide 
#pingwiny_wide <- pingwiny |> 
#tidyr::drop_na() 
#zmiana formatu na "szerszy"
#tidyr::pivot_wider(names_from = )

pingwiny <- pingwiny |>
  dplyr::mutate(id=1:length(year))

#zmiana formatu wide na long 
pingwiny_longer <- pingwiny |> 
  tidyr::pivot_longer(bill_length_mm:body_mass_g,names_to = "zmienna", values_to = "wartosci")
#wykres
ggplot2::ggplot(pingwiny_longer,ggplot2::aes(year, wartosci, colour = species))+
  geom_point()+
  facet_wrap(vars(zmienna))

#do szerokiego 
pingwiny_wider <- pingwiny_longer |> 
  #zmiana formatu ramki 
  tidyr::pivot_wider(names_from = zmienna, values_from = wartosci)

#join (operacje na wielu ramkach)####
#podział na płeć
pingwiny_m <- pingwiny |> 
  #wybrór samców 
  dplyr::filter(sex == "male")

#wybór samic
pingwiny_s <- pingwiny |> 
dplyr::filter(!sex=="male")

#łączenie wierszy - bind rows
pingwiny_m_s <- dplyr::bind_rows(pingwiny_m, pingwiny_s)

#podział kolumnami
pingwiny_1 <- pingwiny |> 
dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |> 
  dplyr::select(-c(species:body_mass_g))

#łączenie kolumn - bind cols 
pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)
