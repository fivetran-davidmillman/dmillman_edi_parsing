{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS DATE_TIME_QUALIFIER,
       PARSED_COL_2 AS DTM_DATE,
       PARSED_COL_3 AS DTM_TIME,
       PARSED_COL_4 AS TIME_CODE,
       PARSED_COL_5 AS DATE_TIME_PERIOD_FORMAT_QUALIFIER,
       PARSED_COL_6 AS DATE_TIME_PERIOD FROM source WHERE SEGMENT_TYPE = 'DTM'
