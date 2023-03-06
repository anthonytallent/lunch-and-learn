class CountriesFacade
  def self.names
    CountriesService.get_countries.flat_map do |country|
      country[:name][:common]
    end
  end

  def self.get_country_capital(country)
    CountriesService.get_country_capital_response(country).first["capital"]
    
  end
end