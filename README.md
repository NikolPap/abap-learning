# ABAP Lernprojekt: Konto-Modell mit ABAP OO, ABAP Unit und ABAP SQL
Kleines Lernprojekt zum Einstieg in die SAP-Entwicklung mit **ABAP Objects (ABAP OO)**.
Am Beispiel eines Kontomodells übe ich objektorientierte Programmierung in ABAP,
schreibe automatisierte Tests mit **ABAP Unit** und lese Daten mit **ABAP SQL**.
> Status: Lernprojekt (Stand: November 2026), wird laufend erweitert.
## Entwicklungsumgebung
- Eclipse mit ABAP Development Tools (ADT)
- SAP BTP ABAP Environment (Trial)
## Behandelte Konzepte
| Konzept | Wo im Projekt |
|---|---|
| Klassen, Attribute, Methoden, Konstruktor | `ZCL_ACCOUNT` |
| Sichtbarkeit und Kapselung | `ZCL_ACCOUNT`, `ZCL_SAVINGS_ACCOUNT` |
| Klassenbasierte Ausnahmen (`TRY ... CATCH`) | `ZCX_*` |
| Vererbung | `ZCL_SAVINGS_ACCOUNT` erbt von `ZCL_ACCOUNT` |
| Interfaces und Polymorphie | `ZIF_DESCRIBABLE`, `ZCL_CUSTOMER` |
| Unit-Tests (`cl_abap_unit_assert`) | `tests/` |
| Interne Tabellen und Strukturen | `ZCL_TABLES_DEMO` |
| Datenbanktabelle und ABAP SQL | `ZACCOUNT`, `ZCL_DB_DEMO` |
| Repository-Klasse mit eigener Ausnahme | `ZCL_ACCOUNT_REPOSITORY` |
## Projektstruktur
```
src/classes/ Klassen mit der Fachlogik
src/exceptions/ Ausnahmeklassen
src/interfaces/ Interfaces
src/database/ Definition der Datenbanktabelle
src/runners/ Ausführbare Klassen (Konsole)
tests/ ABAP-Unit-Testklassen
```
Reihenfolge der Aktivierung: Datenbanktabelle, Ausnahmeklassen, Interface,
`ZCL_ACCOUNT`, `ZCL_SAVINGS_ACCOUNT`, `ZCL_CUSTOMER`,
`ZCL_ACCOUNT_REPOSITORY`, danach die Runner.
## Ausführen
- Anwendung: Runner-Klasse markieren und **F9**.
- Tests: Klasse markieren und **Strg + Umschalt + F10**.
## Nächste Schritte
- Tests für das Repository
- Weitere Beispiele mit Datenbankzugriff
