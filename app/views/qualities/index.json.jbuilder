json.array!(@qualities) do |quality|
  json.extract! quality, :name
  json.url quality_url(quality, format: :json)
end
