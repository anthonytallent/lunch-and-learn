require 'rails_helper'

RSpec.describe "recipes requests" do
  it 'can return the recipes in a serialized form', :vcr do
    get "/api/v1/recipes?country=thailand"
   
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)
    recipe = parsed_response[:data][0]
    expect(recipe).to have_key(:id)

    expect(recipe).to have_key(:type)
    expect(recipe[:type]).to be_a(String)

    expect(recipe).to have_key(:attributes)
    expect(recipe[:attributes]).to be_a(Hash)

    expect(recipe[:attributes]).to have_key(:title)
    expect(recipe[:attributes][:title]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:url)
    expect(recipe[:attributes][:url]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:country)
    expect(recipe[:attributes][:country]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:image)
    expect(recipe[:attributes][:image]).to be_a(String)
  end

  it 'will return a hash with an empty data if country is empty', :vcr do
    get '/api/v1/recipes?country='

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response[:data]).to eq([])
  end

  # it 'can return a random country if no country is given', :vcr do
  #   get "/api/v1/recipes"
   
  #   parsed_response = JSON.parse(response.body, symbolize_names: true)

  #   expect(parsed_response).to be_a(Hash)
  #   expect(parsed_response).to have_key(:data)
  #   expect(parsed_response[:data]).to be_a(Array)
  #   recipe = parsed_response[:data][0]
  #   expect(recipe).to have_key(:id)

  #   expect(recipe).to have_key(:type)
  #   expect(recipe[:type]).to be_a(String)

  #   expect(recipe).to have_key(:attributes)
  #   expect(recipe[:attributes]).to be_a(Hash)

  #   expect(recipe[:attributes]).to have_key(:title)
  #   expect(recipe[:attributes][:title]).to be_a(String)

  #   expect(recipe[:attributes]).to have_key(:url)
  #   expect(recipe[:attributes][:url]).to be_a(String)

  #   expect(recipe[:attributes]).to have_key(:country)
  #   expect(recipe[:attributes][:country]).to be_a(String)

  #   expect(recipe[:attributes]).to have_key(:image)
  #   expect(recipe[:attributes][:image]).to be_a(String)
  # end
end