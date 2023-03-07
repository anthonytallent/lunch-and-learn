class YoutubeService
  def self.conn
    Faraday.new(url: 'https://www.googleapis.com')
  end

  def self.get_video_response(country)
    response = conn.get('/youtube/v3/search') do |f|
      f.params['key'] = ENV['YOUTUBE_API_KEY']
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['q'] = country
      f.params['part'] = 'snippet'
      f.params['maxResults'] = '1'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end