require 'rails_helper'

RSpec.describe 'Recipes Facade' do
  it 'can return recipes based on a country search', :vcr do
    search = RecipesFacade.get_recipes_for_country("China")
    # binding.pry
  end
end