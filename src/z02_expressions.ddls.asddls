@AbapCatalog.sqlViewName: 'Z02_EXPR_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 5'
define view Z02_EXPRESSIONS as select from sbook as b
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
    b.forcuram as amount @<Semantics.amount.currencyCode: 'CURRENCY',
    b.forcurkey as currency @<Semantics.currencyCode: true,
    b.luggweight @<Semantics.quantity.unitOfMeasure: 'WUNIT',
    b.wunit @<Semantics.quantity.unitOfMeasure: 'WUNIT',
    b.order_date,
    b.agencynum,
    b.counter,
    b.customid,
    //c
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    cast( c.discount as abap.fltp) / cast( 100 as abap.fltp ) as percent_discount 
    @<EndUserText.label: 'Discount Factor' @<EndUserText.quickInfo: 'Customer Specific Discount'
}
where cancelled <> 'X'   
 