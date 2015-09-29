json.array!(@cash_payments) do |cash_payment|
  json.extract! cash_payment, :id, :salesman, :price, :description
  json.url cash_payment_url(cash_payment, format: :json)
end
