class UpsplashService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com')
  end

  def self.get_images(country)
    response = conn.get('/search/photos') do |f|
      f.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
      f.params['query'] = country
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end