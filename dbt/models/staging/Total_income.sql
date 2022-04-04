{{ config(materialized='table') }}
 -- i want to see only the incomes in order to use a datavisualisation tool
Select 
    Year,
    cast(Industry_aggregation_NZSIOC as string ) as Industry_level,
    {{Edges_of_revenue ('Industry_aggregation_NZSIOC') }} as industry_level_categorie,
    cast(Industry_name_NZSIOC as string ) as industy_categorie,
    cast(Units as string ) as Currency,
    Variable_name,
    Variable_category,
    --Value,
    safe_cast(value as int ) as value_of_transaction,
from {{ source('staging','finance')}}

where Variable_name = 'Total income'