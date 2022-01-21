require 'rails_helper'

RSpec.describe 'Foodsモデルのテスト', type: :model do
  let(:food) { create(:food) }

  describe 'バリデーションテスト' do
    it "食材名と賞味期限の入力があれば登録される" do
      expect(food).to be_valid
    end

    it "食材名の入力がなければ無効である" do
      food = build(:food, name: "")
      food.valid?
      expect(food.errors[:name]).to include("を入力してください")
    end

    it "賞味期限の入力がなければ無効である" do
      food = build(:food, expiry_date: "")
      food.valid?
      expect(food.errors[:expiry_date]).to include("を入力してください")
    end
  end
end
