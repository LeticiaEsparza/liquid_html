- dashboard: linking_example_a
  title: Linking Example A
  layout: newspaper
  elements:
  - title: Orders
    name: Orders
    model: liquid_html
    explore: order_items
    type: single_value
    fields:
    - orders.count
    sorts:
    - orders.count desc
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#00635D"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    listen:
      Brand: products.brand
    row: 0
    col: 8
    width: 8
    height: 2
  - title: Total Profit
    name: Total Profit
    model: liquid_html
    explore: order_items
    type: single_value
    fields:
    - order_items.total_profit
    sorts:
    - order_items.total_profit desc
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#07BEB8"
    show_single_value_title: true
    single_value_title: Total Profit
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    listen:
      Brand: products.brand
    row: 0
    col: 16
    width: 8
    height: 2
  - title: Brand
    name: Brand
    model: liquid_html
    explore: order_items
    type: single_value
    fields:
    - products.brand
    sorts:
    - products.brand
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#014545"
    show_single_value_title: true
    single_value_title: Brand
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    listen:
      Brand: products.brand
    row: 0
    col: 0
    width: 8
    height: 2
  - title: Quarter Performance
    name: Quarter Performance
    model: liquid_html
    explore: order_items
    type: looker_column
    fields:
    - order_items.total_profit
    - orders.count
    - orders.created_quarter
    fill_fields:
    - orders.created_quarter
    sorts:
    - orders.created_quarter
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
      order_items.total_profit: line
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: order_items.total_profit
        name: Order Items Total Profit
        axisId: order_items.total_profit
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label: ''
      orientation: right
      series:
      - id: orders.count
        name: Orders Count
        axisId: orders.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Brand: products.brand
    row: 2
    col: 0
    width: 14
    height: 9
  - title: Orders Per Category
    name: Orders Per Category A
    model: liquid_html
    explore: order_items
    type: looker_pie
    fields:
    - products.category
    - orders.count
    sorts:
    - orders.count desc
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Brand: products.brand
    row: 11
    col: 7
    width: 10
    height: 9
  - title: Orders Per Category
    name: Orders Per Category B
    model: liquid_html
    explore: order_items
    type: table
    fields:
    - products.category
    - orders.count
    filters: {}
    sorts:
    - orders.count desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: White to Green
        colors:
        - "#FFFFFF"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Brand: products.brand
    row: 2
    col: 14
    width: 10
    height: 9
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: liquid_html
    explore: order_items
    listens_to_filters: []
    field: products.brand
