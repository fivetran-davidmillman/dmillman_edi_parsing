{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS TXN_SET_PURPOSE,
       PARSED_COL_2 AS PO_TYPE_CODE,
       PARSED_COL_3 AS PO_NUMBER,
       PARSED_COL_4 AS RELEASE_NUMBER,
       PARSED_COL_5 AS BEG_DATE,
       PARSED_COL_6 AS CONTRACT_NUMBER,
       PARSED_COL_7 AS ACK_TYPE_CODE,
       PARSED_COL_8 AS INVOICE_TYPE_CODE,
       PARSED_COL_9 AS CONTRACT_TYPE_CODE,
       PARSED_COL_10 AS PURCHASE_CATEGORY_CODE,
       PARSED_COL_11 AS SECURITY_LEVEL_CODE,
       PARSED_COL_12 AS TXN_TYPE_CODE FROM source WHERE SEGMENT_TYPE = 'BEG'
