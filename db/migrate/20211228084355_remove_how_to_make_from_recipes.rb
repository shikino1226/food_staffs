class RemoveHowToMakeFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :how_to_make, :string
  end
end
