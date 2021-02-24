@AbapCatalog.sqlViewName: 'Z02_CUST_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 7'
define view Z02_CUSTOMER
  as select from scustom as c
{
  c.id,
  concat_with_space(c.form, c.name, 1)            as name,
  //                        concat(concat( c.form, ' '), c.name) as name,                    // Workaround in 7.40
  c.street,
  c.postcode,
  c.city,
  c.country,
  @EndUserText.label: 'Discount Factor'
  @EndUserText.quickInfo: 'Customer Specific Discount Factor'
  division(cast(c.discount as abap.int4), 100, 2) as discount
} 
 