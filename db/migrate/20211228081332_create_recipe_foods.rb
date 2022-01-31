class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.string :contents
      t.integer :recipe_id
      t.integer :process_id

      t.timestamps
    end
  end
end
