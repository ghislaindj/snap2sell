json.array!(@products) do |product|
  json.extract! product, :title
  json.url product_url(product, format: :json)
end
