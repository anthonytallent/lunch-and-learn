require 'rails_helper'

RSpec.describe "favorites requests" do
  it 'can create a favorite for a user' do
    user = User.create!(name: "Tony Pepperoni", email: "pepperoni@gmail.com", api_key: "iamauserjustlookatme")
    
    favorite_params = {
                        api_key: "iamauserjustlookatme",
                        country: "thailand",
                        recipe_link: "https://www.tastingtable.com/.....",
                        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                      }

    headers = { 'CONTENT_TYPE' => 'application/json' } 

    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:success)
    expect(parsed_response[:success]).to be_a(String)
  end

  it 'can retrieve all of a users favorites based on a users api_key' do
    user = User.create!(name: "Tony Pepperoni", email: "pepperoni@gmail.com", api_key: "iamauserjustlookatme")

    favorite = Favorite.create!(country: "thailand", recipe_link: "link", recipe_title: "title", user_id: user.id)

    get '/api/v1/favorites?api_key=iamauserjustlookatme'

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)

    expect(parsed_response[:data][0]).to have_key(:id)

    expect(parsed_response[:data][0]).to have_key(:type)
    expect(parsed_response[:data][0][:type]).to be_a(String)

    expect(parsed_response[:data][0]).to have_key(:attributes)
    expect(parsed_response[:data][0][:attributes]).to be_a(Hash)
  end
end