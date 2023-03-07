require "rails_helper"

RSpec.describe "learning resouece facade" do
  it "can return a learning resource object with all relevant data", :vcr do
    learning_resource = LearningResourceFacade.get_learning_resource("laos")

    expect(learning_resource).to be_a(LearningResource)
  end
end