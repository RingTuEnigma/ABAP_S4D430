@AbapCatalog.sqlViewName: 'Z02_ANNOT_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 4'

@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4
@AbapCatalog.buffering.status: #ACTIVE

define view Z02_ANNOTATIONS as select from sbook as b
left outer join scustom as c
    on b.customid = c.id {
    //b
    key b.carrid,
    key b.connid,
    key b.fldate,
    key b.bookid,
    b.class,
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
    c.country
}
where cancelled <> 'X'  
 