view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price};;
  }

  measure: total_profit_example {
    group_label: "Formatting Examples"
    type: number
    sql: ${total_revenue}-${inventory_items.total_cost} ;;
    value_format_name: usd
    html: <font color="green">{{rendered_value}}</font> ;;
  }

  measure: total_revenue_example {
    group_label: "Formatting Examples"
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
    html: {{ rendered_value | replace: '.', 'µ' | replace: ',',' ' | replace: 'µ', ','}} ;;
  }

  measure: total_profit {
    hidden: yes
    type: number
    sql: ${total_revenue}-${inventory_items.total_cost} ;;
    value_format_name: usd
  }

  measure: count_test_1 {
    group_label: "Link Liquid Parameter Examples"
    label: "Count with Filtered Drill Modal"
    description: "When we drill into this measure, the results in the drill modal will only show records where Total Profit >= 50000"
    type: count
    drill_fields: [products.category, order_items.total_profit]
    link: {
      label: "Filtered Drill Modal"
      url: "{{ link }}&f[order_items.total_profit]=>=50000"
    }
  }

  measure: count_test_2 {
    group_label: "Link Liquid Parameter Examples"
    label: "Count with Filtered Linked Explore"
    description: "When we drill into this measure, we will be sent to an explore that will show records where Total Profit >= 50000"
    type: count
    drill_fields: [products.category, order_items.total_profit]
    html: <a href="{{ link }}&f[order_items.total_profit]=>=50000">{{ rendered_value }}</a> ;;
  }
}
