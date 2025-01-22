# Powtórka; grupa 1, 22.01.2025

# Załaduj paczki {tidyverse}, {readxl}

library(tidyverse)
library(readxl)

# Stwórz jednowymiarowy wektor o pięciu elementach liczbowych

wektor <- c(1,5,7,3,4)

# Wybierz czwartą i trzecią (w tej kolejności) pozycję w utworzonym wektorze i zapisz jako nowy wektor

wektor2 <- c(wektor[4],wektor[3])
wektor3 <- wektor[c(4,3)]

# Wczytaj dane z iris dataset

data <- iris

# Wybierz drugą kolumnę i wszystkie wiersze

data1 <- data[,2]

# Wybierz czwarty i trzydiesty wiersz oraz wszystkie kolumny - klasyczne indeksowanie

data2 <- data[c(4,30),]

# Wybierz wiersze 4, 8, 22 i kolumny Petal.Length oraz Sepal.Width - klasyczne indeksowanie

data3 <- data[c(4,8,22),c("Petal.Length", "Sepal.Width")]
data3 <- data[c(4,8,22),c(3,4)]

# Wybierz kolumnę Species korzystając z operatora $

data5 <- data$Species

# Uwtórz nową kolumnę "Petal.Iloraz" w ramce danych, tak aby była ilorazem Petal.Length i Petal.Width

data$Petal.Iloraz <- data$Petal.Length/data$Sepal.Width

# Wczytaj dane z adresu sieciowego, zwróć uwagę na separator
# https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv

data7<- readr::read_csv2("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv")

# Wczytaj dane z pliku csv na dysku 

data8 <- readr::read_csv(file="C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wczytaj dane z pliku excel na dysku, wyraźnie wskaż arkusz

data9 <- readxl::read_excel("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/data_msu.xlsx", sheet=1)

# {dplyr} i {tidyr}

# Wczytaj dane dotyczące pingwinów

pingwiny <- palmerpenguins::penguins

# Zmień nazwę species na gatunek

data10 <- rename(pingwiny, gatunek=species)

# Zmień wszystkie nazwy tak aby były pisane wielką literą

dane11 <- rename_with(pingwiny,.cols = everything(),\(i) toupper(i))

# Wybierz kolumny od bill_length_mm do body_mass_g

dane12 <- select(pingwiny, bill_length_mm:body_mass_g)

# Wybierz kolumny kończące się na "mm"

dane13 <- dplyr::select(pingwiny, ends_with("mm"))

# Wybierz kolumny zawierające "th"

dane14 <- dplyr::select(pingwiny, contains("th"))

# Wybierz kolumny niebędące species

dane15 <- dplyr::select(pingwiny,!species)
dane16 <- dplyr::select(pingwiny,-species)

# Uwtórz nową kolumnę bill_ratio jako iloraz bill_length_mm do bill_depth_mm

dane17 <- dplyr::mutate(pingwiny,iloraz=bill_length_mm/bill_depth_mm)

# Utwórz kolumnę id z numerem obserwacji (tip: 1:n())

pingwiny <- dplyr::mutate(pingwiny, id=1:n())

# Zlogarytmuj w miejscu kolumnę body_mass_g

dane19 <- dplyr::mutate(pingwiny, body_mass_g=log(body_mass_g))

# Oblicz w miejscu pierwiastek ze wszystkich kolumn numerycznych

dane20 <- dplyr::mutate(pingwiny,across(where(\(i)is.numeric(i)), \(i)sqrt(i)))

# Zgrupuj ramkę ranych na podstawie zmiennej gatunek i wykonaj operację summarise (średnia) dla kolumn bill_length_mm i body_mass_g

dane21 <- pingwiny|> 
  group_by(species) |> 
  summarise(srednia=mean(bill_length_mm, na.rm =TRUE), 
            srednia2=mean(body_mass_g,na.rm =TRUE))

# Wykonaj operację summarise (mediana) dla kolumn bill_length_mm i body_mass_g, wskaż zmienną grupującą jako argument .by

dane22 <- pingwiny |> 
  dplyr::summarise(mediana1=median(bill_length_mm, na.rm=TRUE), 
                   mediana2=median(body_mass_g, na.rm=TRUE),.by=species)

# Zmień format ramki na dłuższy, wykorzystaj kolumny bill_length_mm i bill_depth_mm

dane23 <- pingwiny |> tidyr::pivot_longer(cols=c(bill_length_mm, bill_depth_mm), 
                                          names_to= "nazwa", values_to="wartosc")

# Zmień format ramki na szerszy, tak aby każda zmienna była wyrażona dla każdej wyspy

dane24 <- pingwiny |> 
  pivot_wider(id_cols = id,names_from = island, values_from = flipper_length_mm)

# Korzystając z danych geochemicznych połącz ze sobą ramki loi oraz bsi na podstawie zmiennej sample.id - dołącz do lewej

data25 <- readxl::read_excel("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/data_msu.xlsx", sheet="loi")

data26 <- readxl::read_excel("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/data_msu.xlsx", sheet="elemental")

data27<- readxl::read_excel("C:/Users/jkisi/OneDrive - University of Gdansk (for Students)/GFZG/SEM I/Przetwarzanie danych/GitHub/repo_2024_2025/R/Data/data_msu.xlsx", sheet="bsi")

data28 <- left_join(data25, data27, join_by(sample.id==sample.id))

# Korzystając z danych geochemicznych połącz ze sobą ramki elemental oraz bsi na podstawie zmiennej sample.id - dołącz do prawej

data29 <- right_join(data26, data27, join_by(sample.id==sample.id))

# Korzystając z danych geochemicznych połącz ze sobą wszystkie trzy ramki w sposób całkowity

data30 <- full_join(data25, data27, join_by(sample.id)) |> full_join(x=_,y=data26, join_by(sample.id))

