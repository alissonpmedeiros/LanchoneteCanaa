json.array!(@profits) do |profit|
  json.extract! profit, :id, :option, :date
  json.url profit_url(profit, format: :json)
end
