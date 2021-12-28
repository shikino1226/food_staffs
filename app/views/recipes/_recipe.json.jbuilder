json.extract! recipe, :id, :name, :how_to_make, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
