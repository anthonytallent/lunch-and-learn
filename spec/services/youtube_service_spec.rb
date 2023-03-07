require 'rails_helper'

RSpec.describe "youtube service" do
  it 'will return no results if country is not found', :vcr do
    response = YoutubeService.get_video_response("supercalifragilisticexpialadotious")

    expect(response[:items]).to eq([])
  end

  it 'will return a response for a valid country', :vcr do
    response = YoutubeService.get_video_response("laos")

    expect(response[:items]).to be_a(Array)
  end

end