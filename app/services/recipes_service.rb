class RecipesService
  def self.get_recipes_by_country(country)
    request = conn.get("/api/recipes/v2") do |f|
      f.params['q'] = country
    end
    JSON.parse(request.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['EDAMAM_APP_ID']
      f.params['type'] = 'public'
      f.params['app_key'] = ENV['EDAMAM_API_KEY']
    end
  end
end