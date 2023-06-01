{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS IEA_NUMBER_OF_INCLUDED_FUNCTIONAL_GROUPS,
       PARSED_COL_2 AS IEA_INTERCHANGE_CONTROL_NUMBER FROM source WHERE SEGMENT_TYPE = 'IEA'
