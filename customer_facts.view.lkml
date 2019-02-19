view: customer_facts {
  derived_table: {
    sql:
    SELECT
    user_id,
    MAX(created_at) AS most_recent_order
    FROM public.orders
    WHERE
     {% condition order_status_filter %} orders.status {% endcondition %}
    GROUP BY 1
    ;;
  }


  filter: order_status_filter {
    type: string
  }

  dimension: user_id {
    type: number
  }
  dimension: most_recent_order {
    type: date
  }
}
