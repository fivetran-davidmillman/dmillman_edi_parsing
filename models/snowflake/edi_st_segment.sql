{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS TRANSACTION_SET_IDENTIFIER,
       PARSED_COL_2 AS ST_TRANSACTION_SET_CONTROL_NUMBER,
       PARSED_COL_3 AS IMPLEMENTATION_CONVENTION_REFERENCE FROM source WHERE SEGMENT_TYPE = 'ST'
