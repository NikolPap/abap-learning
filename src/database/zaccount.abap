@EndUserText.label : 'Accounts'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zaccount {

  key client : abap.clnt not null;
  key id     : abap.int4 not null;
  owner      : abap.char(40);
  balance    : abap.int4;

}
