@AbapCatalog.sqlViewName: 'Z02_EXT_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 13'
define view Z02_EXTENDED as 
  select 
    from S4D430_Booking as b
      association [1..1] to s4d430_Customer as _Customer
        on b.customid = _Customer.id 
    {   
      key b.carrid,
      key b.connid,
      key b.fldate,
      key b.bookid,
          b.customid,
          b.agencynum,
          b.amount,
          b.currency,  
          b.days_ahead,                                   
         _Customer        // Make association public
//          c.name,
//          c.street,
//          c.postcode,
//          c.city,
//          c.country
} 
 