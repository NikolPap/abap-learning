CLASS zcl_savings_account DEFINITION
  PUBLIC
  INHERITING FROM zcl_account
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING iv_owner TYPE string
                iv_rate  TYPE i.
    METHODS add_interest.

  PRIVATE SECTION.
    DATA mv_rate TYPE i.
ENDCLASS.

CLASS zcl_savings_account IMPLEMENTATION.
  METHOD constructor.
    super->constructor( iv_owner ).
    mv_rate = iv_rate.
  ENDMETHOD.

  METHOD add_interest.
    mv_balance += mv_balance * mv_rate / 100.
  ENDMETHOD.
ENDCLASS.
