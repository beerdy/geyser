json.extract! message, :id, :name, :phone, :description, :created_at, :updated_at
json.url message_url(message, format: :json)
