CLASS zcl_runner DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_runner IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.
  DATA lo_item TYPE REF TO zif_describable.

  lo_item = NEW zcl_account( `Anna` ).
  out->write( lo_item->get_description( ) ).

  lo_item = NEW zcl_savings_account( iv_owner = `Ben`
                                     iv_rate  = 3 ).
  out->write( lo_item->get_description( ) ).

  lo_item = NEW zcl_customer( `Clara` ).
  out->write( lo_item->get_description( ) ).
ENDMETHOD.
ENDCLASS.
