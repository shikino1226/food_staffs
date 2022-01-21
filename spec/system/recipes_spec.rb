require 'rails_helper'

RSpec.describe "Recipes", type: :system do
  let(:user) { create(:user) }
  let(:user2) { create(:user, name: "jiro", email: "jiro@email.com", id: 2) }
  let!(:recipe) { create(:recipe, user_id: user.id) }
  let!(:recipe2) { create(:recipe, name: "人参ポタージュ", user_id: user.id) }
  let!(:recipe3) { create(:recipe, name: "オニオンポタージュ", user_id: user2.id) }
  let!(:recipe_food) { create(:recipe_food, recipe_id: recipe.id) }
  let!(:recipe_process) { create(:recipe_process, recipe_id: recipe.id) }

  describe "Get /recipes/index" do
    before do
      sign_in user
      visit recipes_path(user.id)
    end

    it "レシピ名が表示されること" do
      within('.recipe_item') do
        expect(page).to have_content "ポテトスープ"
      end
    end

    it "レシピ名をクリックするとレシピ詳細画面へ移動すること" do
      click_on 'ポテトスープ'
      expect(page).to have_current_path recipe_path(recipe.id)
    end

    it "レシピが複数あっても表示されること" do
      expect(page).to have_selector ".recipe_item", text: "ポテトスープ"
      expect(page).to have_selector ".recipe_item", text: "人参ポタージュ"
    end

    it "他のユーザーのレシピも表示されること" do
      expect(page).to have_selector ".recipe_item", text: "オニオンポタージュ"
    end

    it "「新しいレシピを登録する」をクリックするとレシピ作成画面へ移動すること" do
      click_on '新しいレシピを登録する'
      expect(page).to have_current_path new_recipe_path
    end
  end

  describe "Get /recipes/:id" do
    before do
      sign_in user
      visit recipe_path(recipe.id)
    end

    it "レシピ名が表示されること" do
      within('.recipe_title') do
        expect(page).to have_content "ポテトスープ"
      end
    end

    it "自分で作成したレシピの場合レシピ名をクリックするとレシピ編集画面へ移動すること" do
      click_on 'ポテトスープ'
      expect(page).to have_current_path edit_recipe_path(recipe.id)
    end

    it "レシピを作成したユーザー名が表示されること" do
      within('.recipe_user_name') do
        expect(page).to have_content "taro"
      end
    end

    it "関連する食材、量が表示されること" do
      within('.design04') do
        expect(page).to have_content "じゃがいも"
        expect(page).to have_content "1個"
      end
    end

    it "食材と量を追加すると食材リストに登録されること" do
      fill_in 'recipe_food[contents]', with: '牛乳'
      fill_in 'recipe_food[quantity]', with: '200cc'
      find("#add_content").click
      within('.design04') do
        expect(page).to have_content "牛乳"
        expect(page).to have_content "200cc"
      end
    end

    it "関連する作り方が表示されること" do
      within('.design05') do
        expect(page).to have_content "じゃがいもは洗ったら皮のままレンジで６００wで３分チン"
      end
    end

    it "作り方を追加すると作り方リストに登録されること" do
      fill_in 'recipe_process[step]', with: '玉ねぎをスライスして飴色になるまで炒める'
      find("#add_step").click
      within('.design05') do
        expect(page).to have_content "玉ねぎをスライスして飴色になるまで炒める"
      end
    end
  end

  describe "他のユーザーのレシピ詳細画面" do
    before do
      sign_in user
      visit recipe_path(recipe3.id)
    end

    it "他のユーザーのレシピ詳細画面では食材の追加や作り方の登録ができないこと" do
      within('.recipe_field') do
        expect(page).not_to have_content "食材を追加"
        expect(page).not_to have_content "作り方を登録する"
      end
    end
  end

  describe "レシピの検索" do
    before do
      sign_in user
      visit home_index_path
    end

    it "食材を入力すると関連するレシピが検索できる" do
      fill_in 'q[name_or_recipe_foods_contents_cont]', with: 'じゃがいも'
      click_on '検索'
      expect(page).to have_current_path search_recipes_path, ignore_query: true
    end
  end
end
