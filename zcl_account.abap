CLASS zcl_account DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor
      IMPORTING iv_owner TYPE string OPTIONAL.
    METHODS deposit
      IMPORTING iv_amount TYPE i
      RAISING   zcx_invalid_amount.
    METHODS withdraw
      IMPORTING iv_amount TYPE i
      RAISING   zcx_insufficient_funds.
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

  METHOD if_oo_adt_classrun~main.
    DATA(lo_account) = NEW zcl_account( `Nikoleta` ).

    TRY.
        lo_account->deposit( 0 ).
        out->write( 'Einzahlung erfolgreich' ).
      CATCH zcx_invalid_amount.
        out->write( 'Ungültiger Betrag' ).
    ENDTRY.

    TRY.
        lo_account->deposit( 100 ).
        lo_account->withdraw( 30 ).
        lo_account->withdraw( 200 ).
        out->write( 'Alles erledigt' ).
      CATCH zcx_invalid_amount.
        out->write( 'Ungültiger Betrag' ).
      CATCH zcx_insufficient_funds.
        out->write( 'Nicht genug Guthaben' ).
    ENDTRY.

    out->write( lo_account->get_balance( ) ).
  ENDMETHOD.
ENDCLASS.
