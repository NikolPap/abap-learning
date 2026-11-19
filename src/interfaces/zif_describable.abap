INTERFACE zif_describable
  PUBLIC.

  METHODS get_description
    RETURNING VALUE(rv_text) TYPE string.
ENDINTERFACE.
