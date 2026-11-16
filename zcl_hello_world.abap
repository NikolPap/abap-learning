CLASS zcl_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.
  " Δήλωση μεταβλητών
  DATA lv_name   TYPE string VALUE `Nikoleta`.
  DATA lv_age    TYPE i      VALUE 30.
  DATA lv_price  TYPE p LENGTH 8 DECIMALS 2 VALUE '19.99'.

  out->write( |Hallo { lv_name }, Alter: { lv_age }| ).

  " Loop
  DO 3 TIMES.
    out->write( |Durchlauf { sy-index }| ).
  ENDDO.

  " If / Else
  IF lv_age >= 18.
    out->write( 'Erwachsen' ).
  ELSE.
    out->write( 'Minderjährig' ).
  ENDIF.

  " Inline-Deklaration und Tabelle (ABAP-Version von List<String>)
  DATA(lt_names) = VALUE string_table( ( `Anna` ) ( `Ben` ) ( `Clara` ) ).

  LOOP AT lt_names INTO DATA(lv_n).
    out->write( lv_n ).
  ENDLOOP.
ENDMETHOD.
ENDCLASS.
