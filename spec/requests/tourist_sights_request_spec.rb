require "rails_helper"

RSpec.describe "tourist sights requests" do
  it 'can list tourist sights within 20000 meters of a capital city', :vcr do
    get '/api/v1/tourist_sights?country=France'
binding.pry
    parsed_response = JSON.parse(response.body, symbolize_names: true)
binding.pry
    expect(parsed_response).to be_a(Hash)
  end
end