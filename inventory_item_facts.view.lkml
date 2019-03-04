# Define a basic NDT to get sale price and cost together.
 include: "liquid_html.model.lkml"

view: inventory_item_facts {
  derived_table: {
    explore_source: order_items {
      column: sale_price {}
      column: cost { field: inventory_items.cost }

    }
  }
  dimension: sale_price {
    type: number
  }
  dimension: cost {
    type: number
  }

  # Begin Liquid HTML Example from "Dynamic Field to Aggregate in Sum"

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }
    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }
  }

  measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "usd"
  }

    # End Liquid HTML Example from "Dynamic Field to Aggregate in Sum"

}
