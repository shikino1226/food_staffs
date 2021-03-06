class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Recipe.ransack(params[:q])
    @search_recipes = @search.result.distinct
    @search_recipes = Kaminari.paginate_array(@search_recipes).page(params[:page]).per(10)
    @search_recipes_count = @search.result(distinct: true).count
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end
