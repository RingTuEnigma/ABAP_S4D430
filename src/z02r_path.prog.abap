*&---------------------------------------------------------------------*
*& Report z02r_path
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02r_path.

TYPES: BEGIN OF ty_s_customer,
         id         TYPE s4d430_customer_with_parameter-id,
         name       TYPE s4d430_customer_with_parameter-name,
         street     TYPE s4d430_customer_with_parameter-street,
         postcode   TYPE s4d430_customer_with_parameter-postcode,
         city       TYPE s4d430_customer_with_parameter-city,
         country    TYPE s4d430_customer_with_parameter-country,
         amount     TYPE s4d430_customer_with_parameter-amount,
         currency   TYPE s4d430_customer_with_parameter-currency,
         days_ahead TYPE s4d430_customer_with_parameter-days_ahead,
       END OF ty_s_customer.

TYPES ty_t_customers TYPE STANDARD TABLE OF ty_s_customer
                         WITH NON-UNIQUE KEY id.

DATA gt_customers TYPE ty_t_customers.

* ALV Processing

DATA go_salv TYPE REF TO cl_salv_table.
DATA gx_excp TYPE REF TO cx_salv_error.

* Selection Screen

PARAMETERS pa_city TYPE s_city DEFAULT 'New York' LOWER CASE.

START-OF-SELECTION.

* Data Retrieval
*************************************************************

  SELECT
    FROM z02_association AS association
    FIELDS customid AS id,
           association~\_customer-name,
           association~\_customer-street,
           association~\_customer-postcode,
           association~\_customer-city,
           association~\_customer-country,
           SUM(  amount ) AS amount,
           currency,
           AVG( days_ahead ) AS days_ahead
     WHERE association~\_customer-city = @pa_city
       AND fldate < @sy-datum
      GROUP BY customid,
               association~\_customer-name,
               association~\_customer-street,
               association~\_customer-postcode,
               association~\_customer-city,
               association~\_customer-country,
               currency
  ORDER BY association~\_customer-city,association~\_customer-name
INTO TABLE @gt_customers.

* output
*************************************************************
  TRY.

      cl_salv_table=>factory(
        IMPORTING
          r_salv_table   = go_salv
        CHANGING
          t_table        = gt_customers
      ).

* Display
*-------------------------*

      go_salv->display( ).

    CATCH cx_salv_error INTO gx_excp.    "
      MESSAGE gx_excp TYPE 'I'.
  ENDTRY.
