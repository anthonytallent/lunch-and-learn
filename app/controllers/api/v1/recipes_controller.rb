class Api::V1::RecipesController < ApplicationController
  def index 
    # binding.pry
    if params[:country] == ''
      render json: { data: [] }
    elsif params[:country]
      render json: RecipeSerializer.new(RecipesFacade.get_recipes_for_country(params[:country]))
    else
      random_name = CountriesFacade.names.sample
      render json: RecipeSerializer.new(RecipesFacade.get_recipes_for_country(random_name))
    end
  end
end