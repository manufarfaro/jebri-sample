json.(@offices) do |office|
  json.id office.id
  json.fantasy_name office.fantasy_name
  json.office_type office.office_type
  json.is_sales office.is_sales
  json.is_technical_support office.is_technical_support
  json.notes office.notes
  json.url office.url
  json.street office.street
  json.number office.number
  json.appartment office.appartment
  json.floor office.floor
  json.city_id office.city_id
  json.commerce do
    json.id office.commerce.id
    json.name office.commerce.name
    json.url office.commerce.url
    json.avatar_url office.commerce.avatar.url
  end
  json.phones office.office_phones, :id, :phone_type, :number, :notes
end
