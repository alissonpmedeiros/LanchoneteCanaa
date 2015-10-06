json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :price, :description
  json.url purchase_url(purchase, format: :json)
end
