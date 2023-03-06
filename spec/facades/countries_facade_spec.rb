require 'rails_helper'

RSpec.describe 'Country Facade' do
  it 'can return an array of all the countries names', :vcr do
    facade = CountriesFacade.names
    
    expect(facade).to be_a(Array)
    expect(facade.count).to eq(250)
    expect(facade.first).to be_a(String)
  end

  xit 'can return a countries capital', :vcr do
    capital = CountriesFacade.get_country_capital("Peru")
    # binding.pry
    expect(capital.first).to be("Lima")
  end

  it 'can return a capitals lat and long', :vcr do
    latlng = CountriesFacade.get_capital_latlng("lima")
    binding.pry
    expect(latlng).to be_a(Array)
  end
end