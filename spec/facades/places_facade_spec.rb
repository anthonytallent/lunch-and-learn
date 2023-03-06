require 'rails_helper'

RSpec.describe 'Places Facade' do
  it 'will return all the the places near a capital', :vcr do
    facade = PlacesFacade.get_tourist_locations(46.0, 2.0)

    expect(facade).to be_a(Array)
    expect(facade.first).to be_a(Place)
  end
end