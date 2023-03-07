require 'rails_helper'

RSpec.describe 'Recipes Facade' do
  it 'can return recipes based on a country search', :vcr do
    recipes = RecipesFacade.get_recipes_for_country("China")

    expect(recipes).to be_a(Array)
    expect(recipes[0].country).to be_a(String)
    expect(recipes[0].image).to be_a(String)
    expect(recipes[0].title).to be_a(String)
    expect(recipes[0].type).to be_a(String)
    expect(recipes[0].url).to be_a(String)
  end
end