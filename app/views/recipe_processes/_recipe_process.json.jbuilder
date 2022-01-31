json.extract! recipe_process, :id, :step, :recipe_id, :created_at, :updated_at
json.url recipe_process_url(recipe_process, format: :json)
