@AbapCatalog.sqlViewName: 'Z02_ASSO_SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task 11'
define view Z02_ASSOCIATION as select
                 from Z02_BOOKING as b association [1..1] to Z02_CUSTOMER as _customer 
                                         on b.customid = _customer.id
                  { key b.carrid,
                    key b.connid,
                    key b.fldate,
                    key b.bookid,
                        b.class,
                        b.amount,
                        b.currency,                      
                        b.luggweight,
                        b.wunit,                                 
                        b.order_date,
                        dats_days_between(b.order_date, b.fldate) as days_ahead,        
                        b.agencynum,
                        b.counter,
                        b.customid,
                        _customer
//                        c.name,                   
////                        concat(concat( c.form, ' '), c.name) as name,                    // Workaround in 7.40
//                        c.street,
//                        c.postcode,
//                        c.city,
//                        c.country,
//                        @EndUserText.label: 'Discount Factor'
//                        @EndUserText.quickInfo: 'Customer Specific Discount Factor'
//                        c.discount                        
                    }
                   where cancelled <> 'X' 
 