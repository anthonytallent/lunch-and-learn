class LearningResource
  attr_reader :country, :video, :images

  def initialize(youtube_data, upsplash_data, country)
    # binding.pry
    @id = nil
    @country = country
    @video = { "title": youtube_data[:items][0][:snippet][:title],
               "youtube_video_id": youtube_data[:items][0][:id][:videoId]
              }
    @images = get_image_info(upsplash_data)
  end

  def get_image_info(upsplash_data)
    all_image_info = []
    upsplash_data[:results].each do |image_info|
     hash =  { "alt_tag": image_info[:alt_description],
        "url": image_info[:urls][:full]
      }
      all_image_info << hash
    end
    all_image_info
  end
end