@AbapCatalog.sqlViewName: 'Z02_CUSTASSO_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 12'
define view Z02_CUSTOMER_WITH_PATH
  with parameters
    P_FlightsBefore : abap.dats @<Environment.systemField:#SYSTEM_DATE @<EndUserText.label: 'Consider flights up to this date'
  as select from Z02_ASSOCIATION as bac
{
  key bac.customid          as id,
      bac._customer.name,
      bac._customer.street,
      bac._customer.city,
      bac._customer.country,
      sum( bac.amount )     as sum_amount @<Semantics.amount.currencyCode: 'bac.currency',
      bac.currency,
      avg( bac.days_ahead ) as avg_days_ahead
}
where
  bac.fldate <= $parameters.P_FlightsBefore
group by
  bac.customid,
  bac._customer.name,
  bac._customer.street,
  bac._customer.city,
  bac._customer.country,
  bac.currency 
 