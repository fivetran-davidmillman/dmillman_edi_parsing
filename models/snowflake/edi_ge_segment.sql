{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS NUMBER_OF_TRANSACTION_SETS_INCLUDED,
       PARSED_COL_2 AS GE_GROUP_CONTROL_NUMBER FROM source WHERE SEGMENT_TYPE = 'GE'
