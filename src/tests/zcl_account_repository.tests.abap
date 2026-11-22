*"* use this source file for your ABAP unit test classes
CLASS ltc_repo DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    CLASS-DATA go_env TYPE REF TO if_osql_test_environment.
    DATA mo_cut TYPE REF TO zcl_account_repository.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.
    METHODS setup.
    METHODS owner_unknown_id_raises  FOR TESTING RAISING cx_static_check.
    METHODS balance_unknown_id_raises FOR TESTING RAISING  cx_static_check.
    METHODS owner_returns_owner FOR TESTING RAISING cx_static_check.
    METHODS balance_returns_balance FOR TESTING RAISING cx_static_check.
    METHODS total_sums_all FOR TESTING RAISING cx_static_check.
    METHODS total_empty_table_is_zero FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltc_repo IMPLEMENTATION.
  METHOD class_setup.
    go_env = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'ZACCOUNT' ) ) ).
  ENDMETHOD.

  METHOD class_teardown.
    go_env->destroy( ).
  ENDMETHOD.

  METHOD setup.
    go_env->clear_doubles( ).
    mo_cut = NEW zcl_account_repository( ).
  ENDMETHOD.

  METHOD owner_unknown_id_raises.
    DATA lt_data TYPE STANDARD TABLE OF zaccount WITH EMPTY KEY.
    lt_data = VALUE #( ( id = 1 owner = 'Anna' balance = 100 ) ).
    go_env->insert_test_data( lt_data ).

    TRY.
        DATA(lv_owner) = mo_cut->get_owner_by_id( 99 ).

        cl_abap_unit_assert=>fail( msg = 'Expected exception was not raised' ).
      CATCH zcx_account_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD balance_unknown_id_raises.
    DATA lt_data TYPE STANDARD TABLE OF zaccount WITH EMPTY KEY.
    lt_data = VALUE #( ( id = 1 owner = 'Anna' balance = 100 ) ).
    go_env->insert_test_data( lt_data ).

    TRY.
        DATA(lv_balance) = mo_cut->get_balance_by_id( 99 ).

        cl_abap_unit_assert=>fail( msg = 'Expected exception was not raised' ).
      CATCH zcx_account_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD owner_returns_owner.
    DATA lt_data TYPE STANDARD TABLE OF zaccount WITH EMPTY KEY.
    lt_data = VALUE #( ( id = 1 owner = 'Anna' balance = 100 ) ).
    go_env->insert_test_data( lt_data ).

    DATA(lv_owner) = mo_cut->get_owner_by_id( 1 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_owner
      exp = `Anna` ).
  ENDMETHOD.

  METHOD balance_returns_balance.
    DATA lt_data TYPE STANDARD TABLE OF zaccount WITH EMPTY KEY.
    lt_data = VALUE #( ( id = 1 owner = 'Anna' balance = 100 ) ).
    go_env->insert_test_data( lt_data ).

    DATA(lv_balance) = mo_cut->get_balance_by_id( 1 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_balance
      exp = 100 ).
  ENDMETHOD.

  METHOD total_sums_all.
    DATA lt_data TYPE STANDARD TABLE OF zaccount WITH EMPTY KEY.
    lt_data = VALUE #( ( id = 1 owner = 'Anna' balance = 100 )
    ( id = 2 owner = 'Clara' balance = 250 )
    ( id = 3 owner = 'Ben' balance = 80 )
     ).
    go_env->insert_test_data( lt_data ).

    DATA(lv_total) = mo_cut->get_total_balance( ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_total
      exp = 430 ).
  ENDMETHOD.

  METHOD total_empty_table_is_zero.
    cl_abap_unit_assert=>assert_equals(
        act = mo_cut->get_total_balance( )
        exp = 0 ).
  ENDMETHOD.


ENDCLASS.
