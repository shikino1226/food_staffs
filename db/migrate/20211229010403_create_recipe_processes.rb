class CreateRecipeProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_processes do |t|
      t.string :step
      t.integer :recipe_id

      t.timestamps
    end
  end
end
