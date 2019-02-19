connection: "thelook"
include: "*.dashboard.lookml"
# include all the views
include: "*.view"

datagroup: liquid_html_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: liquid_html_default_datagroup

explore: inventory_items {
  hidden: yes
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  hidden: yes
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: product_facts {
  hidden: yes
  join: products {
    type: left_outer
    sql_on: ${product_facts.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: customer_facts {
  hidden: yes
  join: orders {
    relationship: many_to_many
    sql_on: ${customer_facts.user_id}=${orders.user_id} ;;
  }
}

explore: products {
  hidden: yes
}

explore: users {
  hidden: yes
}
