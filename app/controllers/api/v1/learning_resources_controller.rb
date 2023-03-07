class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.new(LearningResourceFacade.get_learning_resource(params[:country]))
  end
end