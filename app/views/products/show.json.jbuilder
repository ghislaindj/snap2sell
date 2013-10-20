json.id @product.id.to_s
json.extract! @product, :title
json.picture do
  json.original @product.picture
  json.thumb    @product.picture :thumb
end
json.user_id @product.user_id.to_s
