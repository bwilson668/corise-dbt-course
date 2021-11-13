{% macro generate_model_yaml(model_name) %}

{% set model_yaml=[] %}

{% do model_yaml.append('  - name: ' ~ model_name | lower) %}
{% do model_yaml.append('    description: "{{ doc(\'' + model_name | lower + '_' + model_name | lower + '\') }}"') %}
{% do model_yaml.append('    columns:') %}

{% set relation=ref(model_name) %}
{%- set columns = adapter.get_columns_in_relation(relation) -%}

{% for column in columns %}
    {% do model_yaml.append('      - name: ' ~ column.name | lower ) %}
    {% do model_yaml.append('        description: "{{ doc(\'' + model_name | lower + '_' + column.name | lower + '\') }}"') %}
    {% do model_yaml.append('') %}
{% endfor %}

{% if execute %}

    {% set joined = model_yaml | join ('\n') %}
    {{ log(joined, info=True) }}
    {% do return(joined) %}

{% endif %}

{% endmacro %}