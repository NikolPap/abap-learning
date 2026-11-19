CLASS zcl_tables_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_tables_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lt_numbers TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA lv_number  TYPE i.
    DATA lv_sum     TYPE i.

    lt_numbers = VALUE #( ( 10 ) ( 20 ) ( 30 ) ).
    out->write( lines( lt_numbers ) ).

    LOOP AT lt_numbers INTO lv_number.
      out->write( lv_number ).
    ENDLOOP.

    LOOP AT lt_numbers INTO lv_number.
      lv_sum += lv_number.
    ENDLOOP.
    out->write( lv_sum ).

    out->write( lt_numbers[ 2 ] ).
  ENDMETHOD.
ENDCLASS.
