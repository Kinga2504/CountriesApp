
# TC-001 – Wyszukiwanie kraju

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

## Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.

## Kroki testowe
1. Wpisz `Poland` w pole wyszukiwania.
2. Wybierz znaleziony kraj.
3. Sprawdź wyświetlone szczegóły.

## Oczekiwany rezultat
Polska zostaje odnaleziona, a ekran szczegółów wyświetla prawidłowe informacje.

## Rzeczywisty rezultat
Wyszukiwanie zadziałało, a ekran szczegółów Polski wyświetlił flagę, stolicę, region, język, walutę i kod kraju.

**Wynik: PASS**



## TC-002 – Wyszukiwanie nieistniejącego kraju

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.

### Kroki testowe
1. Otwórz listę krajów.
2. Kliknij pole wyszukiwania.
3. Wpisz `XYZ123`.
4. Sprawdź wyświetlone wyniki.

### Oczekiwany rezultat
Aplikacja nie wyświetla krajów niepasujących do wyszukiwanej frazy i pozostaje responsywna.

### Rzeczywisty rezultat
Lista krajów jest pusta. Aplikacja nadal pozwala na wpisywanie tekstu.

**Wynik: PASS**

### Uwaga UX
Po wpisaniu nieistniejącej nazwy kraju wyświetla się pusty ekran bez komunikatu o braku wyników. Warto rozważyć dodanie informacji „Nie znaleziono kraju”.


---

## TC-003 – Wyszukiwanie niezależnie od wielkości liter

**Typ testu:** Funkcjonalny  
**Urządzenie:** Pixel 4, Android API 34  
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Użytkownik znajduje się na ekranie listy krajów.

### Kroki testowe
1. Wpisz `poland` w pole wyszukiwania.
2. Sprawdź, czy pojawi się Polska.
3. Usuń tekst i wpisz `POLAND`.
4. Sprawdź, czy pojawi się Polska.
5. Usuń tekst i wpisz `PoLaNd`.
6. Sprawdź, czy pojawi się Polska.

### Oczekiwany rezultat
Aplikacja wyszukuje Polskę niezależnie od wielkości wpisanych liter.

### Rzeczywisty rezultat
Dla wszystkich trzech wariantów:
- `poland`
- `POLAND`
- `PoLaNd`

aplikacja poprawnie wyświetliła Polskę.

**Wynik: PASS**


---

## TC-004 – Wyszukiwanie po fragmencie nazwy kraju

**Typ testu:** Funkcjonalny  
**Urządzenie:** Pixel 4, Android API 34  
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Użytkownik znajduje się na liście krajów.

### Kroki testowe
1. Kliknij pole wyszukiwania.
2. Wpisz `pol`.
3. Sprawdź wyświetlone wyniki.

### Oczekiwany rezultat
Aplikacja wyświetla kraje, których nazwy
zawierają wpisany fragment `pol`.

### Rzeczywisty rezultat
Aplikacja wyświetliła dwa kraje:
- Poland
- French Polynesia

Obie nazwy zawierają fragment `pol`.

**Wynik: PASS**


---

## TC-005 – Przywracanie listy po wyczyszczeniu wyszukiwania

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Użytkownik znajduje się na liście krajów.

### Kroki testowe
1. Wpisz `Poland` w pole wyszukiwania.
2. Sprawdź, czy pojawi się Polska.
3. Usuń cały wpisany tekst.
4. Sprawdź, czy lista krajów została przywrócona.
5. Spróbuj przewinąć listę.
6. Naciśnij przycisk Wstecz systemu Android.

### Oczekiwany rezultat
Po wyczyszczeniu wyszukiwarki aplikacja ponownie
wyświetla listę krajów i umożliwia jej przewijanie.
Naciśnięcie Wstecz zamyka klawiaturę.

### Rzeczywisty rezultat
- Lista krajów została przywrócona.
- Przewijanie listy działa poprawnie.
- Klawiatura pozostała otwarta po usunięciu tekstu.
- Po naciśnięciu Wstecz klawiatura została zamknięta.

**Wynik: PASS**


---

## TC-006 – Działanie aplikacji w trybie offline

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp została wcześniej uruchomiona
  z dostępem do internetu.
- Dane krajów zostały wcześniej pobrane.
- W emulatorze włączono tryb samolotowy.

### Kroki testowe
1. Uruchom aplikację z dostępem do internetu.
2. Otwórz szczegóły Polski.
3. Wróć do listy krajów.
4. Włącz tryb samolotowy.
5. Uruchom ponownie aplikację.
6. Otwórz szczegóły Andory.
7. Wróć do listy krajów.
8. Wyszukaj `Poland`.
9. Otwórz szczegóły Polski.

### Oczekiwany rezultat
Aplikacja umożliwia przeglądanie wcześniej
pobranych danych krajów bez dostępu do internetu.

