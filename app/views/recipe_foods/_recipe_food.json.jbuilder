json.extract! recipe_food, :id, :contents, :recipe_id, :process_id, :created_at, :updated_at
json.url recipe_food_url(recipe_food, format: :json)
