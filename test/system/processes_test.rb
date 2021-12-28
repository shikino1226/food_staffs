require "application_system_test_case"

class ProcessesTest < ApplicationSystemTestCase
  setup do
    @process = processes(:one)
  end

  test "visiting the index" do
    visit processes_url
    assert_selector "h1", text: "Processes"
  end

  test "creating a Process" do
    visit processes_url
    click_on "New Process"

    fill_in "Recipe", with: @process.recipe_id
    fill_in "Step", with: @process.step
    click_on "Create Process"

    assert_text "Process was successfully created"
    click_on "Back"
  end

  test "updating a Process" do
    visit processes_url
    click_on "Edit", match: :first

    fill_in "Recipe", with: @process.recipe_id
    fill_in "Step", with: @process.step
    click_on "Update Process"

    assert_text "Process was successfully updated"
    click_on "Back"
  end

  test "destroying a Process" do
    visit processes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Process was successfully destroyed"
  end
end
