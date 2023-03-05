require 'rails_helper'

RSpec.describe 'Country Facade' do
  it 'can return an array of all the countries names', :vcr do
    facade = CountriesFacade.names
    
    expect(facade).to be_a(Array)
    expect(facade.count).to eq(250)
    expect(facade.first).to be_a(String)
  end
end