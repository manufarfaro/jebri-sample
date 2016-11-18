json.(@products) do |product|
  json.id product.id
  json.name product.name
  json.description product.description
  json.family product.product_family
  json.avatar_url product.avatar.url(:medium)
  json.documentation_url product.documentation.url
  json.specification_url product.specification.url
end
