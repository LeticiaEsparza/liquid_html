- dashboard: linked_value_example
  title: Linked Value Example
  layout: newspaper
  elements:
  - title: Orders Per Category
    name: Orders Per Category
    model: liquid_html
    explore: order_items
    type: table
    fields:
    - products.category
    - orders.count_example_3
    sorts:
    - orders.count_example desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to White to Green
        colors:
        - "#F36254"
        - "#FFFFFF"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 5
    width: 14
    height: 12
