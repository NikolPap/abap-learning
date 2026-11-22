# ABAP Lernprojekt: Konto-Modell mit ABAP OO, ABAP Unit, ABAP SQL und Fiori

Kleines Lernprojekt zum Einstieg in die SAP-Entwicklung mit **ABAP Objects (ABAP OO)**.
Am Beispiel eines Kontomodells übe ich objektorientierte Programmierung in ABAP,
schreibe automatisierte Tests mit **ABAP Unit**, lese Daten mit **ABAP SQL** und
stelle sie in einer **Fiori-Elements-Anwendung** dar.

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
| CDS View Entity, OData V4, Fiori Elements | `ZI_ACCOUNT`, `ZUI_ACCOUNT` |

## Tests

Die Tests gehören in der Entwicklungsumgebung jeweils zur Klasse (Registerkarte *Test Classes*)
und liegen hier im Ordner `tests/`. Sie folgen dem Muster **Arrange – Act – Assert**.

- `ltc_account` (für `ZCL_ACCOUNT`): Einzahlung erhöht den Kontostand, Auszahlung verringert ihn,
  zu hohe Auszahlung löst eine Ausnahme aus, Einzahlung von 0 löst eine Ausnahme aus.
- `ltc_savings_account` (für `ZCL_SAVINGS_ACCOUNT`): Zinsgutschrift erhöht den Kontostand.
- `ltc_repo` (für `ZCL_ACCOUNT_REPOSITORY`): Tests mit Testdoubles (`cl_osql_test_environment`)
  für Lesezugriffe, Summe und Fehlerfälle. Die echte Datenbanktabelle bleibt dabei unberührt.

## Fiori-Anwendung (RAP, Fiori Elements)

Über eine CDS View Entity (`ZI_ACCOUNT`), eine Service Definition (`ZUI_ACCOUNT`) und ein
Service Binding (`ZUI_ACCOUNT_O4`, OData V4 – UI) werden die Konten in einer
Fiori-Elements-Listenanwendung angezeigt. Spalten und Filter ergeben sich aus den
`@UI`-Annotationen. Der Zugriff ist rein lesend.

![Fiori-Vorschau](docs/fiori-preview.png)

## Projektstruktur

```
src/classes/      Klassen mit der Fachlogik
src/exceptions/   Ausnahmeklassen
src/interfaces/   Interfaces
src/database/     Definition der Datenbanktabelle
src/rap/          CDS View Entity und Service Definition
src/runners/      Ausführbare Klassen (Konsole)
tests/            ABAP-Unit-Testklassen
docs/             Screenshot der Fiori-Anwendung
```

Reihenfolge der Aktivierung: Datenbanktabelle, Ausnahmeklassen, Interface,
`ZCL_ACCOUNT`, `ZCL_SAVINGS_ACCOUNT`, `ZCL_CUSTOMER`, `ZCL_ACCOUNT_REPOSITORY`,
danach die Runner, zuletzt CDS View, Service Definition und Service Binding.

## Ausführen

- Anwendung: Runner-Klasse markieren und **F9**.
- Tests: Klasse markieren und **Strg + Umschalt + F10**.
- Fiori-Vorschau: Service Binding öffnen, Entität `Account` wählen und **Preview** klicken.

## Nächste Schritte

- Weitere Beispiele mit Datenbankzugriff (`UPDATE`, `DELETE`)
- Schreibender Zugriff über ein RAP-Business-Object
