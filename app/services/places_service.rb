class PlacesService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com')
  end

  def self.get_tourist_locations(lat, lon)
    response = conn.get("/v2/place-details?lat=#{lat}&lon=#{lon}&radius_20000.tourism") do |f|
      f.params['apiKey'] = ENV['PLACES_API_KEY']
      # f.params['lat'] = [lat]
      # f.params['lon'] = [lon]

    end
    JSON.parse(response.body, symbolize_name: true)
  end
end