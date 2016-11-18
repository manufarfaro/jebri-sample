json.(@commerces) do |commerce|
  json.id commerce.id
  json.name commerce.name
  json.url commerce.url
  json.avatar_url commerce.avatar.url(:medium)
end
