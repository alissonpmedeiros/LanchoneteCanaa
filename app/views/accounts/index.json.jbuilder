json.array!(@accounts) do |account|
  json.extract! account, :id, :price, :salesman, :description, :status, :customer_id
  json.url account_url(account, format: :json)
end
