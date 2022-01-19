require 'rails_helper'

RSpec.describe 'Recipesモデルのテスト', type: :model do
  let(:recipe) { create(:recipe) }
  describe 'バリデーションテスト' do
    it "レシピ名の入力があれば登録される" do
      expect(recipe).to be_valid
    end
    it "レシピ名の入力がなければ無効である" do
      recipe = build(:recipe, name: "")
      recipe.valid?
      expect(recipe.errors[:name]).to include("を入力してください")
    end
  end
end
