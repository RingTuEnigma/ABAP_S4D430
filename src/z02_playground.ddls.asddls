@AbapCatalog.sqlViewName: 'Z02_PLAY_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Playground'
define view Z02_PLAYGROUND as select from sflight {
    1234 as col_int
} 
 