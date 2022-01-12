class Food < ApplicationRecord
  belongs_to :user
  validates :expiry_date,:name,
  presence: true
end
