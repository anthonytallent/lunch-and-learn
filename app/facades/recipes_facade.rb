class RecipesFacade
  def self.get_recipes_for_country(country)
    RecipesService.get_recipes_by_country(country)[:hits].map do |recipe|
      Recipe.new(recipe[:recipe], country)
    end
  end
end