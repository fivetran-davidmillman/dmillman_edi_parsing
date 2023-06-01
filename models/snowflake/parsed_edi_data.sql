{{ config(materialized='table')}}

with source as (
 select * from {{ source('snowflake', 'ediraw') }}
)

SELECT _FILE, _MODIFIED, _LINE, REPLACE(get(SPLIT(COLUMN_0, '*'),0),'"') AS SEGMENT_TYPE,  
   REPLACE(get(SPLIT(COLUMN_0, '*'),1),'"') AS PARSED_COL_1, 
   REPLACE(get(SPLIT(COLUMN_0, '*'),2),'"') AS PARSED_COL_2,
   REPLACE(get(SPLIT(COLUMN_0, '*'),3),'"') AS PARSED_COL_3,
   REPLACE(get(SPLIT(COLUMN_0, '*'),4),'"') AS PARSED_COL_4,
   REPLACE(get(SPLIT(COLUMN_0, '*'),5),'"') AS PARSED_COL_5,
   REPLACE(get(SPLIT(COLUMN_0, '*'),6),'"') AS PARSED_COL_6,
   REPLACE(get(SPLIT(COLUMN_0, '*'),7),'"') AS PARSED_COL_7,
   REPLACE(get(SPLIT(COLUMN_0, '*'),8),'"') AS PARSED_COL_8,
   REPLACE(get(SPLIT(COLUMN_0, '*'),9),'"') AS PARSED_COL_9,
   REPLACE(get(SPLIT(COLUMN_0, '*'),10),'"') AS PARSED_COL_10,
   REPLACE(get(SPLIT(COLUMN_0, '*'),11),'"') AS PARSED_COL_11,
   REPLACE(get(SPLIT(COLUMN_0, '*'),12),'"') AS PARSED_COL_12,
   REPLACE(get(SPLIT(COLUMN_0, '*'),13),'"') AS PARSED_COL_13,
   REPLACE(get(SPLIT(COLUMN_0, '*'),14),'"') AS PARSED_COL_14,
   REPLACE(get(SPLIT(COLUMN_0, '*'),15),'"') AS PARSED_COL_15,
   REPLACE(get(SPLIT(COLUMN_0, '*'),16),'"') AS PARSED_COL_16,
   REPLACE(get(SPLIT(COLUMN_0, '*'),17),'"') AS PARSED_COL_17,
   REPLACE(get(SPLIT(COLUMN_0, '*'),18),'"') AS PARSED_COL_18,
   REPLACE(get(SPLIT(COLUMN_0, '*'),19),'"') AS PARSED_COL_19,
   REPLACE(get(SPLIT(COLUMN_0, '*'),20),'"')  AS PARSED_COL_20 FROM source
