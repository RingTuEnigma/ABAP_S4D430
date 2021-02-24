@AbapCatalog.sqlViewName: 'Z02_Join_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 3'
define view Z02_Join_And_Selection as select from sbook as b
left outer join scustom as c
    on b.customid = c.id {
    //b
    b.mandt,
    carrid,
    connid,
    fldate,
    bookid,
    customid,
    b.custtype,
    smoker,
    luggweight,
    wunit,
    invoice,
    class,
    forcuram,
    forcurkey,
    loccuram,
    loccurkey,
    order_date,
    counter,
    agencynum,
    cancelled,
    reserved,
    passname,
    passform,
    passbirth,
    //c
    name,
    form,
    street,
    postbox,
    postcode,
    city,
    country,
    region,
    telephone,
    discount,
    langu,
    email,
    webuser
}
where cancelled <> 'X' 
 