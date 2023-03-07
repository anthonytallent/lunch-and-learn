class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      new_favorite = Favorite.new(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title], user_id: user.id)
    end
    if new_favorite.save
      render json: { "success": "Favorite added successfully" }
    else
      render json: { error: { details: "Bad Request" } }, status: 400
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoriteSerializer.new(user.favorites)
    else
      render json: { error: "user not found" }, status: 400
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end