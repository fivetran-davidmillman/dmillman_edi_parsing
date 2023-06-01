{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS N3_01_ADDRESS_INFORMATION,
       PARSED_COL_2 AS N3_02_ADDRESS_INFORMATION FROM source WHERE SEGMENT_TYPE = 'N3'
