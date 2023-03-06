class PlacesService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com')
  end

  def self.get_tourist_locations(lat, lon)
    response = conn.get("/v2/places?categories=tourism.sights&filter=circle:#{lon},#{lat},20000") do |f|
      f.params['apiKey'] = ENV['PLACES_API_KEY']
    end
    JSON.parse(response.body, symbolize_name: true)
  end
end