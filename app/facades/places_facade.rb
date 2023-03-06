class PlacesFacade
  def self.get_tourist_locations(lat, lon)
    # binding.pry
    PlacesService.get_tourist_locations(lat, lon)["features"].map do |data|
      Place.new(data)
    end
  end
end