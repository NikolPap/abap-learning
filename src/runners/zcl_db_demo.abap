CLASS zcl_db_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_db_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zaccount.

      INSERT zaccount FROM TABLE @( VALUE #(
      ( id = 1 owner = 'Anna'  balance = 100 )
      ( id = 2 owner = 'Ben'   balance = 250 )
      ( id = 3 owner = 'Clara' balance = 80 ) ) ).

    COMMIT WORK.


    SELECT * FROM zaccount INTO TABLE @DATA(lt_all).
    LOOP AT lt_all INTO DATA(ls_row).
      out->write( |{ ls_row-owner }: { ls_row-balance }| ).
    ENDLOOP.

    SELECT id, owner, balance
      FROM zaccount
      WHERE balance < 100
      ORDER BY balance DESCENDING
      INTO TABLE @DATA(lt_rich).
    out->write( lt_rich ).


    SELECT SINGLE owner, balance
      FROM zaccount
      WHERE id = 2
     INTO @DATA(ls_ben).
    IF sy-subrc = 0.
      out->write( |{ ls_ben-owner }: { ls_ben-balance }| ).
    ENDIF.

    SELECT SUM( balance ) FROM zaccount INTO @DATA(lv_total).
    out->write( |Gesamt: { lv_total }| ).
  ENDMETHOD.
ENDCLASS.
