class CountriesService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_countries
    response = conn.get('/v3.1/all')
    JSON.parse(response.body, symbolize_names: true)
  end
end