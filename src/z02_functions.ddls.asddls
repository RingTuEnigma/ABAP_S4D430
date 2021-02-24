@AbapCatalog.sqlViewName: 'Z02_FUNC_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 6'
define view Z02_FUNCTIONS as select from sbook as b
left outer join scustom as c
    on b.customid = c.id {
    //b
    key b.carrid,
    key b.connid,
    key b.fldate,
    key b.bookid,
    case class
    when 'Y' then 'Economy'
    when 'C' then 'Business'
    when 'F' then 'First'
    else 'no class'
    end as class_name,
    currency_conversion( amount => b.forcuram, source_currency => forcurkey, target_currency => cast('USD' as abap.cuky), exchange_rate_date => b.fldate, error_handling => 'SET_TO_NULL' ) as amount @<Semantics.amount.currencyCode: 'CURRENCY',
    cast('USD' as abap.cuky) as currency @<Semantics.currencyCode: true,
    b.luggweight @<Semantics.quantity.unitOfMeasure: 'WUNIT',
    b.wunit @<Semantics.quantity.unitOfMeasure: 'WUNIT',
    b.order_date,
    dats_days_between(b.order_date, b.fldate) as days_ahead,
    b.agencynum,
    b.counter,
    b.customid,
    //c
    concat_with_space(c.name, c.form, 1) as name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    division(cast(discount as abap.int4), 100, 2) as percent_discount 
    @<EndUserText.label: 'Discount Factor' @<EndUserText.quickInfo: 'Customer Specific Discount'
}
where cancelled <> 'X' 
 