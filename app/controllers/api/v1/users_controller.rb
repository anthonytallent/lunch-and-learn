class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    new_user.create_api_key
    if new_user.save
      render json: UserSerializer.new(new_user)
    else
      render json: { error: { details: "Bad Request" } }, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email, :api_key)
  end
end