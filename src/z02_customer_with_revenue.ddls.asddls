@AbapCatalog.sqlViewName: 'Z02_CUST_WR_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 8'
define view Z02_CUSTOMER_WITH_REVENUE
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
group by
  bac.customid,
  bac.name,
  bac.street,
  bac.city,
  bac.country,
  bac.currency 
 