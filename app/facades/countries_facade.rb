class CountriesFacade
  def self.names
    CountriesService.get_countries.flat_map do |country|
      country[:name][:common]
    end
  end
end