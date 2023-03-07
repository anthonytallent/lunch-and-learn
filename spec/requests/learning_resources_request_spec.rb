require 'rails_helper'

RSpec.describe "Learning Resource Requests" do
  it "can return a learning resource with all of it's values", :vcr do
    get "/api/v1/learning_resources?country=laos"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_name: true)
    binding.pry
  end
end