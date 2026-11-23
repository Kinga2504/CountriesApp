
# CountriesApp – Flutter Mobile Application & QA Testing

## Opis projektu

CountriesApp to aplikacja mobilna stworzona we Flutterze,
która umożliwia przeglądanie informacji o krajach świata.

Dane pobierane są z publicznego REST Countries API.
Aplikacja obsługuje również przechowywanie danych
w lokalnej bazie Hive, dzięki czemu wcześniej pobrane
informacje są dostępne bez połączenia z internetem.

Projekt obejmuje także dokumentację testowania manualnego,
przygotowaną w ramach nauki zapewniania jakości oprogramowania (QA).

## Wykorzystane technologie

- Flutter
- Dart
- REST API
- JSON
- Hive – lokalna baza danych
- Android Studio
- Git i GitHub

## Wykorzystane API

Aplikacja korzysta z publicznego REST Countries API:

https://restcountries.com/

Pobierane informacje:
- Nazwa kraju
- Stolica
- Flaga
- Region
- Język
- Waluta
- Kod kraju

## Funkcjonalności aplikacji

- Wyświetlanie listy krajów
- Wyszukiwanie krajów po nazwie
- Wyszukiwanie po fragmencie nazwy
- Wyświetlanie szczegółów wybranego kraju
- Pobieranie danych z REST API
- Obsługa stanu ładowania
- Obsługa błędów
- Przechowywanie danych w bazie Hive
- Dostęp do wcześniej pobranych danych w trybie offline

## Uruchomienie aplikacji

1. Pobierz repozytorium na komputer.
2. Otwórz projekt w Android Studio.
3. Upewnij się, że Flutter SDK jest zainstalowany.
4. Pobierz zależności poleceniem:

   flutter pub get

5. Uruchom emulator Androida.
6. Uruchom aplikację poleceniem:

   flutter run

## Testowanie manualne – QA

W ramach projektu przeprowadzono 10 przypadków
testowych na emulatorze Androida.

**Środowisko testowe:**
- Emulator: Pixel 4
- Android API: 34
- Narzędzie: Android Studio
- Rodzaj testów: Manualne testy funkcjonalne

### Zakres testowania

Sprawdzono:
- Wyszukiwanie istniejących krajów
- Wyszukiwanie nieistniejących krajów
- Wyszukiwanie niezależnie od wielkości liter
- Wyszukiwanie po fragmencie nazwy
- Przywracanie listy po wyczyszczeniu wyszukiwarki
- Działanie na wcześniej pobranych danych offline
- Działanie po ponownym połączeniu z internetem
- Nawigację między ekranami
- Obsługę dodatkowych spacji w wyszukiwarce
- Obsługę bardzo długiego tekstu

## Wyniki testowania

| Wynik | Liczba |
|---|---|
| Wszystkie testy | 10 |
| PASS | 9 |
| FAIL | 1 |
| Odsetek PASS | 90% |

Wynik FAIL dotyczy założonego oczekiwania
względem obsługi dodatkowych spacji.

### BUG-001 – Wyszukiwanie kraju ze spacjami

Podczas testowania zaobserwowano, że aplikacja
nie znajduje kraju, jeżeli użytkownik wpisze
dodatkową spację przed nazwą lub po niej.

Przykłady:
- `Poland` – kraj zostaje znaleziony
- ` Poland` – brak wyników
- `Poland ` – brak wyników
- ` Poland ` – brak wyników

Problem został udokumentowany w raporcie BUG-001.

Status: potencjalny błąd wymagający
potwierdzenia wymagań funkcjonalnych.

## Dokumentacja QA

- [Przypadki testowe](qa-documentation/test-cases.md)
- [Raport błędu](qa-documentation/bug-reports.md)
- [Podsumowanie testów](qa-documentation/test-summary.md)
- [Zrzut ekranu BUG-001](qa-documentation/screenshots/TC-009-spaces.png)

## Wnioski

Przeprowadzone testy pozwoliły sprawdzić
podstawowe funkcjonalności aplikacji oraz
zidentyfikować potencjalny problem
z obsługą dodatkowych spacji.

Projekt umożliwił praktyczne wykorzystanie
podstaw testowania manualnego, tworzenia
przypadków testowych, dokumentowania wyników
oraz raportowania błędów.
