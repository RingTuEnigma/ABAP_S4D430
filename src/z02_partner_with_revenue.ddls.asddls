@AbapCatalog.sqlViewName: 'Z02_PARTREV_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 9'
define view Z02_PARTNER_WITH_REVENUE as select from Z02_CUSTOMER_WITH_REVENUE as c {    
    //c
    key c.id,
    'C' as type,
    c.name,
    c.street,
    c.city,
    c.country,
    c.sum_amount,
    c.currency,
    c.avg_days_ahead
} 
union select from S4d430_Agency_With_Revenue as a {
    a.id,
    'A' as type,
    a.name,
    a.street,
    a.city,
    a.country,
    a.amount as sum_amount,
    a.currency,
    a.days_ahead as avg_days_ahead
} 
 