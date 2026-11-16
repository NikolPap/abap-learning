CLASS zcl_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
  DATA lv_sum   TYPE i      VALUE 0.

  " Loop
  DO 10 TIMES.
   lv_sum = lv_sum + sy-index.
  ENDDO.
  out->write( lv_sum ).

  " If / Else
  IF lv_sum MOD 2 = 0.
    out->write( 'gerade' ).
  ELSE.
    out->write( 'ungerade' ).
  ENDIF.
ENDMETHOD.
ENDCLASS.
