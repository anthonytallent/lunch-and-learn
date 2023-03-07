class LearningResource
  attr_reader :country, :video, :images

  def initialize(youtube_data, upsplash_data, country)
    @id = nil
    @country = country
    @video = get_video_info(youtube_data)
    @images = get_image_info(upsplash_data)
  end

  def get_image_info(upsplash_data)
    all_image_info = []
    unless upsplash_data[:results] == []
      upsplash_data[:results].each do |image_info|
      hash =  { "alt_tag": image_info[:alt_description],
          "url": image_info[:urls][:full]
        }
        all_image_info << hash
      end
    end
    all_image_info
  end

  def get_video_info(youtube_data)
    video_info = {}
    unless youtube_data[:items] == []
      video_info = { "title": youtube_data[:items][0][:snippet][:title],
                     "youtube_video_id": youtube_data[:items][0][:id][:videoId]
                   }
    end
    video_info
  end
end