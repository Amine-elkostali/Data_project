{{ config(materialized='view') }}


select 

    cast(Year as string) as year,
    
   
    cast(Industry_aggregation_NZSIOC as string ) as Industry_level,
    {{Edges_of_revenue ('Industry_aggregation_NZSIOC') }} as industry_levelup,
    cast(Industry_code_NZSIOC as  string ) as Industry_code_NZSIOC,
    cast(Industry_name_NZSIOC as string ) as industy_categorie,
    cast(Units as string ) as Currency,
    cast(value as numeric ) as value,
    

from {{ source('staging','finance')}}


limit 100