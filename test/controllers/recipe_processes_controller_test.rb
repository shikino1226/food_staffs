require "test_helper"

class RecipeProcessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_process = recipe_processes(:one)
  end

  test "should get index" do
    get recipe_processes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_process_url
    assert_response :success
  end

  test "should create recipe_process" do
    assert_difference('RecipeProcess.count') do
      post recipe_processes_url, params: { recipe_process: { recipe_id: @recipe_process.recipe_id, step: @recipe_process.step } }
    end

    assert_redirected_to recipe_process_url(RecipeProcess.last)
  end

  test "should show recipe_process" do
    get recipe_process_url(@recipe_process)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_process_url(@recipe_process)
    assert_response :success
  end

  test "should update recipe_process" do
    patch recipe_process_url(@recipe_process), params: { recipe_process: { recipe_id: @recipe_process.recipe_id, step: @recipe_process.step } }
    assert_redirected_to recipe_process_url(@recipe_process)
  end

  test "should destroy recipe_process" do
    assert_difference('RecipeProcess.count', -1) do
      delete recipe_process_url(@recipe_process)
    end

    assert_redirected_to recipe_processes_url
  end
end
