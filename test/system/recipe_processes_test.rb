require "application_system_test_case"

class RecipeProcessesTest < ApplicationSystemTestCase
  setup do
    @recipe_process = recipe_processes(:one)
  end

  test "visiting the index" do
    visit recipe_processes_url
    assert_selector "h1", text: "Recipe Processes"
  end

  test "creating a Recipe process" do
    visit recipe_processes_url
    click_on "New Recipe Process"

    fill_in "Recipe", with: @recipe_process.recipe_id
    fill_in "Step", with: @recipe_process.step
    click_on "Create Recipe process"

    assert_text "Recipe process was successfully created"
    click_on "Back"
  end

  test "updating a Recipe process" do
    visit recipe_processes_url
    click_on "Edit", match: :first

    fill_in "Recipe", with: @recipe_process.recipe_id
    fill_in "Step", with: @recipe_process.step
    click_on "Update Recipe process"

    assert_text "Recipe process was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe process" do
    visit recipe_processes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe process was successfully destroyed"
  end
end
