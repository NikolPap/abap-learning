# ABAP Lernprojekt: Konto-Modell mit ABAP OO und ABAP Unit

Kleines Lernprojekt zum Einstieg in die SAP-Entwicklung mit **ABAP Objects (ABAP OO)**.
Am Beispiel eines Kontomodells übe ich die Grundlagen der objektorientierten
Programmierung in ABAP und schreibe automatisierte Tests mit **ABAP Unit**.

> Status: Lernprojekt (Stand: November 2026), wird laufend erweitert.

## Entwicklungsumgebung

- Eclipse mit **ABAP Development Tools (ADT)**
- **SAP BTP ABAP Environment** (Trial)

## Inhalte und behandelte Konzepte

| Konzept | Wo im Projekt |
|---|---|
| Klassen, Attribute, Methoden, Konstruktor | `ZCL_ACCOUNT` |
| Sichtbarkeit (`PUBLIC`, `PROTECTED`, `PRIVATE`) und Kapselung | `ZCL_ACCOUNT`, `ZCL_SAVINGS_ACCOUNT` |
| Klassenbasierte Ausnahmen (`RAISE EXCEPTION`, `TRY ... CATCH`) | `ZCX_INSUFFICIENT_FUNDS`, `ZCX_INVALID_AMOUNT` |
| Vererbung und `super->constructor` | `ZCL_SAVINGS_ACCOUNT` erbt von `ZCL_ACCOUNT` |
| Interfaces und Polymorphie (`REDEFINITION`) | `ZIF_DESCRIBABLE`, `ZCL_CUSTOMER` |
| Unit-Tests mit ABAP Unit (`cl_abap_unit_assert`) | `tests/` |
| Ausführung über `IF_OO_ADT_CLASSRUN` | `ZCL_RUNNER` |

## Klassenübersicht

| Objekt | Beschreibung |
|---|---|
| `ZCL_ACCOUNT` | Konto mit Einzahlung, Auszahlung und Kontostand. Wirft Ausnahmen bei ungültigem Betrag oder zu geringem Guthaben. |
| `ZCL_SAVINGS_ACCOUNT` | Sparkonto (Unterklasse von `ZCL_ACCOUNT`) mit Zinssatz und Methode `add_interest`. |
| `ZCL_CUSTOMER` | Kunde. Hat keine Vererbungsbeziehung zum Konto, implementiert aber dasselbe Interface. |
| `ZIF_DESCRIBABLE` | Interface mit der Methode `get_description`. |
| `ZCX_INSUFFICIENT_FUNDS` | Ausnahme: Guthaben reicht nicht für die Auszahlung. |
| `ZCX_INVALID_AMOUNT` | Ausnahme: Betrag ist null oder negativ. |
| `ZCL_RUNNER` | Ausführbare Klasse (Konsole), die die Klassen verwendet und das Verhalten demonstriert. |

## Tests

Die Tests liegen im Ordner `tests/` und gehören in der Entwicklungsumgebung
jeweils zur Klasse (Registerkarte *Test Classes*).

- `ltc_account` (für `ZCL_ACCOUNT`): Einzahlung erhöht den Kontostand,
  Auszahlung verringert ihn, zu hohe Auszahlung löst eine Ausnahme aus,
  Einzahlung von 0 löst eine Ausnahme aus.
- `ltc_savings_account` (für `ZCL_SAVINGS_ACCOUNT`): Zinsgutschrift
  erhöht den Kontostand.

Die Tests folgen dem Muster **Arrange – Act – Assert**.

## Projektstruktur

```
src/     Quelltext der Klassen und des Interfaces
tests/   ABAP-Unit-Testklassen
```

Jede Datei entspricht einem ABAP-Objekt. Die Reihenfolge der Aktivierung:
Ausnahmeklassen, Interface, `ZCL_ACCOUNT`, `ZCL_SAVINGS_ACCOUNT`,
`ZCL_CUSTOMER`, `ZCL_RUNNER`.

## Ausführen

- Anwendung: `ZCL_RUNNER` im Eclipse markieren und **F9** (*Run as ABAP Application (Console)*).
- Tests: Klasse markieren und **Strg + Umschalt + F10** (*Run As → ABAP Unit Test*).

## Nächste Schritte

- Weitere Tests (Grenzfälle, Polymorphie)
- Interne Tabellen, `SELECT` und ABAP Dictionary
- Kleines Beispiel mit Datenbankzugriff
