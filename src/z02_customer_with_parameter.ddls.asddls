@AbapCatalog.sqlViewName: 'Z02_CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 10'
define view Z02_CUSTOMER_WITH_PARAMETER
  with parameters
    P_FlightsBefore : abap.dats @<Environment.systemField:#SYSTEM_DATE @<EndUserText.label: 'Consider flights up to this date'
  as select from Z02_BOOKING_AND_CUSTOMER as bac
{
  key bac.customid          as id,
      bac.name,
      bac.street,
      bac.city,
      bac.country,
      sum( bac.amount )     as sum_amount @<Semantics.amount.currencyCode: 'bac.currency',
      bac.currency,
      avg( bac.days_ahead ) as avg_days_ahead
}
where
  bac.fldate <= $parameters.P_FlightsBefore
group by
  bac.customid,
  bac.name,
  bac.street,
  bac.city,
  bac.country,
  bac.currency 
 