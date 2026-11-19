CLASS zcl_tables_demo_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_tables_demo_2 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
  TYPES: BEGIN OF ty_account,
           id      TYPE i,
           owner   TYPE string,
           balance TYPE i,
         END OF ty_account.
  TYPES ty_accounts TYPE STANDARD TABLE OF ty_account WITH EMPTY KEY.

  DATA lv_total TYPE i.

   DATA(lt_accounts) = VALUE ty_accounts(
    ( id = 1 owner = `Anna`  balance = 100 )
    ( id = 2 owner = `Ben`   balance = 250 )
    ( id = 3 owner = `Clara` balance = 80 )
    ( id = 4 owner = `DOra` balance = 500 ) ).

  SORT lt_accounts BY balance DESCENDING.
  LOOP AT lt_accounts INTO DATA(ls_account).
    out->write( |{ ls_account-owner }: { ls_account-balance }| ).
  ENDLOOP.

  LOOP AT lt_accounts INTO ls_account.
    lv_total += ls_account-balance.
  ENDLOOP.
  out->write( |Gesamt: { lv_total }| ).

  LOOP AT lt_accounts INTO ls_account WHERE balance < 100.
    out->write( ls_account-owner ).
  ENDLOOP.

  IF line_exists( lt_accounts[ owner = `Ben` ] ).
    out->write( lt_accounts[ owner = `Ben` ]-balance ).
  ENDIF.
ENDMETHOD.
ENDCLASS.
