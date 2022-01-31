class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :how_to_make
      t.integer :user_id

      t.timestamps
    end
  end
end
