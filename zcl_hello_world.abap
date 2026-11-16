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
DATA(lv_i) = 1.
WHILE lv_i <= 10.
  lv_sum += lv_i.
  lv_i += 1.
ENDWHILE.

  " If / Else
  IF lv_sum MOD 2 = 0.
    out->write( 'gerade' ).
  ELSE.
    out->write( 'ungerade' ).
  ENDIF.
ENDMETHOD.
ENDCLASS.
