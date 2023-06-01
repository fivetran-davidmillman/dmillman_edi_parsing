{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS ASSIGNED_IDENTIFICATION,
       PARSED_COL_2 AS QUANTITY,
       PARSED_COL_3 AS UNIT_OR_BASIS_FOR_MEASUREMENT_CODE,
       PARSED_COL_4 AS UNIT_PRICE,
       PARSED_COL_5 AS BASIS_OF_UNIT_PRICE_CODE,
       PARSED_COL_6 AS PRODUCT_SERVICE_ID_QUALIFIER,
       PARSED_COL_7 AS PRODUCT_SERVICE_ID,
       PARSED_COL_8 AS PRODUCT_SERVICE_ID_QUALIFIER_2,
       PARSED_COL_9 AS PRODUCT_SERVICE_ID_2 FROM source WHERE SEGMENT_TYPE = 'PO1'