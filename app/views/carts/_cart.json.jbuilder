json.extract! cart, :id, :session, :product, :quantify, :active, :created_at, :updated_at
json.url cart_url(cart, format: :json)
