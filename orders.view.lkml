view: orders {
  sql_table_name: public.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: date_example {
    type: date
    sql: ${TABLE}.created_at  ;;
    html: {{ rendered_value | date: "%B %e, %Y" }} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }

  measure: count_example_3 {
    group_label: "linked_value Liquid Variable Examples"
    label: "Count: Example of Drills Not Working"
    description: "This count has drill fields and drilling is not preserved because we are using the incorrect liquid variable."
    type: count
    drill_fields: [orders.id,orders.created_date,orders.created_quarter,orders.status,orders.user_id,order_items.total_profit]
    html: html: <p style="font-size: 15px">{{rendered_value}}</p> ;;
  }

  measure: count_example_4 {
    group_label: "linked_value Liquid Variable Examples"
    label: "Count: Example of Drills Working"
    description: "This count has drill fields and drilling is preserved because we are using the linked_value liquid variable."
    type: count
    drill_fields: [orders.id,orders.created_date,orders.created_quarter,orders.status,orders.user_id,order_items.total_profit]
    html: <p style="font-size: 15px">{{linked_value}}</p> ;;
  }

}
