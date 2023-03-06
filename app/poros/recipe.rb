class Recipe
  attr_reader :id, :type, :title, :image, :country, :url
  def initialize(data, country)
    @id = nil
    @type = 'recipe'
    @title = data[:label]
    @image = data[:image]
    @url = data[:uri]
    @country = country
  end
end