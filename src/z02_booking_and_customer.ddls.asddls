@AbapCatalog.sqlViewName: 'Z02_BOOK_CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@VDM.viewType: #BASIC
@EndUserText.label: 'Task 7'
define view Z02_BOOKING_AND_CUSTOMER as select
                 from Z02_BOOKING as b inner join Z02_CUSTOMER as c 
                                         on b.customid = c.id
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
                        c.name,                   
//                        concat(concat( c.form, ' '), c.name) as name,                    // Workaround in 7.40
                        c.street,
                        c.postcode,
                        c.city,
                        c.country,
                        @EndUserText.label: 'Discount Factor'
                        @EndUserText.quickInfo: 'Customer Specific Discount Factor'
                        c.discount                        
                    }
                   where cancelled <> 'X' 
 