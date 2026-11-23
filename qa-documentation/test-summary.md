
# Podsumowanie testów – CountriesApp

## 1. Informacje o projekcie

**Nazwa aplikacji:** CountriesApp  
**Rodzaj testów:** Testowanie manualne  
**Środowisko:** Emulator Pixel 4, Android API 34  
**Narzędzie:** Android Studio

## 2. Cel testowania

Celem testów było sprawdzenie poprawności
działania aplikacji CountriesApp, w szczególności
wyszukiwania krajów, wyświetlania szczegółów,
nawigacji oraz działania w trybie offline.

## 3. Wyniki testów

| ID | Nazwa testu | Wynik |
|---|---|---|
| TC-001 | Wyszukiwanie kraju | PASS |
| TC-002 | Wyszukiwanie nieistniejącego kraju | PASS |
| TC-003 | Wyszukiwanie niezależnie od wielkości liter | PASS |
| TC-004 | Wyszukiwanie po fragmencie nazwy | PASS |
| TC-005 | Przywracanie listy krajów | PASS |
| TC-006 | Działanie aplikacji offline | PASS |
| TC-007 | Działanie po przywróceniu internetu | PASS |
| TC-008 | Nawigacja między ekranami | PASS |
| TC-009 | Wyszukiwanie z dodatkowymi spacjami | FAIL |
| TC-010 | Wyszukiwanie długiego tekstu | PASS |

## 4. Statystyki

- Liczba wykonanych testów: 10
- Testy zakończone PASS: 9
- Testy zakończone FAIL: 1
- Odsetek testów PASS: 90%

## 5. Wykryte problemy

**BUG-001 – Wyszukiwanie kraju ze spacjami**

Aplikacja nie wyświetla wyników, gdy
użytkownik wpisze dodatkowe spacje przed
nazwą kraju lub po niej.

Problem opisano w pliku `bug-reports.md`.

Wynik FAIL ustalono względem założenia,
że wyszukiwarka powinna ignorować zbędne spacje.
Zachowanie wymaga potwierdzenia w wymaganiach.

## 6. Wnioski końcowe

Większość przeprowadzonych testów zakończyła
się sukcesem.

Aplikacja poprawnie obsługiwała wyszukiwanie
krajów, nawigację oraz dostęp do wcześniej
pobranych danych w trybie offline.

Zaobserwowano problem z obsługą dodatkowych
spacji podczas wyszukiwania.

Przeprowadzone testy nie obejmują wszystkich
możliwych scenariuszy działania aplikacji.