### Rzeczywisty rezultat
- Lista krajów była dostępna offline.
- Można było otworzyć szczegóły Andory.
- Wyszukiwanie Polski działało bez internetu.
- Szczegóły Polski wyświetlały się prawidłowo.
- Widoczne były flaga, stolica, region,
  język, waluta i kod kraju.

**Wynik: PASS**


---

## TC-007 – Działanie aplikacji po przywróceniu internetu

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest zainstalowana.
- Wcześniej włączono tryb samolotowy.

### Kroki testowe
1. Wyłącz tryb samolotowy.
2. Upewnij się, że internet działa.
3. Uruchom ponownie aplikację CountriesApp.
4. Sprawdź, czy lista krajów jest widoczna.
5. Wyszukaj `Germany`.
6. Otwórz szczegóły Niemiec.

### Oczekiwany rezultat
Po przywróceniu połączenia internetowego
aplikacja umożliwia przeglądanie listy,
wyszukiwanie i otwieranie szczegółów krajów.

### Rzeczywisty rezultat
- Aplikacja działała po przywróceniu internetu.
- Wyszukiwanie Niemiec zakończyło się sukcesem.
- Ekran szczegółów wyświetlił:
    - Stolicę: Berlin
    - Region: Europe
    - Język: German
    - Walutę: EUR
    - Kod kraju: DEU
    - Flagę Niemiec

**Wynik: PASS**

### Uwagi
Test potwierdza działanie aplikacji po odzyskaniu
połączenia, ale nie weryfikuje, czy dane zostały
ponownie pobrane z API.



---

## TC-008 – Nawigacja między ekranami aplikacji

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Użytkownik znajduje się na liście krajów.

### Kroki testowe
1. Wpisz `germ` w pole wyszukiwania.
2. Wybierz kraj Germany.
3. Sprawdź, czy otworzył się ekran szczegółów.
4. Kliknij strzałkę Wstecz w aplikacji.
5. Sprawdź, czy wyświetla się lista krajów.
6. Sprawdź, czy wyszukiwana fraza została zachowana.

### Oczekiwany rezultat
Aplikacja powraca do listy krajów i zachowuje
wcześniej wpisaną frazę wyszukiwania.

### Rzeczywisty rezultat
- Powrót do listy krajów zadziałał poprawnie.
- Wyszukiwarka zachowała wpisaną frazę `germ`.
- Kraj Germany nadal był widoczny na liście.
- Aplikacja działała prawidłowo.

**Wynik: PASS**



---

## TC-009 – Wyszukiwanie kraju z dodatkowymi spacjami

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** FAIL

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Lista krajów została załadowana.

### Kroki testowe
1. Wpisz `Poland` w wyszukiwarkę.
2. Sprawdź, czy pojawia się Polska.
3. Wpisz ` Poland` (spacja na początku).
4. Sprawdź wyniki wyszukiwania.
5. Wpisz `Poland ` (spacja na końcu).
6. Sprawdź wyniki wyszukiwania.
7. Wpisz ` Poland ` (spacje po obu stronach).
8. Sprawdź wyniki wyszukiwania.

### Oczekiwany rezultat
Aplikacja ignoruje zbędne spacje na początku
i końcu nazwy oraz wyświetla Polskę.

### Rzeczywisty rezultat
- `Poland` – znaleziono Polskę.
- ` Poland` – brak wyników.
- `Poland ` – brak wyników.
- ` Poland ` – brak wyników.

**Wynik: FAIL**

### Uwagi
Wyszukiwarka nie ignoruje początkowych
i końcowych spacji. Zachowanie wymaga
potwierdzenia względem specyfikacji.



---

## TC-010 – Wyszukiwanie bardzo długiego tekstu

**Typ testu:** Funkcjonalny
**Urządzenie:** Pixel 4, Android API 34
**Status:** PASS

### Warunki wstępne
- Aplikacja CountriesApp jest uruchomiona.
- Lista krajów została załadowana.

### Kroki testowe
1. Otwórz listę krajów.
2. Kliknij pole wyszukiwania.
3. Wprowadź długi tekst:
   `PolandGermanyFranceItalySpainPortugalNetherlandsBelgiumSwedenNorwayDenmarkFinlandGreeceAustriaSwitzerland`
4. Sprawdź zachowanie aplikacji.
5. Usuń cały wpisany tekst.
6. Sprawdź, czy lista krajów została przywrócona.
7. Spróbuj przewinąć listę.

### Oczekiwany rezultat
- Aplikacja nie zawiesza się ani nie zamyka.
- Pole wyszukiwania obsługuje długi tekst.
- Nie pojawiają się niepasujące kraje.
- Po wyczyszczeniu pola lista krajów wraca.
- Można przewijać listę krajów.

### Rzeczywisty rezultat
- Aplikacja działała stabilnie.
- Długi tekst został przyjęty w wyszukiwarce.
- Pole tekstowe umożliwiało poziome przesuwanie treści.
- Nie wyświetlono niepasujących krajów.
- Po usunięciu tekstu lista krajów wróciła.
- Przewijanie listy działało prawidłowo.

**Wynik: PASS**

