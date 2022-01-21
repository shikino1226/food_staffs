require 'rails_helper'

RSpec.describe "Foods", type: :system do
  let(:user) { create(:user) }
  let!(:food) { create(:food, user_id: user.id) }
  let!(:food2) { create(:food, name: "マヨネーズ", expiry_date:"2022-11-12", user_id: user.id) }

  describe "Get /foods/index" do
    before do
      sign_in user
      visit foods_path(user.id)
    end

    it "食材名と賞味期限が表示されること" do
      within('.food_items') do
        expect(page).to have_content "牛乳"
        expect(page).to have_content "2022-12-12"
      end
    end

    it "食材名をクリックすると食材詳細画面へ移動すること" do
      click_on '牛乳'
      expect(page).to have_current_path food_path(food.id)
    end

    it "食材が複数あっても表示されること" do
      expect(page).to have_selector ".food_items", text: "牛乳"
      expect(page).to have_selector ".food_items", text: "マヨネーズ"
    end
  end

  describe "Get /foods/:id" do
    before do
      sign_in user
      visit food_path(food.id)
    end

    it "食材名と賞味期限が表示されること" do
      expect(page).to have_selector ".item5", text: "牛乳"
      expect(page).to have_selector ".item5", text: "2022-12-12"
    end

    it "「この食材を使ったレシピを検索する」をクリックすると検索結果画面に移動すること" do
      fill_in 'q[name_or_recipe_foods_contents_cont]', with: '牛乳'
      click_on 'この食材を使ったレシピを検索する'
      expect(page).to have_current_path search_recipes_path, ignore_query: true
    end
  end
end
