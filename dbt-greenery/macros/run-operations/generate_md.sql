{% macro generate_model_md(model_name) %}

{% set model_md=[] %}

{% do model_md.append('{% docs ' + model_name | lower + '_' + model_name | lower + ' %}') %}
{% do model_md.append('') %}
{% do model_md.append('{% enddocs %}')%}
{% do model_md.append('') %}

{% set relation=ref(model_name) %}
{%- set columns = adapter.get_columns_in_relation(relation) -%}

{% for column in columns %}
    {% do model_md.append('{% docs ' + model_name | lower + '_' + column.name | lower + ' %}') %}
    {% do model_md.append('') %}
    {% do model_md.append('{% enddocs %}')%}
    {% do model_md.append('') %}
{% endfor %}

{% if execute %}

    {% set joined = model_md | join ('\n') %}
    {{ log(joined, info=True) }}
    {% do return(joined) %}

{% endif %}

{% endmacro %}