class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.load
  end
end
