{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS NUMBER_OF_INCLUDED_SEGMENTS,
       PARSED_COL_2 AS SE_TRANSACTION_SET_CONTROL_NUMBER FROM source WHERE SEGMENT_TYPE = 'SE'
