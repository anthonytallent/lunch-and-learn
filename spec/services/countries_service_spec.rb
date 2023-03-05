require 'rails_helper'

RSpec.describe "Countries Service" do
  it 'can send a list of all the countries', :vcr do
    service = CountriesService.get_countries
    
    expect(service).to be_a(Array)
    expect(service.count).to eq(250)
  end
end