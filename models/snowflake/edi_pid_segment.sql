{{ config(materialized='table')}}

with source as (
 select * from {{ ref('parsed_edi_data') }}
)

SELECT _FILE,
       _MODIFIED, 
       _LINE, 
       SEGMENT_TYPE,
       PARSED_COL_1 AS ITEM_DESCRIPTION_TYPE_CODE,
       PARSED_COL_2 AS PRODUCT_PROCESS_CHARACTERISTIC_CODE,
       PARSED_COL_3 AS AGENCY_QUALIFIER_CODE,
       PARSED_COL_4 AS PRODUCT_DESCRIPTION_CODE,
       PARSED_COL_5 AS PID_DESCRIPTION,
       PARSED_COL_6 AS PID_SURFACE_LAYER_POSITION_CODE,
       PARSED_COL_7 AS SOURCE_SUBQUALIFIER,
       PARSED_COL_8 AS YES_NO_CONDITION_OR_RESPONSE_CODE,
       PARSED_COL_9 AS LANGUAGE_CODE,
       PARSED_COL_10 AS PRODUCT_SERVICE_CONDITION_CODE FROM source WHERE SEGMENT_TYPE = 'PID'
