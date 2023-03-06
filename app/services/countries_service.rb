class CountriesService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_countries
    response = conn.get('/v3.1/all')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_country_capital_response(country)
    response = conn.get("/v3.1/name/#{country}")
    JSON.parse(response.body, symbolize_name: true)
  end
end