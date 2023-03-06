require "rails_helper"

RSpec.describe "Places request", :vcr do
  it "can return tourist spots within a 20000 meter radius of a capital city" do
    get "/api/v1/tourist_sights?country=France"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data][0]).to have_key(:id)
    expect(parsed_response[:data][0][:id]).to eq(nil)

    expect(parsed_response[:data][0]).to have_key(:type)
    expect(parsed_response[:data][0][:type]).to be_a(String)

    expect(parsed_response[:data][0]).to have_key(:attributes)
    expect(parsed_response[:data][0][:attributes]).to be_a(Hash)

    expect(parsed_response[:data][0][:attributes]).to have_key(:name)
    expect(parsed_response[:data][0][:attributes][:name]).to be_a(String)

    expect(parsed_response[:data][0][:attributes]).to have_key(:address)
    expect(parsed_response[:data][0][:attributes][:address]).to be_a(String)

    expect(parsed_response[:data][0][:attributes]).to have_key(:place_id)
    expect(parsed_response[:data][0][:attributes][:place_id]).to be_a(String)
  end
end