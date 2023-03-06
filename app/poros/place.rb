class Place
  attr_reader :id, :type, :name, :address, :place_id

  def initialize(data)
    @id = nil
    @type = "tourist-sight"
    @name = data['properties']['name']
    @address = data['properties']['formatted']
    @place_id = data['properties']['place_id']
  end
end