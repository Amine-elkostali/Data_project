

{% macro Edges_of_revenue(Industry_aggregation_NZSIOC) -%}

    case {{Industry_aggregation_NZSIOC}}
        when 'Level 1' then 'high'
        when 'Level 2' then 'mid'
        when 'Level 3' then 'low'
        else 'unknown'
    end

{%- endmacro %}
