require 'rails_helper'

RSpec.describe "recipes requests" do
  it 'can return the recipes in a serialized form', :vcr do
    get "/api/v1/recipes?country=thailand"
   
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)
  end

  # it 'can return recipes for the path if no country is input', :vcr do
  #   get api_v1_recipes_path
  # end
end