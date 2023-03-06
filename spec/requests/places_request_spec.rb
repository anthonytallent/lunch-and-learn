require "rails_helper"

RSpec.describe "Places request", :vcr do
  it "can return tourist spots within a 20000 meter radius of a capital city" do
    get "/api/v1/tourist_sights?country=France"

    parsed_response = JSON.parse(response.body, symbolize_names: true)
binding.pry
    expect(parsed_response).to be_a(Hash)
  end
end