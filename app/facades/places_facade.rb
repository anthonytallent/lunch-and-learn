class PlacesFacade
  def self.get_tourist_locations(lat, lon)
    PlacesService.get_tourist_locations(lat, lon)["features"].map do |data|
      Place.new(data)
    end
  end
end