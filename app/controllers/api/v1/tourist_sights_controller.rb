class Api::V1::TouristSightsController < ApplicationController
  def index
    capital = CountriesFacade.get_country_capital(params[:country])
    latlng = CountriesFacade.get_capital_latlng(capital.first)
  end
end