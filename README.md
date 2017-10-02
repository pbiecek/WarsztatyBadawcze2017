# Warsztaty Badawcze na MiNI 2017/2018

## Motto

Z raportu [,,Przeszłość, teraźniejszość i przyszłość edukacji akademickiej''](http://www.wz.uw.edu.pl/pracownicyFiles/id12939-Billig_last.pdf), z punku widzenia socjologa

> Studenci preferują zajęcia nastawione na zdobycie potrzebnych na rynku pracy umiejętności praktycznych, opisywane przez nich często jako „atrakcyjne i łatwe” niż zajęcia „trudne i znojne”, nie zdając sobie sprawy z tego, że do odniesienia sukcesu w konkurencji na globalnym rynku potrzebna jest przede wszystkim sprawność myślenia, *a tę kształci się wychodząc poza sferę komfortu.*

## Cel

Celem naszych zajęć jest praca nad kompetencjami, ważnymi w pracy badawczej, a słabo rozwijanymi w standardowej edukacji:

- Iteracyjna praca z danymi
- Praca w zespole
- Produktyzacja rozwiązań
- Opisywanie uzyskanych rozwiązań

## Projekt 1

Analiza treści i ocen wybranego serialu (np. Game of Thrones)

Pytania szczegółowe (wybierz jedno):

* Jak wyglądają interakcje pomiędzy bohaterami serialu?
* Jakie emocje dominują w których częściach serialu/których bohaterach?
* Czym różnią się wypowiedzi (złożoność języka) głównych bohaterów?

### Materiały

- Liczba głosów i średnia ocena z bazy IMDB http://www.imdb.com/chart/toptv/
- Przykładowe treści napisów dla GoT https://www.opensubtitles.org/pl/ssearch/sublanguageid-pol/idmovie-63130
- Wprowadzenie do TextMining http://tidytextmining.com/ https://cran.r-project.org/web/packages/tidytext/vignettes/tidytext.html
- Wprowadzenie do analizy wydźwięku/sentymentu http://tidytextmining.com/sentiment.html
- Skrypt pobierający dane ze strony IMDB

```
## scrap the data from IMDB database

library(rvest)
library(dplyr)

# read links and titles 
page <- read_html("http://www.imdb.com/chart/toptv/")
series <- html_nodes(page, ".titleColumn a")
titles <- html_text(series)
links <- html_attr(series, "href")
codes <- sapply(strsplit(links, split = "/"), `[`, 3)

# read details for series
allSeries <- lapply(seq_along(codes), function(i) {
  tab <- read_html(paste0("http://www.imdb.com/title/",codes[i],"/epdate?ref_=ttep_ql_4")) %>%
    html_node("table") %>%
    html_table()
  data.frame(Serie = titles[i], tab[,1:4], Season = gsub(tab[,1], pattern="\\..*", replacement=""))
})

# put all together
series2017 <- do.call(rbind, allSeries)
series2017$UserVotes <- as.numeric(gsub(series2017$UserVotes, pattern = "[^0-9]", replacement = ""))
series2017 %>% 
  group_by(Serie) %>%
  mutate(id = seq_along(Serie)) %>%
  ungroup() -> series2017
```

### Realizacja

Projekt można realizować w grupie od 1 do 4 osób. Wszystkie osoby w zespole otrzymują tę samą liczbę punktów.
Na końcowy wynik wpływ ma projekt 1 z wagą 34% i projekt 2 z wagą 66%.

W ramach prac należy przeprowadzić trzy etapy:

- reaserch, czyli badania literaturowe. Poszukać podobnych rozwiązań. Wybrać konkretny problem do rozwiązania.
- wykonanie. Zaplanowaną pracę trzeba wykonać.
- opis i dokumentacja. Jakich metod użyliśmy.

Projekt oceniany będzie w trzech aspektach:

- Głębokość researchu (czy udało się znaleźć podobne rozwiązania, gdzie, ile)
- Jakość opracowanego rozwiązania (UX, czytelność)
- Jakość i kompletność opisu wyniku

Każdy zespół powinien mieć nazwę. Wyniki należy umieszczać w katalogu 
https://github.com/pbiecek/WarsztatyBadawcze2017/tree/master/Projekty

- 9 X - Omówienie celu projektu
- 16 X - Dyskusja pobranych danych i wyników wstępnych badań literaturowych
- 23 X - Pierwsza prezentacja wyników
- 30 X - Przygotowanie podsumowania uzyskanych wyników i użytej metodologii
- 6 XI - Finalna prezentacja

