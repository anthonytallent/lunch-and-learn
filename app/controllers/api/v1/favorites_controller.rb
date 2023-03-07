class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    new_favorite = Favorite.new(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title], user_id: user.id)
    if new_favorite.save
      render json: { "success": "Favorite added successfully" }
    else
      render json: { error: { details: "Bad Request" } }, status: 400
    end
  end

  private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end