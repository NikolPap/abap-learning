CLASS zcl_repo_runner DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_repo_runner IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_repo) = NEW zcl_account_repository( ).

    TRY.
        out->write( lo_repo->get_owner_by_id( 2 ) ).
        out->write( lo_repo->get_balance_by_id( 3 ) ).
        out->write( lo_repo->get_balance_by_id( 99 ) ).
      CATCH zcx_account_not_found.
        out->write( 'Konto nicht gefunden' ).
    ENDTRY.

    out->write( |Gesamt: { lo_repo->get_total_balance( ) }| ).
  ENDMETHOD.
ENDCLASS.
