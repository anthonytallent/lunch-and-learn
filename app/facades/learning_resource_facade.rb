class LearningResourceFacade
  def self.get_learning_resource(country)
    youtube_data = YoutubeService.get_video_response(country)
    upsplash_data = UpsplashService.get_images(country)
    LearningResource.new(youtube_data, upsplash_data, country)
  end
end