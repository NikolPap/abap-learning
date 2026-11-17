CLASS zcl_account DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING iv_owner TYPE string.
    METHODS deposit
      IMPORTING iv_amount TYPE i
      RAISING   zcx_invalid_amount.
    METHODS withdraw
      IMPORTING iv_amount TYPE i
      RAISING   zcx_insufficient_funds.
    METHODS get_balance
      RETURNING VALUE(rv_balance) TYPE i.

  PROTECTED SECTION.
    DATA mv_owner   TYPE string.
    DATA mv_balance TYPE i.
ENDCLASS.

CLASS zcl_account IMPLEMENTATION.
  METHOD constructor.
    mv_owner = iv_owner.
  ENDMETHOD.

  METHOD deposit.
    IF iv_amount <= 0.
      RAISE EXCEPTION NEW zcx_invalid_amount( ).
    ENDIF.
    mv_balance += iv_amount.
  ENDMETHOD.

  METHOD withdraw.
    IF iv_amount > mv_balance.
      RAISE EXCEPTION NEW zcx_insufficient_funds( ).
    ENDIF.
    mv_balance -= iv_amount.
  ENDMETHOD.

  METHOD get_balance.
    rv_balance = mv_balance.
  ENDMETHOD.
ENDCLASS.
