CLASS zcl_account_repository DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_owner_by_id
      IMPORTING iv_id           TYPE i
      RETURNING VALUE(rv_owner) TYPE string
      RAISING   zcx_account_not_found.
    METHODS get_total_balance
      RETURNING VALUE(rv_total) TYPE i.
    METHODS get_balance_by_id
      IMPORTING iv_id             TYPE i
      RETURNING VALUE(rv_balance) TYPE i
      RAISING   zcx_account_not_found.
ENDCLASS.

CLASS zcl_account_repository IMPLEMENTATION.
  METHOD get_owner_by_id.
    SELECT SINGLE owner
      FROM zaccount
      WHERE id = @iv_id
      INTO @DATA(lv_owner).
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_account_not_found( ).
    ENDIF.
    rv_owner = lv_owner.
  ENDMETHOD.

  METHOD get_total_balance.
    SELECT SUM( balance ) FROM zaccount INTO @rv_total.
  ENDMETHOD.

  METHOD get_balance_by_id.
    SELECT SINGLE balance
      FROM zaccount
      WHERE id = @iv_id
      INTO @DATA(lv_balance).
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_account_not_found( ).
    ENDIF.
    rv_balance = lv_balance.
  ENDMETHOD.

ENDCLASS.
