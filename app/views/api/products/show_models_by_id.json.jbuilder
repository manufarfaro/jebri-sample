json.(@models) do |model|
  json.id model.id
  json.product_id model.product.id
  json.name model.name
  json.power model.power
  json.max_useful_power model.max_useful_power
  json.security_brake model.security_brake
  json.engine_type model.engine_type
  json.chassis model.chassis
  json.case_width model.case_width
  json.cutting_height model.cutting_height
  json.wheels model.wheels
  json.collector_capacity model.collector_capacity
  json.cutting_surface model.cutting_height
  json.engine_mounted_on model.engine_mounted_on
  json.weight model.weight
  json.reel_type model.reel_type
  json.use model.use
  json.reel_diameter model.reel_diameter
  json.packaging model.packaging
  json.documentation_url model.documentation.url
  json.specification_url model.specification.url
end