class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.load
  end

  def show
    @recipe = Recipe.find(params[:id])

    render_not_found if @recipe.blank?
  end

  private

    def render_not_found
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
end
