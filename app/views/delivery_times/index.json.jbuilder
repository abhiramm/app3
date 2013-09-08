json.array!(@delivery_times) do |delivery_time|
  json.extract! delivery_time, :duration
  json.url delivery_time_url(delivery_time, format: :json)
end
