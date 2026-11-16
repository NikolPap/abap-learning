CLASS zcl_account DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor
      IMPORTING iv_owner TYPE string.
    METHODS deposit
      IMPORTING iv_amount TYPE i.
    METHODS get_balance
      RETURNING VALUE(rv_balance) TYPE i.

  PRIVATE SECTION.
    DATA mv_owner   TYPE string.
    DATA mv_balance TYPE i.
ENDCLASS.

CLASS zcl_account IMPLEMENTATION.
  METHOD constructor.
    mv_owner = iv_owner.
  ENDMETHOD.

  METHOD deposit.
    mv_balance += iv_amount.
  ENDMETHOD.

  METHOD get_balance.
    rv_balance = mv_balance.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_account) = NEW zcl_account( `Nikoleta` ).
    lo_account->deposit( 100 ).
    lo_account->deposit( 50 ).
    out->write( lo_account->get_balance( ) ).
  ENDMETHOD.
ENDCLASS.
