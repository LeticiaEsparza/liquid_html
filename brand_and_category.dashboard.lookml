- dashboard: brand_and_category
  title: Brand & Category
  layout: newspaper
  elements:
  - title: Granular Look into Quarter
    name: Granular Look into Quarter
    model: liquid_html
    explore: order_items
    type: looker_area
    fields:
    - orders.created_quarter
    - orders.created_date
    - order_items.total_profit
    - order_items.total_revenue
    sorts:
    - orders.created_date desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types: {}
    limit_displayed_rows: false
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
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - orders.created_quarter
    listen:
      Brand: products.brand
      Quarter: orders.created_quarter
      Category: products.category
    row: 2
    col: 1
    width: 22
    height: 9
  - title: Category
    name: Category
    model: liquid_html
    explore: order_items
    type: single_value
    fields:
    - products.category
    sorts:
    - products.category
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
    listen:
      Brand: products.brand
      Quarter: orders.created_quarter
      Category: products.category
    row: 0
    col: 12
    width: 11
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
      Quarter: orders.created_quarter
      Category: products.category
    row: 0
    col: 1
    width: 11
    height: 2
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: liquid_html
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Quarter
    title: Quarter
    type: field_filter
    default_value: 1 quarters ago for 1 quarters
    allow_multiple_values: true
    required: false
    model: liquid_html
    explore: order_items
    listens_to_filters: []
    field: orders.created_quarter
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: liquid_html
    explore: order_items
    listens_to_filters: []
    field: products.category