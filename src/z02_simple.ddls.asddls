@AbapCatalog.sqlViewName: 'z02_simple_sql'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 2'
define view Z02_SIMPLE
  as select from sbook as b
{
  //b
  carrid,
  connid,
  fldate,
  bookid,
  class,
  forcuram,
  forcurkey,
  luggweight,
  wunit,
  order_date,
  agencynum,
  counter,
  customid
} 
 