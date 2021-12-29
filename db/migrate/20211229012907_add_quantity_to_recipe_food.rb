class AddQuantityToRecipeFood < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_foods, :quantity, :string
  end
end
