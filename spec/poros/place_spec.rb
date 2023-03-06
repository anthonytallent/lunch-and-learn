require 'rails_helper'

RSpec.describe Place do
  it 'exists and has attributes', :vcr do
    places = PlacesFacade.get_tourist_locations(46.0, 2.0)
    place = places.first

    expect(place.id).to eq(nil)
    expect(place.type).to be_a(String)
    expect(place.name).to be_a(String)
    expect(place.address).to be_a(String)
    expect(place.place_id).to be_a(String)
  end
end