@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: { typeName: 'Konto', typeNamePlural: 'Konten' }
define view entity ZI_ACCOUNT
  as select from zaccount
{
      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key id      as AccountId,

      @UI.lineItem: [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      owner   as Owner,

      @UI.lineItem: [{ position: 30 }]
      balance as Balance
}
