require "rails_helper"

RSpec.describe "learning resouece facade" do
  it "can return a learning resource object with all relevant data", :vcr do
    learning_resource = LearningResourceFacade.get_learning_resource("laos")

    expect(learning_resource).to be_a(LearningResource)
    expect(learning_resource.country).to be_a(String)
    expect(learning_resource.images).to be_a(Array)
    expect(learning_resource.video).to be_a(Hash)
  end
end