json.extract! content, :id, :title, :description, :slave, :url, :link, :sort, :created_at, :updated_at
json.url content_url(content, format: :json)
