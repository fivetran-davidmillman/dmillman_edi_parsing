{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS REFERENCE_IDENTIFICATION_QUALIFIER,
       PARSED_COL_2 AS REFERENCE_IDENTIFICATION,
       PARSED_COL_3 AS REF_DESCRIPTION FROM source WHERE SEGMENT_TYPE = 'REF'