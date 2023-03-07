require 'rails_helper'

RSpec.describe "Users requests" do
  it "can create a user based on a request" do

    user_params = {
                    name: "Athena Dao",
                    email: "athenadao@bestgirlever.com"
                  }

    headers = { 'CONTENT_TYPE' => 'application/json' }       

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Hash)

    expect(parsed_response[:data]).to have_key(:id)
    expect(parsed_response[:data][:id]).to be_a(String)

    expect(parsed_response[:data]).to have_key(:type)
    expect(parsed_response[:data][:type]).to be_a(String)

    expect(parsed_response[:data]).to have_key(:attributes)
    expect(parsed_response[:data][:attributes]).to be_a(Hash)

    expect(parsed_response[:data][:attributes]).to have_key(:name)
    expect(parsed_response[:data][:attributes][:name]).to be_a(String)

    expect(parsed_response[:data][:attributes]).to have_key(:email)
    expect(parsed_response[:data][:attributes][:email]).to be_a(String)

    expect(parsed_response[:data][:attributes]).to have_key(:api_key)
    expect(parsed_response[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'will not create a user without all fields' do
    user_params = {
                    name: "Athena Dao",
                    
                  }

    headers = { 'CONTENT_TYPE' => 'application/json' }       

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
    
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  it 'will not create a user who with a duplicate email' do
    user_params = {
                    name: "Athena Dao",
                    email: "athenadao@bestgirlever.com"
                  }

    headers = { 'CONTENT_TYPE' => 'application/json' }       

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
  end
end