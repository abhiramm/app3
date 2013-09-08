json.array!(@durations) do |duration|
  json.extract! duration, :time, :price
  json.url duration_url(duration, format: :json)
end
