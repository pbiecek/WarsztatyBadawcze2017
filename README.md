# Warsztaty Badawcze na MiNI 2017/2018

## Motto

Z raportu [,,Przeszłość, teraźniejszość i przyszłość edukacji akademickiej''](http://www.wz.uw.edu.pl/pracownicyFiles/id12939-Billig_last.pdf), z punku widzenia socjologa

> Studenci preferują zajęcia nastawione na zdobycie potrzebnych na rynku pracy umiejętności praktycznych, opisywane przez nich często jako „atrakcyjne i łatwe” niż zajęcia „trudne i znojne”, nie zdając sobie sprawy z tego, że do odniesienia sukcesu w konkurencji na globalnym rynku potrzebna jest przede wszystkim sprawność myślenia, *a tę kształci się wychodząc poza sferę komfortu.*

## Cel

Celem naszych zajęć jest praca nad kompetencjami, ważnymi w pracy badawczej, a słabo rozwijanymi w standardowej edukacji:

- Iteracyjna praca z danymi
- Praca w zespole
- Komunikowanie uzyskanych rozwiązań 
- Dokumentowanie uzyskanych rozwiązań

## Struktura zajęć

Zajęcia składać się będą z dwóch projektów, indywidualnego i zespołowego.

Projekt indywidualny będzie krótszy, wykonywany na sztucznych danych.

Projekt zespołowy wykonywany będzie w oparciu o rzeczywiste dane, wykonywany będzie przy współpracy z firmą mFind.

## Projekt 1

Projekt 1 to zagadnienie predykcji. Modelowanie predykcyjne można wykonać na wiele sposobów. Zobaczmy który zadziała najlepiej.

Wygenerowałem 50 zmiennych niezależnych o nazwach od A1 do X2 i jedną zmienną zależną y - odpowiedź binarną, zmienną przyjmującą wartość 'klasa -' / 'klasa +'. 

Zadanie polega na:

1) odkryciu zależności pomiędzy zmiennymi X a zmienną y,
2) zbudowaniu modelu probabilistycznego, określającego dla jakich wartości X bardziej prawdopodobne jest zaobserwowanie 'klasy +'
3) określenie rankingu dla testowych 50 000 obserwacji. Rankingu odzwierciedlającego przekonanie, że dana obserwacja miała `klasę +`.

### Terminy projektu 1

* 9 X - Omówienie projektu
* 16 X - Oddanie rankingów oraz ich opisów, wybranie recenzentów
* 23 X - Oddanie recenzji oraz porównanie wyników.


Na zajęciach 16 X będziemy wysyłać rozwiązania oraz dobierać recenzentów.
Rozwiązaniem jest: 

* plik o nazwie imie_nazwisko.txt zawierający dane jak w pliku `zbior_testowy.txt` z dodatkową pierwszą kolumną o nazwie `score`. 
Oceniając rozwiązania, wezmę 10000 wierszy o najwyższym score i sprawdzę dla ilu z nich w moim modelu przypisana była `klasa +`.
* plik imie_nazwisko.pdf opisujący użyty model. Plik nie powinien mieć więcej niż 4 strony. Powinien zawierać wszystkie najważniejsze informacje o wykonanym modelu.

Na zajęciach 23 X będziemy omawiać recenzje projektów (peer-review).

