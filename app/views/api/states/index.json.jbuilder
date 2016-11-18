json.(@states) do |state|
  json.id state.id
  json.country_alpha2 state.country_alpha2
  json.country ISO3166::Country.new(state.country_alpha2).name
  json.name state.name
end
