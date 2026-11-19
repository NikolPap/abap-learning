CLASS zcl_customer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_describable.

    METHODS constructor
      IMPORTING iv_name TYPE string.

  PRIVATE SECTION.
    DATA mv_name TYPE string.
ENDCLASS.

CLASS zcl_customer IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD zif_describable~get_description.
    rv_text = |Kunde: { mv_name }|.
  ENDMETHOD.
ENDCLASS.
