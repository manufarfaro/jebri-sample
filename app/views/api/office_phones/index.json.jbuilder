json.(@office_phones) do |phone|
  json.id phone.id
  json.phone_type phone.phone_type
  json.number phone.number
  json.notes phone.notes
end
