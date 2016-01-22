json.array!(@timekeepings) do |timekeeping|
  json.extract! timekeeping, :id, :clock_in, :clock_out
  json.url timekeeping_url(timekeeping, format: :json)
end
