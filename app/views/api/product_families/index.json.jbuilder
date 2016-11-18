json.(@product_families) do |family|
  json.id family.id
  json.name family.name
  json.avatar_url family.avatar.url(:medium)
end
