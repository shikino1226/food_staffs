class ChangeDatatypeExpiryDateOfFoods < ActiveRecord::Migration[6.1]
  def change
    change_column :foods, :expiry_date, :date
  end
end
