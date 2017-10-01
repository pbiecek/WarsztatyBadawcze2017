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

### Materiały

- Liczba głosów i średnia ocena z zbazy IMDB http://www.imdb.com/chart/toptv/
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
