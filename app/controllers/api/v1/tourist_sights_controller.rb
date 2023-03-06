class Api::V1::TouristSightsController < ApplicationController
  def index
    capital = CountriesFacade.get_country_capital(params[:country])
    latlng = CountriesFacade.get_capital_latlng(capital.first)
    render json: PlaceSerializer.new(PlacesFacade.get_tourist_locations(latlng[0], latlng[1]))
  end
end