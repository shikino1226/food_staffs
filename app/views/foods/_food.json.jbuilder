json.extract! food, :id, :name, :expiry_date, :created_at, :updated_at
json.url food_url(food, format: :json)
